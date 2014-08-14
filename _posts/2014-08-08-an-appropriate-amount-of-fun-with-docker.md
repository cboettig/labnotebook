---
layout: post
title: "An appropriate amount of fun with docker?"
category: open-science
tags:
- blog
- R
- docker
---


_An update on my exploration with Docker. Title courtesy of [Ted](https://twitter.com/DistribEcology/status/497523435371638784), with my hopes that this really does move us in a direction where we can spend less time thinking about the tools and computational environments. Not there yet though_


I've gotten RStudio Server working in the [ropensci-docker](https://github.com/ropensci/docker-ubuntu-r/blob/master/add-r-ropensci/Dockerfile) image (Issues/pull requests welcome!).

    docker run -d -p 8787:8787 cboettig/ropensci-docker

will make an RStudio server instance available to you in your browser at localhost:8787.  (Change the first number after the -p to have a different address).  You can log in with username:pw rstudio:rstudio and have fun.

One thing I like about this is the ease with which I can now get an RStudio server up and running in the cloud (e.g. I took this for sail on DigitalOcean.com today).  This means in few minutes and 1 penny you have a URL that you and any collaborators could use to interact with R using the familiar RStudio interface, already provisioned with your data and dependencies in place.


---------------

For me this is a pretty key development.  It replaces a lot of command-line only interaction with probably the most familiar R environment out there, online or off.  For more widespread use or teaching this probably needs to get simpler still.  I'm still skeptical that this will make it out beyond the crazies, but I'm less skeptical than I was when starting this out.

The ropensci-docker image could no doubt be more modular (and better documented).  I'd be curious to hear if anyone has had success or problems running docker on windows / mac platforms.  Issues or pull requests on the repo would be welcome! https://github.com/ropensci/docker-ubuntu-r/blob/master/add-r-ropensci/Dockerfile  (maybe the repo needs to be renamed from it's original fork now too...)

Rich et al highlighted several "remaining challenges" in their original post.  Here's my take on where those stand in the Docker framework, though I'd welcome other impressions:

1) dependencies could still be missed by incompletely documentation

I think this one is largely addressed, at least assuming a user loads the Docker image.  I'm still concerned that later builds of the docker image could simply break the build (though earlier images may still be available).  Does anyone know how to roll back to earlier images in docker?


2) The set of scripts for managing reproducibility are at least as complex as the analysis itself

I think a lot of that size is due to the lack of an R image for Travis and the need to install many common tools from scratch.
Because docker is both modular and easily shared via docker hub, it's much easier to write a really small script that builds on existing images, (as I show in cboettig/rnexml)

3) Travis.org CI constraints: public/open github repository with analyses that run in under 50 minutes.

Docker has two advantages and also some weaknesses here: (1) it should be easy to run locally, while accomplishing much of the same thing as running on travis (though clearly that's not as nice as running automatically & in the cloud on every push). (2) It's easier to take advantage of caching -- for instance, cboettig/rnexml provides the knitr cache files in the image so that a user can start exploring without waiting for all the data to download and code to run.

It seems that Travis CI doesn't currently support docker since the linux kernel they use is too old.  (Presumably they'll update one day.  Anyone try Shippable CI? (which supports docker))

4)  The learning curve is still prohibitive

I think that's still true.  But what surprised me is that I'm not sure that it's gotten any worse by adding docker than it was to begin with using Travis CI.  Because the approach can be used both locally and for scaling up in the cloud, I think it offers some more immediate payoffs to users than learning a Github+CI approach does.  (Notably it doesn't require any git just to deploy something 'reproducible', though of course it works nicely with git.

