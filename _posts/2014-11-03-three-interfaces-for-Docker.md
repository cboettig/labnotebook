---
layout: post
category: computation
tags:
- docker
- blog
---

Here I outline three broad, different strategies for incorporating Docker into a user's workflow, particularly from the perspective of an instructor getting a group of students up and running in a containerized environment, but also in the context of more generic collaborations.  The options require progressively more setup and result in a progressively more 'native' feel to running Docker.  My emphasis is on running Dockerized R applications and RStudio, though much the same thing can be accomplished with iPython notebooks and many other web apps.

Of course the great strength of Docker is the relative ease with which one can move between these three strategies while using the identical container, maintaining a consistent computational environment in each case.


Web-hosted Docker
-----------------

In this approach, RStudio-server is deployed on a web server and accessed through the browser. The use of Docker containers makes it easier for an instructor to deploy a consistent environment quickly with the desired software pre-installed and pre-configured.  

### Advantages: ###

- A user just needs a web browser and the URL of the server.
- No need to install any local software.
- No need to download big files.
- Should work with any device that supports a modern browser, including most tablets.
- Convenient to temporarily scale computation onto a larger system.

### Disadvantages: ###

- requires a network connection (at all times)
- requires access to a server with sufficient computational power for the task.
- Someone has to manage user & network security (as with any web server).
- Need additional mechanisms for moving files on and off the server, such as git. 
- No native interfaces available, must manage files, edit text etc. through the RStudio IDE

### Setup: ###

A Docker container running RStudio can be deployed with a single command, see [rocker wiki instructions on RStudio](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image) for details. The instructor or team-member responsible for the setup would simply need to install docker on server. If multiple students will be accessing a single RStudio-server instance, it must be configured for multiple users.  Alternately multiple containers can be run on different ports of the same server. (See wiki). 

Hint: Users can also take advantage of the new R package [analogsea](https://github.com/sckott/analogsea) to quickly launch and manage an RStudio Server instance on the Digital Ocean cloud platform. `analogsea` can also facilitate transfers of code and other files onto and off of the server.


Self-hosted Docker
------------------

In this approach, the user installs docker (via `boot2docker`, if necessary) on their local machine, but still interacts with the container using the same web-based interface (e.g. `rstudio-server`, `ipython-notebook`) that one would use in the cloud-hosted model.

### Advantages: ### 

- No need for a network connection (at least once the container image is downloaded / transfered)
- No need to have a server available (with the associated cost and security overhead)

### Disadvantages: ###

- More initial setup: install `docker` locally, or install `boot2docker` for Mac/Windows users.
- Need to use `git` or `docker copy` to move files from the container to the host or vice versa.

Hint: Users might also check out the R package [harbor](https://github.com/wch/harbor) for interacting with Docker locally from R.

### Setup: ###

Setup is much the same as on a remote server, though there is no need to set custom usernames or passwords since the instance will be accessible only to local users.  See [rocker wiki instructions on RStudio](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image) for details. 


Integrated Docker
-----------------

This approach is the same as the self-hosted approach, except that we
link shared volumes with the host. At minimum this makes it easier to
move files on and off the container without learning git. 

An intriguing advantage of this approach is that it does not restrict
the user to the RStudio IDE as a way of editing text, managing files and
versions, etc.  Most users do not rely exclusively on RStudio for these
tasks, and may find that restriction limiting.  The integrated approach
may be more suited for experienced users who are set in their ways and
do not need a pixel-identical work environment of RStudio useful for
following directions in a classroom.  In the integrated approach, a user
can continue to rely on whatever their preferred native tools are, while
ensuring that code execution occurs (invisibly) on a Dockerized container.


### Advantages ###

- Can use native OS tools (text editors, file browsers, version control front ends, etc) for all interactions
- No network required (once image is downloaded / transfered).
- No servers required

### Disadvantages ###

- Additional setup beyond self-hosting: mapping shared volumes, managing user permissions.
- Potentially less well suited for classroom use, which may benefit from everyone using the identical RStudio interface rather than a range of different text editors, etc. (Of course one can still share volumes while using RStudio as the IDE).
- Cannot open external windows (e.g. if running R in terminal instead of RStudio, the container running R cannot open an X11 window to display plots.  Instead, a user must do something like `ggsave()` after plotting interactively to view the resulting graphic in the native file browser. (This is more tedious in base graphics that need `dev.off()` etc.).  Of course this is not an issue when using RStudio with linked volumes. 

### Setup  ###

The key here is simply to link the working directory on the host to the file system on the container.  That way any changes made to the host copy using the host OS tools are immediately available to the container, and vice versa.  Setup requires a bit more effort on Windows at this time, though is natively supported for Mac in Docker 1.3.  Some care may also be necessary not to change the permissions of the file.  See details in the [rocker wiki on shared files](https://github.com/rocker-org/rocker/wiki/Shared-files-with-host-machine)

#### aliases ####

The most aggressive form of the integrated approach is to literally alias common commands like `R` or `rstudio` as the corresponding docker calls in `.bashrc`, e.g.

```bash
alias R='docker run --rm -it --user docker -v $(pwd):/home/docker/`basename $PWD` -w /home/docker/`basename $PWD` rocker/hadleyverse R'
```
makes the command `R` launch an instance of the `rocker/hadleyverse` container sharing the current working directory.  Clearly different containers could be substituted in place of `rocker/hadleyverse`, including custom extensions.  This helps ensure that R is always run in the portable, Dockerized environment.  Other than the lack of X11 display for plots, this works and feels identical to an interactive R terminal session. 

#### Other tweaks ####

Mac/Windows users might also want to customize `boot2docker`'s resources to make more of the host computer's memory and processors available to Docker. 

