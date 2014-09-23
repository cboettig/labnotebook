---
layout: post
category: computing
tags:
- docker

published: false
---


The Docker Hub makes a rather convenient continuous integration platform. For a new project, I can write a short Dockerfile much as I would a `travis.yml`, installing the extra libraries (usually R packages) I might need, and then running `Rscript -e "rmardown::render("manuscript.Rmd")` for manuscripts etc, or `R CMD check .` for packages.

Impressively, this runs faster on the Docker Hub than on my (4 core i3) laptop, even with a queue delay on the Hub.  Unfortunately, the build details are not public, though the status (Finished or Error) is, and obviously this also precludes including encrypted secure details (and hence any deployment, which would need some secure credentials, e.g. to push back to Github).  All of this is rather straight-forward to add with Drone of course, but it is nonetheles convenient to bake checks into the Dockerfile.

