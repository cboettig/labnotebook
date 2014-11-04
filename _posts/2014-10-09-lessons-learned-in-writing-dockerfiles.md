---
layout: page
category: computation
tags: 
- docker

---


Writing dockerfiles is pretty straight forward. Nevertheless, a little
extra care goes a long way.  Docker's own [Best
Practices](https://docs.docker.com/articles/dockerfile_best-practices/)
are a great starting point, covering everything from formatting to use
of certain commands. In Rocker, We've tried to follow all of these suggestions and
have found them very helpful.  In particular:

- Minimize the number of layers, but use `\` to break commands across
multiple lines,

- Always run `apt-get update && apt-get install -y ...` rather than
running updates in one layer and install in a different layer,

- Use `COPY` instead of `ADD`, `WORKDIR` instead of `cd`,

- Create a non-root user

This was tricky since we intend (and use) our dockerfiles as base images
for other Dockerfiles.  Setting the default user with `USER` would
interfere with this (adding that user to sudoers, having to use `sudo
apt-get update` or switch back to `USER root` and back again. Both `sudo`
and switching back and forth on `USER` are discouraged in best practices)

