---
layout: post
published: false
title: Reproducible research environments with Docker
subtitle:
category: open-science
tags:
- docker
- ropensci
- r
---


Academic research takes place in computational environments of continually
increasing complexity.  This creates ever-higher barriers not only to
reproducing or extending the results of other researchers, but also
barriers to collaboration and training of new researchers.

Wouldn't it be nice if we could all work in equivalent computing
environments, such that whatever worked for me on my computer would work
for you on yours?  Wouldn't it be nice if we could just clone and copy
our entire software environment when we needed to move our computations
over to a more powerful cloud or cluster computer?  Or perhaps roll back
our environment to the state when everything was working yesterday?



## Reproducibility and R

The situation for users for R is much better than most, since CRAN not
only handles most dependencies but provides binaries for most major
operating systems.  Though subsequent changes in packages can break this
chain and cause scripts that once worked to no longer due so, emerging
solutions like [packrat](https://github.com/rstudio/packrat) try to tackle this problem.

Nevertheless, R is not immune from these issues.  Many packages make
use of code libraries from other languages, from `pandoc`'s system for
rendering documents to interfaces with SQL databases, to manipulation of
other formats like XML, to highly optimized linear algebra libraries.
While an experienced user following careful documentation can usually
install the appropriate libraries to create a functionally equivalent
system, this raises substantial barriers for collaborators, students,
and others.  A [reproducibility study at NESCENT](https://storify.com/hlapp/reproducibility-repeatability-bigthink) recently found
that even computationally savvy experts (though not necessarily specific to
the computer language or domain in question) working with code provided by
authors who were explicitly committed to reproducibility (including me),
could not even reconstruct the necessary computational environment. This
inability to install all the correct components for software to run in
the same way as it did for the original researchers is commonly known
as 'dependency hell' and has often been shown as the primary cause
that computational components of research could not be replicated,
(not least because it is one of the very first steps required before
replication can be attempted).

Just about anyone who has taught a course involving running software in
class will be familiar with the challenges and lost instruction time
from installing such dependencies on student's machines.  Even when all
dependencies are installed successfully, there is a risk that these changes
will break some of the user's existing code by altering it's environment.



## Jumping in


- [Install Docker](https://docs.docker.com/installation) for your
operating system using `boot2docker`. (Note the Linux instructions do not
require boot2docker. I recommend the 1-line curl-script install method
for Ubuntu).  Now you can launch `boot2docker` to open a terminal window
from where we will run Docker. NOTE: RStudio example requires Docker
version `>= 1.2`.

There's several different ways we can interact with the container.
The simplest approach is just run an R terminal on the container:

```bash
sudo docker run --rm -it cboettig/rstudio /usr/bin/R
```

This should open up the R command line in the current window.

- Download and run an RStudio server instance:

```bash
sudo docker run -d -p 8787:8787 cboettig/rstudio
```

(These commands will be slow on the first run since the image must be
downloaded.  Afterwards they should be pretty quick.)

- You can now reach your RStudio server at
`http://<system_ip_address>:8787`.  For Windows/Mac users, run
`boot2docker ip` to get the value of `system_ip_address`. (This should be
`http://92.168.59.103:8787` but may vary as it is set dynamically).

For Linux users, you can just use `http://localhost:8787`.  For cloud
instances, check your server's public IP address, and append the port
(`:8787`)..

- Login using the default rstudio:rstudio for user:pw, or configure
particular users (see below).




## Options

- Replace `cboettig/rstudio` with `cboettig/ropensci` to run a richer
(but larger) development environment.  See below for details.

- Set user name and password using environmental variables, e.g.

```bash
docker run -d -p 8787:8787 -e USER=<username> -e PASSWORD=<password> -e EMAIL=you@somewhere.com cboettig/rstudio
```

- Link the container to a local folder (directory) using the `-v` option:

```bash
docker run --rm -it -v $(pwd):/home/rstudio/$(basename "$PWD") cboettig/rstudio /usr/bin/R
```

Note that in this example we have launched an interactive R terminal,
rather than an RStudio server.  This linking would work just as well
with RStudio-server.  However, because we have linked the working
directory to the container, we are now free to use all our favorite
tools from our native operating system to edit and manage our files,
rather than being confined to RStudio.


Note that the volumes link (`-v`) is just taking the path to the
directory on the host followed by the path where it should appear inside
the container.  We could specify these manually, but `$(pwd)` is just
a convenient way to get the full path of the current working directory,
and `$basename "$PWD"` a way to get just the name of that directory. So
if working in `foo`, the directory `/path/to/foo` would be found at
`/home/rstudio/foo` on the container.  Here we're using the default user,
`rstudio`, but you would want to change that if specifying a different
user name as shown in the previous example.

Linking files on a Mac or PC requires an extra step.  This links us to
the `boot2docker` volume, but we still must link boot2docker virtual
machine to the host OS. It seems like `boot2docker` may still be working
on this issue.  Meanwhile, it is straight-forward to do this linking by
using [vagrant](http://vagrantup.com) to launch boot2docker.  I discuss
this below.

- Download and run an RStudio server instance: `sudo docker run -d -p
8787:8787 cboettig/rstudio`

- You can now reach your RStudio server
at `http://<system_ip_address>:8787`.  For Windows/Mac users, run
`boot2docker ip` to get the value of `system_ip_address`. (This should
be `http://92.168.59.103:8787` but may vary as it is set dynamically).
For linux users, you can just use `localhost`.  For cloud instances,
check your server's public IP address.

- login using the default `rstudio:rstudio` for `user:pw`, or configure particular users (see below).



## RStudio on Digital Ocean ##

Docker also makes it very fast and easy to deploy an RStudio instance in the
cloud, along with a complete computational environment pre-installed.

### Enable swapping if testing on the smallest image ###

The smallest Digital Ocean servers have only 512 MB of memory and no
swap enabled.  Adding swap lets the machine cache things it doesn't
need in active memory, which can be important for running things like
`install.packages`.  On larger droplets this probably is not so much of
an issue.  Here, we enable 4GB of swap on a tiny instance.  SSH into your
cloud server (or use the shell DigitalOcean provides in the browser),
and run:

```bash
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```


### Log in and compute! ###






### Remote Linux clusters without root ###

You can run the docker images on a remote linux cluster where you don't
have root access, even if it doesn't have a web-accessible API (such as
a university server).  Ask your friendly system administrator to install
vagrant and virtualbox.  Then we can use a lightweight virtualbox in
which we can run Docker (this is just what boot2docker does in windows
and mac, in fact, we'll use an image based on boot2docker since it has
just what we need, and at just 24 MB is way smaller than a standard
ubuntu virtualbox image).

A Vagrantfile for getting up and running with this image is found in the
`vagrant` directory.  This handles exporting ports to the host machine,
and sharing files with the host machine (which can also be tricky
for boot2docker users on Mac/Windows, so this might be a work-around
for them).  Run this image with:

```bash
vagrant up
```

You may want to first adjust the Vagrantfile to allocate more or less
memory and CPU nodes to the virtual machine.  Vagrant's default is 512 MB
and 1 CPU, though the file currently puts this at 2 CPUS and 1024 MB RAM.

You can now connect to the RStudio server using some ssh port forwarding:

```bash
ssh -o "ExitOnForwardFailure yes" -f -N -L 8787:localhost:8888 <your.server>
```

The first number (8787) is the port we want things to appear on localhost,
e.g. we can now connect by visiting http://localhost:8787.  The second
(8888) is the port we configured for the host machine with Vagrant.

Note that sometimes you need to tunnel through a head node to the compute
node where you want R to be running, replacing `<your.server>` with:

```bash
ssh <head.node.name> nc -q0 <compute.node.name> 22
```



