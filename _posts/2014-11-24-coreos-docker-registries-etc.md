---
layout: post
category: computing
tags: 
- infrastructure
- docker
- coreos
- digitalocean
---


## A secure docker registry ##

Running one's own docker registry is far more elegant than moving tarballs between machines (e.g. when migrating between servers, particularly for images that may contain sensitive data such as security credentials). While it's super convenient to have a containerized version of the Docker registry ready for action, it doesn't do much good without putting it behind an HTTPS server (otherwise we have to restart our entire docker service with the insecure flag to permit communication with an unauthenticated registry -- doesn't sound like a good idea).  So this meant learning how to use `nginx` load balancing, which I guess is useful to know more generally.  

### First pass: nginx on ubuntu server ###

After a few false starts, decided the [digitalocean guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-14-04) is easily the best (though steps 1-3 can be skipped by using a containerized `registry` instead). This runs `nginx` directly from the host OS, which is in some ways more straight forward but less portable. A few notes-to-self in working through the tutorial: 

- Note: At first, nginx refuses to run because there's was `default` configuration in `cd /etc/nginx/sites-enabled` that tries to create a conflict.  Remove this and things go pretty nicely.

- Note: Running the registry container explicitly on port `127.0.0.1` provides an internal-only port that we can then point to from nginx. (Actually this will no longer matter when we use a containerized `nginx`, since we will simply not export these ports at all, but only expose the port of the `nginx` load balancer). Still, good to finally be aware of the difference between `127.0.0.1` and `0.0.0.0` (the publicly visible localhost, and the default if we supply only a port) in this context. 

- Note: Running and configuring `nginx` Note that keys are specific to the url. This is necessary for the server signing request, but I believe could have been omitted in the root certificate. Here's how w ego about creating a root key and certificate (`crt`), a server key, server signing request (`csr`), and then sign the latter with the former to get the server certificate. 

```bash
openssl genrsa -out dockerCA.key 2048
openssl req -x509 -new -nodes -key dockerCA.key -days 10000 -out dockerCA.crt -subj '/C=US/ST=Oregon/L=Portland/CN=coreos.carlboettiger.info'
openssl genrsa -out docker-registry.key 2048
openssl req -new -key docker-registry.key -out docker-registry.csr -subj '/C=US/ST=Oregon/L=Portland/CN=coreos.carlboettiger.info'
openssl x509 -req -in docker-registry.csr -CA dockerCA.crt -CAkey dockerCA.key -CAcreateserial -out docker-registry.crt -days 10000
```
Note that we also need the `htpasswd` file from above, which needs `apache2-utils` and so cannot be generated directly from the CoreOS terminal (though the `openssl` certs can): 

```
sudo htpasswd -bc /etc/nginx/docker-registry.htpasswd $USERNAME $PASSWORD
```

Having created these ahead of time, I end up just copying my keys into the Dockerfile for my `nginx` instance (if we generated them on the container, we'd still need to get `dockerCA.crt` off the container to authenticate the client machines.  Makes for a simple Dockerfile that we then build locally: 


```
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y apache2-utils curl nginx openssl supervisor
COPY docker-registry /etc/nginx/sites-available/docker-registry
RUN ln -s /etc/nginx/sites-available/docker-registry /etc/nginx/sites-enabled/docker-registry

## Copy over certificates ##
COPY docker-registry.crt /etc/ssl/certs/docker-registry 
COPY docker-registry.key /etc/ssl/private/docker-registry 
COPY docker-registry.htpasswd /etc/nginx/docker-registry.htpasswd


EXPOSE 8080

## use supervisord to persist
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
```


Note that we need to install the `dockerCA.crt` certificate on any client that wants to access the private registry. On Ubuntu this looks like: 

```bash
sudo mkdir /usr/local/share/ca-certificates/docker-dev-cert
sudo cp devdockerCA.crt /usr/local/share/ca-certificates/docker-dev-cert
sudo update-ca-certificates 
sudo service docker restart
```

But on CoreOS we use a different directory (and restarting the docker service doesn't seem possible or necessary):

```bash
sudo cp dockerCA.crt /etc/ssl/certs/docker-cert
sudo update-ca-certificates  
```


- Note: Could not get the official `nginx` container to run the `docker-registry` config file as `/etc/nginx/nginx.conf`, either with or without adding `daemon off;` at the top of `/etc/nginx/nginx.conf`.  With, it complains this is a duplicate, (despite being recommended on the [nginx container documentation](https://registry.hub.docker.com/_/nginx), though admittedly this already appears in the default command `["nginx" "-g" "daemon off;"]`).  Without, the error says that `upstream` directive is not allowed here. Not sure what to make of these errors, ended up running an ubuntu container and then just installing `nginx` etc following the digitalocean guide. Ended up dropping the `daemon off;` from the config file and running `service nginx start` through `supervisord` to ensure that the container stays up.  Oh well.  

- Note: I got a 502 error when calling `curl` against the the `nginx` container-provided URL (with or without SSL enabled), since from inside the `nginx` container we cannot access the host addresses.  The simplest solution is to add `--net="host"` when we `docker run` the `nginx` container, but this isn't particularly secure.  Instead, we'll link directly to the ports of the `registry` container like this:

```bash
docker run  --name=registry -p 8080:8080 registry
docker run --name=nginx --net=container:registry nginx
```

Note that we do not need to export the registry port (e.g. `-p 5000:5000`) at all, but we do need to export the `nginx` load-balancer port _from the `registry` container_ first, since we will simply be linking it's network with the special `--net=container:registry`.

Note that we would probably want to link a local directory to provide persistent storage for the `registry`; in the above example images committed to registry are lost when the container is destroyed. 

We can now log in:

```bash
docker login https://<YOUR-DOMAIN>:8080
```

We can now reference our private registry by using its full address in the namespace of the image in commands to `docker pull`, `push`, `run` etc.  

## Migrating gitlab between servers ##

This migration was my original motivation to configure the private docker registry; ironically it isn't necessary for this case (though it's useful for the drone image, for instance). 

Note that there is no need to migrate the redis and postgresql containers manually.  Migrating the backup file over to the corresponding location in the linked volume and then running the backup-restore is sufficient.  Upgrading is also surprisingly smooth; we can backup (just in case), then stop and remove the container (leaving the `redis` and `postgresql` containers running), pull and relaunch with otherwise matched option arguments and the upgrade runs automatically.

When first launching the `gitlab` container on a tiny droplet running coreos, my droplet seems invariably to hang.  Rebooting from the digitalocean terminal seems to fix this. A nice feature of `fleet` is that all the containers are restarted automatically after reboot, unlike when running these directly from `docker` on my ubuntu machine.

## Notes on fleet unit files ## 

Fleet unit files are actually pretty handy and straight forward.  One trick is that we must quote commands in which we want to make use of environmental variables. For instance, one must write:

```
Environment="VERSION=1.0"
ExecStart=/bin/bash -c "/usr/bin/docker run image:${VERSION}"
```

in a `Service` block, rather than `ExecStart=/usr/bin/docker run ...` directly, for the substitution to work. It seems if we are using the more standard practice of environment files (which after all is the necessary approach to avoid having to edit the unit file directly one way or another anyway), we can avoid the `bin/bash` wrapper and insert the environment reference directly.

If we're not doing anything fancy wrt load balancing between different servers, we don't have that much use for the corresponding "sidekick" unit files that keep our global `etcd` registry up to date. Perhaps these will see more use later.  


## Cloud-config ##

Note that we need to refresh the discovery url pretty-much anytime we completely destroy the cluster.

A few edits to my cloud-config to handle initiating swap, essential for running most things (gitlab, rstudio) on tiny droplets. Still requires one manual reboot for the allocation to take effect. Adds this to the `units` section of `#cloud-config`:

```
    ## Configure SWAP as per https://github.com/coreos/docs/issues/52
    - name: swap.service
      command: start
      content: |
        [Unit]
        Description=Turn on swap

        [Service]
        Type=oneshot
        Environment="SWAPFILE=/1GiB.swap"
        RemainAfterExit=true
        ExecStartPre=/usr/sbin/losetup -f ${SWAPFILE}
        ExecStart=/usr/bin/sh -c "/sbin/swapon $(/usr/sbin/losetup -j ${SWAPFILE} | /usr/bin/cut -d : -f 1)"
        ExecStop=/usr/bin/sh -c "/sbin/swapoff $(/usr/sbin/losetup -j ${SWAPFILE} | /usr/bin/cut -d : -f 1)"
        ExecStopPost=/usr/bin/sh -c "/usr/sbin/losetup -d $(/usr/sbin/losetup -j ${SWAPFILE} | /usr/bin/cut -d : -f 1)"

        [Install]
        WantedBy=local.target

    - name: swapalloc.service
      command: start
      content: |
        [Unit]
        Description=Allocate swap

        [Service]
        Type=oneshot
        ExecStart=/bin/sh -c "sudo fallocate -l 1024m /1GiB.swap && sudo chmod 600 /1GiB.swap && sudo chattr +C /1GiB.swap && sudo mkswap /1GiB.swap"

```

More probably be structured more elegantly, but it works.  (Not much luck trying to tweak this into a bunch of `ExecStartPre` commands though.  


## NFS sharing on CoreOS? ##

Couldn't figure this one out.  [My SO Q here](http://serverfault.com/questions/647014/share-disks-through-nfs-on-a-coreos-cluster)
