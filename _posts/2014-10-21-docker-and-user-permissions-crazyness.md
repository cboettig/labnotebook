---
layout: post
category: computation
tags:
- docker
---


Lots of crazyness getting to the bottom of permissions changes, as discussed in:

- [rocker issues tracker](https://github.com/rocker-org/rocker/issues/50)
- [Stackoverflow question](http://stackoverflow.com/questions/26500270)
- [Docker mailing list](https://groups.google.com/forum/#!topic/docker-user/VFdFuZ4Ze_A)

Long story short: docker cares only about UIDs, so we have to explicitly make sure these match.  Some very good answers including from Docker core-team members on the discussion list.  Overall approach outlined at the end of the rocker issues tracker.  


Here's the SO version of the question, for my reference:

-------


Consider the following trivial Dockerfile:



    FROM debian:testing
    RUN  adduser --disabled-password --gecos '' docker
    RUN  adduser --disabled-password --gecos '' bob 

in a working directory with nothing else. Build the docker image: 

    docker build -t test .

and then run a bash script on the container, linking the working directory into a new subdir on bob's home directory:

    docker run --rm -it -v $(pwd):/home/bob/subdir test 

Who owns the contents of `subdir` on the container? On the container, run:
    
    cd /home/bob/subdir
    ls -l

ad we see:

    -rw-rw-r-- 1 docker docker 120 Oct 22 03:47 Dockerfile

Holy smokes! `docker` owns the contents!  Back on the host machine outside the container, we see that our original user still owns the `Dockerfile`. Let's try and fix the ownership of `bob`'s home directory. On the container, run:

    chown -R bob:bob /home/bob
    ls -l 

and we see: 

    -rw-rw-r-- 1 bob bob 120 Oct 22 03:47 Dockerfile

But wait! outside the container, we now run `ls -l`

    -rw-rw-r-- 1 1001 1001 120 Oct 21 20:47 Dockerfile

we no longer own our own file.  Terrible news!  

----------

If we had only added one user in the above example, everything would have gone more smoothly.  For some reason, Docker seems to be making any home directory owned by the _first_ non-root user it encounters (even if that user is declared on an earlier image).  Likewise, this _first_ user is the one that corresponds to the same ownership permissions as my home user. 

**Question 1** Is that correct?  Can someone point me to documentation of this, I'm just conjecturing based on the above experiment. 

**Question 2**: Perhaps this is just because they both have the same numerical value on the kernel, and if I tested on a system where my home user was not id `1000` then permissions would get changed in every case?

**Question 3**: The real question is, of course, 'what do I do about this?' If `bob` is logged in as `bob` on the given host machine, he should be able to run the container as `bob` and not have file permissions altered under his host account.  As it stands, he actually needs to run the container as user `docker` to avoid having his account altered.  


I hear you asking _Why do I have such a weird Dockerfile anyway?_. I wonder too sometimes. I am writing a container for a webapp (RStudio-server) that permits different users to log in, which simply uses the user names and credentials from the linux machine as the valid user names.  This brings me the perhaps unusual motivation of wanting to create multiple users.  I can get around this by creating the user only at runtime and everthing is fine.  However, I use a base image that has added a single `docker` user so that it can be used interactively without running as root (as per best practice).  This ruins everything since that user becomes the _first_ user and ends up owning everything, so attempts to log on as other users fail (the app cannot start because it lacks write permissions).  Having the startup script run `chown` first solves this issue, but at the cost of linked volumes changing permissions (obviously only a problem if we are linking volumes).  
