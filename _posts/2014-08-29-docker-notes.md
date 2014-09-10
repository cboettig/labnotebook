---
layout: post
title: Docker tricks of the trade and best practices thoughts
---


## Best practices questions

_Here are some tricks that may or may not be in keeping with best practices, input would be appreciated._

- Keep images small: use the `--no-install-recommends` option for `apt-get`, install true dependencies rather than big metapackages (like `texlive-full`).
- Avoid creating additional AUFS layers by combining RUN commands, etc? (limit was once 42, but is now at least 127).
- Can use `RUN git clone ...` to add data to a container in place of ADD, which invalidates caching.

- Use automated builds linked to Github-based Dockerfiles rather than pushing local image builds.  Not only does this make the Dockerfile transparently available and provide a link to the repository where one can file issues, but it also helps ensure that the image available on the hub gets its base image (`FROM` entry) from the hub instead of whatever was available locally. This can help avoid various out-of-sync errors that might otherwise emerge.

### Docker's use of tags

Unfortunately, Docker seems to use the term `tag` to refer both to the label applied to an image (e.g. in `docker build -t imagelabel .` the `-t` argument "tags" the image as 'imagelabel' so we need not remember its hash), but also uses `tag` to refer to the string applied to the end of an image name after a colon, e.g. `latest` in `ubuntu:latest`.  The latter is the definition of "tags" as listed under the "tags" tab on the Docker Hub.  Best practices for this kind of tag (which I'll arbitrarily refer to as a 'version tag' to distinguish it) are unclear.

One case that is clear is tagging specific versions.  Docker's automated builds lets a user link a "version tag" to either to a branch or a tag in the git history. A "branch" in this case can refer either to a different git branch or merely a different sub-directory. Matching to a Git tag provides the most clear-cut use of the docker version-tag; providing a relatively static version stable link.  (I say "relatively" static because even when we do not change the Dockerfile, if we re-build the Dockerfile we may get a new image due the presence of newer versions of the software included.  This can be good with respect to fixing security vulnerabilities, but may also break a previously valid environment).

The use case that is less clear is the practice of using these "version tags" in Docker to indicate other differences between related images, such as `eddelbuettel/docker-ubuntu-r:add-r` and `eddelbuettel/docker-ubuntu-r:add-r-devel`.  Why these are different tags instead of different roots is unclear, unless it is for the convenience of multiple docker files in a single Github repository.  Still, it is perfectly possible to configure completely separate docker hub automated builds pointing at the same Github repo, rather than adding additional builds as tags in the same docker hub repo.


Docker linguistics borrow from git terminology, but it's rather dangerous to interpret these too literally.


## Keeping a clean docker environment

- run interactive containers with `--rm` flag to avoid having to remove them later.

- Remove all stopped containers:

```bash
docker rm $(docker ps -a | grep Exited | awk '{print $1}')
```


- Clean up un-tagged docker images:

```bash
docker rmi $(docker images -q --filter "dangling=true")
```


- Stop and remove all containers (including running containers!)

```bash
docker rm -f $(docker ps -a -q)
```


## Docker and Continuous Integration

- We can install but cannot run Docker on [Travis-CI](http://travis.org) at this time.  It appears the linux kernel available there is much too old.  Maybe when they upgrade to Ubuntu 14:04 images...

- We cannot run Docker on the docker-based [Shippable-CI](http://shippable.com) (at least without a vagrant/virtualbox layer in-between).  Docker on Docker is not possible (see below).

- For the same reason, we cannot run Docker on [drone.io](http://drone.io) CI. However, Drone provides an open-source version of it's system that can be run on your own server, which unlike the fully hosted offering, permits custom images. Unfortunately I [cannot get it working](https://github.com/drone/drone/issues/54) at this time.

## Docker inside docker:

We cannot directly install docker inside a docker container.  We can get around this by adding a complete virtualization layer -- e.g. docker running in vagrant/virtualbox running in docker.

Alternatively, we can be somewhat more clever and tell our docker to simply use a different volume to store its AUFS layers. Matt Gruter has a [very clever example](https://github.com/mattgruter/dockerfile-doubledocker) of this, which can be used, e.g. to run a Drone server (which runs docker) inside a Docker container ([mattgruter/drone](http://registry.hub.docker.com/u/mattgruter/drone/)).

I believe this only works if we run the outer docker image with `--privileged` permissions, e.g. we cannot use this approach on a server like Shippable that is dropping us into a prebuilt docker container.







