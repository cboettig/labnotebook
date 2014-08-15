---
layout: post
categories: open-science
tags:
- blog
- docker

---


Ticking through a few more of the challenges I raised in my [first post on
docker](http://www.carlboettiger.info/2014/08/07/too-much-fun-with-docker.html);
here I explore some of the issues about facilitating interaction with a
docker container so that a user's experience is more similar to working
in their own environment and less like working on a remote terminal
over ssh. While technically minor, these issues are probably the first
stumbling blocks in making this a valid platform for new users.


## Sharing a local directory

Launch a bash shell on the container that shares the current working
directory of the host machine (from `pwd`) with the `/host` directory
on the container (thanks to Dirk for this solution):

```bash
docker run -it -v $(pwd):/host cboettig/ropensci-docker /bin/bash
```

This allows a user to move files on and off the container, use a familiar
editor and even handle things like git commits / pulls / pushes in
their working directory as before.  Then the code can be executed in the
containerized environment which handles all the dependencies.  From the
terminal docker opens, we just `cd /host` where we find our working
directory files, and can launch R and run the scripts. A rather clean
way of maintaining the local development experience but containerizing
execution.

In particular, this frees us from having to pass our git credentials etc
to the container, though is not so useful if we're wanting to interact
with the container via the RStudio server instead of R running in the
terminal. (More on getting around this below).

Unfortunately, Mac and Windows users have to run Docker inside an
already-virualized environment such as provided by `boot2docker`
or `vagrant`.  This means that it is only the directories on the
virtualized environment, not those on the native OS, can be shared in
this way.  While one could presumably keep a directory synced between
this virtual environment and the native OS, (standard in in `vagrant`),
this is a problem for the easier-to-use `boot2docker` at this time:
([docker/issues/7249](https://github.com/docker/docker/issues/7249)).



## A Docker Desktop

Dirk brought this
[docker-desktop](http://blog.docker.com/2013/07/docker-desktop-your-desktop-over-ssh-running-inside-of-a-docker-container)
to my attention; which uses Xpra (in place of X11 forwarding) to provide a
window with fluxbox running on Ubuntu along with common applications like
libreoffce, firefox, and rox file manager.  Pretty clever, and worked
just fine for me, but needs Xpra on the client machine and requires
some extra steps (run the container, query for passwords and ports,
run ssh to connect, then run Xpra to launch the window). The result is
reasonably responsive but still slower than virtualbox, and probably
too slow for real work.

## Base images?

The basic Ubuntu:14.04 seems like a good lightweight base image (at
192 MB), but other images try to give more useful building blocks, like
[phusion/baseimage](https://github.com/phusion/baseimage-docker#contents)
(423 MB). Their `docker-bash` script and other utilities provide some
handy features for managing / debugging containers.

## Other ways to share files?

Took a quick look at this [Dockerfile for running
dropbox](https://github.com/gfjardim/docker-dropbox/blob/master/Dockerfile),
which works rather well (at least on a linux machine, since it requires
local directory sharing). Could probably be done without explicit linking
to local directories to faciliate moving files on and off the container.
Of course one can always scp/rsync files on and off containers if ssh
is set up, but that is unlikely to be a popular solution for students.


While we have rstudio server running nicely in a Docker container for
local or cloud use, it's still an issue getting Github ssh keys set up
to be able to push changes to a repo. We can get around this by linking
to our keys directory with the same `-v` option shown above.  We still
need a few more steps: setting the Git username and email, and running
`ssh-add` for the key.  Presumably we could do this with environmental
variables and some adjustment to the Dockerfile:

```bash
docker run -it -v /path/to/keys:/home/rstudio/.ssh/ -e "USERNAME=Carl Boettiger" -e "EMAIL=cboettig@example.org" cboettig/ropensci-docker
```

which would prevent storing these secure values on the image itself.


