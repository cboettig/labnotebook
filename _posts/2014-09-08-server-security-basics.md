---
layout: post
category: computing
tags:
- digitalocean
- docker
---


## Security configuration

We set up SSH key-only login on non-standard port, with root login forbidden. We then set up `ufw` firewall, `fail2ban`, and `tripwire`.

1. Configure an [SSH key login](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2). Next, [Create a user, add to sudoers, and then disable root
login.](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-12-04).  Edits `/etc/ssh/sshd_config`:

  - Disabling root logins.  (We'll need to add ourselves to sudo first: (`adduser`, edit `/etc/sudoers`)
  - Change ssh port from default to something else.
  - Whitelist user login ids

Additionally, let's be sure to disable password authentication: Add `PasswordAuthentication no` to `/etc/ssh/sshd_config`.  (editing PermitRootLogin only doesn't do this).


Locally add an entry in `~/.ssh/config` to alias the host and port to
avoid having to remember these numbers for login.  Run `ssh-copy-id
<droplet-ip>` to enable key-based login for the user.


2. [Install and
configure](https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server)
`ufw` firewall.  As we're not using the default `ssh` port, we need to explicitly tell `ufw` which ssh port to allow.

```
sudo ufw allow <PORT>/tcp
```

(The `/tcp` part is optional, saying only allow `tcp` protocol
over that port, not other protocols.)

We must also tell ufw to [allow
Docker](http://docs.docker.com/installation/ubuntulinux/#docker-and-ufw):
In `/etc/default/ufw` change `DEFAULT_FORWARD_POLICY` to ACCEPT, then:

```bash
sudo ufw reload
sudo ufw allow 2375/tcp
```

and similarly allow any ports we export for our various services (Gitlab, Drone, etc).

3. [Install and
configure](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-12-04)
`fail2ban`. Prevents brute force password attacks.  Be sure to assign the config to match chosen ssh port.

4. [Install and
configure](https://www.digitalocean.com/community/tutorials/how-to-use-tripwire-to-detect-server-intrusions-on-an-ubuntu-vps)
`tripwire` (intrusion detection).

5. Update software:

```bash
sudo apt-get -q update && sudo apt-get -qy dist-upgrade
```

and then also update tripwire log:

```bash
sudo tripwire --check --interactive
```

Note: Clearly all these steps need to be running on the server itself, not merely in a container image deployed on server so that they are securing access to the actual host.



## Additional configuration

While we're doing things, add user to the
docker group for convenience: `sudo addgroup cboettig docker`

[Enable swap](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-12-04) on a small instance. Here we set up 1GB of swap (setting swap at twice the available RAM is the recommended rule-of-thumb, though makes less sense once RAM is large)

```bash
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

To make this persistant on reboot edit `/etc/fstab`:

```bash
sudo echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab
```

For better performance, we might tweak swappiness to 10 (default is 60 out of 100, where 0 is never swap and 1 is swap frequently):

```bash
echo 10 | sudo tee /proc/sys/vm/swappiness
echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf
```

Set ownership

```bash
sudo chown root:root /swapfile
sudo chmod 0600 /swapfile
```

## Server modules

Running different services as their own docker containers offers serveral
advantages:

- Containers often make it easier to install and deploy existing services,
since the necessary configuration is scripted in the Dockerfile and we can
often find Dockerfiles already made on [Docker Hub](http://hub.docker.com)
for common services. This note illustrates several examples.

- Containers may provide an added level of stability, since they run
largely in isolation from each other.

- Containers can be [resource
limited](http://stackoverflow.com/questions/16084741/how-do-i-set-resources-allocated-to-a-container-using-docker),
e.g.

```bash
docker run -it -m 100m -c 100 ubuntu /bin/bash
```

would provide the container with 100 MB of RAM and 100 "shares" of CPU
(acts kind of like a niceness, where the default share of a container
is 1024. On multicore machines you can also pass `--cpuset "0"` or
`--cpuset "0,1"` etc, which is a list of which cpus (numbered 0 to n-1,
as in `/proc/cpuinfo`) the container is permitted to use.

As noted in the link, restricting disk space is more tricky, though
might become easier down the road.


### ssh server:

Permit users to ssh directly into a container rather than access the server itself. Despite its simplicity, I found this a bit tricky to set up correctly, particularly in managing users.

Here's the basic Dockerfile for an image we'll call `ssh`.  This creates a user given by the environmental variable.  A few tricks:

- We use `adduser` instead of `useradd` so that we get the home directory for the user created and granted the correct permissions automaticalliy. We need the `--gecos` information so that we're not prompted to enter the user's full name etc. We use `--disabled-password` rather than set a password here.
-  Login is still possible through ssh key (as well as through nsenter on the host machine).  We go ahead and add the ssh key now, though this could be done after the container is running by using nsenter.
- In this dockerfile, we've added the user to `sudo`ers group for root access on the container (installing software, etc).  This won't be active until the user has a password.

```
FROM     ubuntu:14.04
ENV USER cboettig
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo
ADD authorized_keys /home/$USER/.ssh/authorized_keys
RUN chown $USER /home/$USER/.ssh/authorized_keys
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
```

When building the image, note that a copy of `authorized_keys` (contains the contents of the `id_rda.pub` public key) file must be found in the same directory as the Dockerfile so that it can be added to the image.

Start the ssh server on port 2200:

```
docker run -d -p 2200:22 --name="ssh" ssh
```

Add to the firewall permissions

```
sudo ufw add 2200/tcp
```

From here I can now ssh in from the computer housing the private key pair to the public key
that is added to the image here.  However, that user doesn't have root access since we haven't
provided a password.

Use `nsenter` to enter the instance:

```bash
docker run -v /usr/local/bin:/target jpetazzo/nsenter
nsenter -m -u -n -i -p -t `docker inspect --format '{{.State.Pid}}' ssh` /bin/bash
```

Create a password for the user to enable root access:

```bash
echo '$USER:<password>' | chpasswd
```

We can create other users and add them to sudoers or not as desired, e.g. add interactively using:

```bash
useradd <username>
```

users can later change their passwords once they log in.


## Restoring containers when restarting

A certain times we need to power cycle the server (e.g. after certain software updates), using the `sudo reboot now` command or the DigitalOcean console.  Any running containers will be automatically stopped.  Once the machine is back up and we log back in, these containers can be brought back up with `docker restart <container_id>` (or `<container_name>`), and then everything is back to normal.

Note that while we can stop and restart a container, it seems we cannot simply save a container (e.g. with `docker commit` or `docker save` and re-run it and expect the server functionality to be restored after the container is destroyed (e.g. by `docker rm -f`).  (See previous notes 2014-09-05) for an illustration of this problem. This occurs because the container image does not include the volume where it writes its data, and that volume address is generated uniquely each time a container is run.

Consequently, a different (probably more traditional) approach is needed to backup the configuration of a server such as Gitlab or Drone-CI even when running in a container.  Will explore this later.

Meanwhile, remember remove unneeded containers with

```bash
docker rm $(docker ps -a | grep Exited | awk '{print $1}')
```

and not with `-f` (destroying running containers!)


## Key security

We can largely avoid needing a private ssh key for the server, though may use https authentication to let us use git (rather than, say, rsync) to develop and save changes made remotely (say, through RStudio server).

### Backing up keys

Probably unnecessary to have a backup of the ssh private RSA key, as we can access the DigitalOcean Server or Github through the web consoles and add a new public key and replace our private key.


