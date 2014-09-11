---
layout: post
category: computation
tags:
- docker
---

## Drone CI: Continous integration in custom docker environments

Having gotten accustomed to Docker, configuring the appropriate build environment for a Continuous Integration system like Travis CI or Shippable CI starts to feel incredibly tedious and archaic (particularly if you work primarily in a language like R or haskell that usually isn't supported out of the box).


- We do not have to hack together a custom image environment
- We can build and test our environment locally instead of having to rely on trial-and-error pushes to the CI server
- We do not have to download, compile and install the development environment each time, (which frequently takes longer than the CI checks themselves and can break)


(Shippable provides a persistent environment too, by preserving the state of your 'minion'.  But unlike Shippable, I believe the Drone approach is unlikely that you can create troublesome side-effects in your environment, such as removing a necessary dependency from the `shippable.yml` and yet not catching it since the dependency is still available on the minion from before.  In the Drone approach, we start on the same docker image each time, but merely avoid the few minutes it might take to download that image).

Unfortunately, custom images are not available on the fully hosted [drone.io](http://drone.io) system.  (Though perhaps they'd accept pull requests that would add an R environment to [their image library](https://github.com/drone/images)).  Fortunately, the Drone team kindly provides an [open source version](https://github.com/drone.drone) of their platform that can be hosted on a self-hosted / private server (such as the new web darling DigitalOcean or Amazon's EC2).  This has other advantages as well -- such as using privately hosted repositories (it also integrates with BitBucket and GitLab) or running very long tests / simulations (since we're now paying for the server time ourselves, after all).


## The easy way: use docker

We can deploy the Drone CI server somewhat more seamlessly by running it in a container itself.  Rather than worry about the above configuration, we can simply launch an existing docker image for Drone, rather cleverly created by Matt Gruter:

```bash
docker run --name='drone' -d -p 8080:80 --privileged mattgruter/drone
```
- Now we can follow the [setup instructions](http://drone.readthedocs.org/en/latest/setup.html). Be sure to use the matching case in the application name (`Drone` not `drone`) and the appropriate URLs for the authorization call back.

Note that we must use a different port than 80, and that we must give this port explicitly in the Authorization callback URL: `http://localhost:8080/auth/login/github` in order to authenticate.

Also note that in this approach, the Drone CI's docker image library will be separate from the docker image library.  To manage or update the images available, we have to first `nsenter` into the Drone CI container.

This runs rather nicely on a tiny DigitalOcean droplet. Bare in mind that the tiny droplet has only 20 GB of disk space though, which can be consumed rather quickly with too many images. If many of the images use the same base templates, the total disk space required will fortunately be much lower than the sum of their virtual sizes.



### experimenting with saving images

Being a docker image, we can snapshot and export it for later use, and meanwhile can even destroy our server instance.

```bash
docker export drone > dronedroplet.tar
```
Not clear that this works. Consider saving an image instead?  Save container named drone as image named drone:droplet

```bash
docker commit drone drone:droplet
docker save drone:droplet > dronedroplet.tar
```
are these identical?

Hmm, doesn't seem to store configuration, login is no longer valid.  Starting a stopped container maintains the configuration of course, but not launching from scratch (e.g. the sqlite database is local to the container, not accessible through an externally linked volume).

Note that this tarball does not include the Drone CI image library itself, which is not part of the container but rather connected as a volume. This makes it quite a bit smaller, and that library can presumably be reconstructed from the docker hub.

## Configuring Drone CI: the hard way

- Install and launch drone: (see [drone/README](https://github.com/drone/drone))
- Add `DOCKER_OPTS="-H 127.0.0.1:4243 -d"` to `/etc/default/docker`
- Kill the docker deamon and restart docker. Or run docker with the explicit binding:

```bash
sudo docker -d -H 127.0.0.1:4243 &
```

- You may need to [configure firewall](http://docs.docker.com/installation/ubuntulinux/#docker-and-ufw), if ufw is running.
- References: [drone/issues/149](https://github.com/drone/drone/issues/149), [drone/issues/24](https://github.com/drone/drone/issues/24)
- Now we can follow the [setup instructions](http://drone.readthedocs.org/en/latest/setup.html). Be sure to use the matching case in the application name (`Drone` not `drone`) and the appropriate URLs for the authorization call back.



## Configuring an already-running docker session

Launch a named repository in deamon mode:

```bash
docker run -d -p 8787:8787 --name='drone' mattgruter/drone
```

Use a docker-based install to add `nsenter` into your executable path:

```bash
docker run -v /usr/local/bin:/target jpetazzo/nsenter
```

Run `nsenter` to log into the docker image:

{% raw %}

```
nsenter -m -u -n -i -p -t `docker inspect --format '{{ .State.Pid }}' drone` /bin/bash
```

{% endraw %}

Now we can update or delete images with `docker pull`, `docker rmi`, etc.

This is useful with many containers, for instance, with our ssh container or rstudio container we may want to modify usernames and passwords, etc:

```bash
useradd -m $USER && echo "$USER:$PASSWORD" | chpasswd
```


### Making this easier:

Add to `.bashrc`:

```bash
function dock { sudo nsenter -m -u -n -i -p -t `docker inspect --format {{.State.Pid}} "$1"` /bin/bash; }
```

This defines the function `dock` such that `dock <name>` will enter a running container named `<name>`.  Note that we have to have `nsenter` bound to the executable path as indicated above. Yay less typing.

