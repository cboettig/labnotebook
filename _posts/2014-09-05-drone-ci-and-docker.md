---
published: false
layout: post
---



## Configuring Drone CI



Add `DOCKER_OPTS="-H 127.0.0.1:4243 -d"` to `/etc/default/docker`

Kill the docker deamon and restart docker. Or run docker with the explicit binding:

```bash
sudo docker -d -H 127.0.0.1:4243 &
```

You may need to [configure firewall](http://docs.docker.com/installation/ubuntulinux/#docker-and-ufw), if ufw is running.

References: [drone/issues/149](https://github.com/drone/drone/issues/149), [drone/issues/24](https://github.com/drone/drone/issues/24)


## Configuring an already-running docker session

Launch a named repository in deamon mode:

```bash
docker run -d -p 8787:8787 --name='rstudio' cboettig/rstudio
```

Use a docker-based install to add `nsenter` into your executable path:

```bash
docker run -v /usr/local/bin:/target jpetazzo/nsenter
```

Run `nsenter` to log into the docker image:

```
nsenter -m -u -n -i -p -t `docker inspect --format '{{ .State.Pid }}' rstudio` /bin/bash
```

Modify usernames and passwords, etc:

```bash
useradd -m $USER && echo "$USER:$PASSWORD" | chpasswd
```

exit and fine that things are updated.
