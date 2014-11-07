---
title: "Dear DockerHub users: please configure your repository links"
subtitle: "(for security's sake!)"
layout: post
category: computation
tags: 
- docker
---

The DockerHub is a great resource for discovering and distributing
Dockerfiles. Many users sharing public images take advantage of the
Docker Hub's _Automated Build_ configuration, which is excellent as this
automatically allows the Hub to display the Dockerfile and provides some
medium of security above simply downloading and running some untrusted
binary black box.

Unfortunately, far fewer users configure _Repository Links_ to trigger
builds to update even when the resulting Dockerfile is unchanged.
As a result, many excellent Docker containers that are not under
active development have not been rebuilt in several months, meaning
that they still contain widely known dangerous security flaws such as
[Shellshock](http://en.wikipedia.org/wiki/Shellshock_(software_bug))
(September 2014).

This problem is easily avoided by configuring the _Repository Links_
setting to point to the repository being used as a base image in `FROM`.
The official base images such as `debian` and `ubuntu` (e.g. the images
with no additional namespace) are regularly updated to patch security
vulnerabilities as soon as they are discovered, resulting in updates
being made every few days on average.  Setting the repository link to the
`FROM` source allows your repository to be rebuilt as soon as its base
image has been updated, ensuring that you inherit those updates.

Naturally this strategy does not help if your `FROM` image isn't an
official base image and hasn't configured _Repository Links_ (or if such a
break in the chain appears anywhere along the `FROM` recursion).  In such
cases, having a `RUN apt-get update && apt-get upgrade -y` command (or
equivalent option for your distribution) might be a good idea to make sure
that your image at least gets the latest updates, but you'll still need
to set up some automatic or manual _Build Triggers_ to ensure this is run
regularly; or better yet, just _avoid building on or using stale images_.

If you do have a reliable _Repository Links_ chain to an official image,
then `apt-get upgrade` is not necessary (and in fact is not advised in Best Practices).
Instead, make sure all images in the chain call `apt-get update` in the
same RUN line as `apt-get install -y ...`, which will ensure that cache
is broken and the latest versions of the packages are installed. See the
official [Dockerfile Best Practices](https://docs.docker.com/articles/dockerfile_best-practices/) for more information.  

---------

_NB: I'm not a security professional; this just looks like common sense usage_
