---
layout: post
category: computing
tags:
- docker

---

A key challenge for reproducible research is developing solutions that
integrate easily into a researcher's existing workflow.  Having to
move all of one's development onto remote machines, into a particular
piece of workflow software or IDE, or even just constrained to a window
running a local virtual machine in an unfamiliar or primitive environment
isn't particularly appealing.  In my experience this doesn't reflect the
workflow of even those folks already concerned about reproducibility,
and is, I suspect, a major barrier in adoption of such tools.

One reason I find docker particularly attractive for reproducible research
it the idea of containerizing my development environment into something I
can transport or recreate identically anywhere, particularly on another
Linux machine. This also provides a convenient backup system for my development
environment, no need to remember each different program or how I installed
or configured it when moving to a new machine.

## Using aliases

For me, a convenient way to do this involves creating a simple alias for running
a container.  This allows me to distinguish between running any software and the
container, while managing my files and data through my native operating system
tools. I've set the following alias in my `bashrc`.


```
alias c='docker run --rm -it -v $(pwd):/home/$USER/`basename $PWD` -w /home/$USER/`basename $PWD` -e HOME=$HOME -e USER=$USER --user=$USER strata'
```

I can then just do `c R` (think `c` for container) to get R running in a container, `c bash` to drop into a bash shell on the container, `c pandoc --version` echoes the version of pandoc available on our container (or otherwise execute the container version of pandoc), and so forth.

### explanation: a non-root container

The trick here is primarily to handle permissions appropriately.  Docker is run as a root user by default, which results in any files created or modified become owned by root instead of the user, which is clearly not desirable. Getting around this requires quite a bit of trickery. The break down of each of these arguments is as follows:

- `--rm` remove this container when we quit, we don't need to let it persist as a stopped container we could later return to.
- `-it` Interactive terminal
- `-v` binds a host volume to the container. Files on the host working directory (`pwd`) will be available on the container, and changes made on the container are immediately written to the host directory:

```
-v $(pwd):/home/$USER/`basename $PWD`
```
The path after the colon specifies where this directory should live on the container: we specify in a directory that has the same name as the current working directory `basename $PWD`, located in the home directory of the user (e.g. where the user has write permissions).

- `-w` specifies the working directory we should drop into when our session on the container starts.  We set this to match the path where we have just mounted our current working directory:

```
-w /home/$USER/`basename $PWD`
```

- `-e HOME=$HOME` sets the value of the environmental variable `HOME` to whatever it is on the host machine (e.g. `/home/username`), so that when R tries to access `~/`, it gets the user's directory and not the root directory.

- `-e USER=$USER` though this seems redundant, we set the user environmental variable by default in the cboettig/rstudio image, so this overrides that environmental variable with the current user.

- `--user=$USER` Specifies the user we log in as.  This is rather important, otherwise the we find that we are the root (or whatever user has been set in the Dockerfile).  That would cause any files we generate from the container to be owned by the root user, not our local user.  Note that this only works if the specific user has already been created (e.g. by `adduser`) on the container, otherwise this will fail.

- `strata` the name of the container (could be `cboettig/ropensci`, but my `strata` image provides a few additional customizations, created by [it's own Dockerfile]().  That Dockerfile (and its FROM dependencies) specify all the software available on this container.  Importantly, it also already creates my username in it's Dockerfile.  Otherwise, the argument given above should use `--user=rstudio`, since the `rstudio` user is already created by the base image `cboettig/rstudio`, and thus available in `cboettig/ropensci` and `strata`. Note that this user can be created interactively by passing the environmental variable `-e USER=$USER` when running in deamon mode, since the user is then created by the start-up script.  However, when we provide a custom command (like `/usr/bin/R` in this example, the `CMD` from the Dockerfile is overriden and the user isn't created.



A stricter alias I considered first enforces running R as a container rather than a local operation:

```
alias R='docker run --rm -it -v $(pwd):/home/$USER/`basename $PWD` -w /home/$USER/`basename $PWD` -e HOME=$HOME --user=$USER strata /usr/bin/R'
```
## Why not separate containers per application?

A more natural / more docker-esque approach might simply be to have separate containers for each application (R, pandoc, etc).  This idealism belies the fact that I already need many of these tools installed on the same container, as they regularly interact in a deep way (e.g. R packages like `rmarkdown` already depend on pandoc), so these should really be thought of as a single development environment.
