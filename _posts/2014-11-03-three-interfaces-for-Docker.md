---
layout: post
published: false
category: computation
tags:
- docker
---

Here I outline three broad, different strategies for incoporating Docker into a user's workflow, particularly from the perspective of an instructor getting a group of students up and running in a containerized environment, but also in the context of more generic collaborations.  The options require progressively more setup and result in a progressively more 'native' feel to running Docker.  My emphasis is on running Dockerized R applications and RStudio, though much the same thing can be accomplished with iPython notebooks and many other web apps.


Web-hosted Docker
-----------------

In this approach, RStudio-server is deployed on a webserver.

### Advantages: ###

- A user just needs a web browser and the URL of the server.
- No need to install any local software.
- No need to download big files.
- Should work with any device that supports a modern browser, including most tablets.


### Disadvantages: ###

- requires a network connection
- requires access to a server with sufficient power
- Have to manage user & network security (as with any web server)
- Need additional mechanisms for moving files on and off the server, such as git. 
- No native interfaces available, must manage files, edit text etc through the RStudio IDE

### Setup: ###

The instructor or team-member responsible for the setup would simply need to install docker on server. If multiple students will be accessing a single RStudio-server instance, it must be configured for multiple users.  Alternately multiple containers can be run on different ports of the same server. 

Hint: Users can also take advantage of the new R package [analogsea]() to quickly launch and manage an RStudio Server instance on the Digital Ocean cloud platform. Analogsea can also facilitate transfers of code and other files onto and off of the server.


Self-hosted Docker
------------------

In this approach, the user 

### Advantages: ### 

- No need for a network connection (at least once the container image is downloaded / transfered)
- No need to have a server available (with the associated cost and security overhead)

### Disadvantages: ###

- More setup: install `docker` locally, install boot2docker
- Need git or `docker copy` to move files from the container to the host or vice versa.

Hint: Users might also check out the R package [harbor]() for interacting with Docker locally from R.

### Setup: ###


Integrated Docker
-----------------

This approach is the same as the self-hosted approach, except that we link shared volumes with the host. At minimum this makes it easier to move files on and off the container without learning git.

An intriguing advantage of this approach is that it does not restrict the user to the RStudio IDE as a way of editing text, managing files and versions, etc.  Most users do not rely exclusively on RStudio for these tasks, and may find that restriction limiting.  The intergrated approach may be more suited for experienced users who are set in their ways and do not need a pixel-identical work environment of RStudio useful for following directions in a classroom.  In the integrated approach, a user can continue to rely on whatever their prefered native tools are, while ensuring that code execution occurs (invisibly) on a Dockerized container.

As such, it is possible 

### Advantages ###

- Can use native OS tools (text editors, file browsers, version control front ends, etc) for all interactions
- No network required (once image is downloaded / transfered).
- No servers required

### Disadvantages ###

- Additional setup beyond self-hosting: mapping shared volumes, managing user permissions.

- Cannot open external windows (e.g. if running R in terminal instead of RStudio, the container running R cannot open an X11 window to display plots.  Instead, a user must do something like `ggsave()` after plotting interactively to view the resulting graphic in the native file browser. (This is more tedious in base graphics that need `dev.off()` etc).  Of course this is not an issue when using RStudio with linked volumes. 

### Setup  ###



#### aliases ####

The most agressive form of the integrated approach is to literally alias 

Mac/Windows users might also want to customize `boot2docker`'s resources to make more of the host computer's memory and processors available to Docker. 

