---
layout: post
published: false
title: Docker tricks of the trade
---


## Best practices questions

_Here are some tricks that may or may not be in keeping with best practices, input would be appreciated._

- Keep images small: use the `--no-install-recommends` option for `apt-get`, install true dependencies rather than big metapackages (like `texlive-full`).
- Avoid creating additional AUFS layers by combining RUN commands, etc? (limit was once 42, but is now at least 127).
- Can use `RUN git clone ...` to add data to a container in place of ADD, which invalidates caching.

## Keeping a clean docker environment

- run interactive containers with `--rm` flag to avoid having to remove them later.
- Clean up un-tagged docker images:

```bash
docker rmi $(docker images -q --filter "dangling=true")
```

- Stop and remove all containers

```bash
docker rm -f $(docker ps -a -q)
```






