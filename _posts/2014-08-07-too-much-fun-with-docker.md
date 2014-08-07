---
layout: post
category: open-science
tags:
- blog

---

**NOTE:** This post was originally drafted as a set of questions to the revived [ropensci-discuss list](https://groups.google.com/forum/#!forum/ropensci-discuss), hopefully readers might join the discussion from there.


Been thinking about Docker and the discussion about reproducible research in the comments of Rich et al's recent post on the [rOpenSci blog](ropensci.org/blog/2014/06/09/reproducibility/) where quite a few of people mentioned the potential for Docker as a way to facilitate this.


I've only just started playing around with Docker, and though I'm quite impressed, I'm still rather skeptical that non-crazies would ever use it productively.  Nevertheless, I've worked up some Dockerfiles to explore how one might use this approach to transparently document and manage a computational environment, and I was hoping to get some feedback from all of you.

For those of you who are already much more familiar with Docker than me (or are looking for an excuse to explore!), I'd love to get your feedback on some of the particulars.  For everyone, I'd be curious what you think about the general concept.


So far I've created a [dockerfile](https://github.com/ropensci/docker-ubuntu-r/blob/master/add-r-ropensci/Dockerfile) and [image](https://registry.hub.docker.com/u/cboettig/ropensci-docker/)

If you have docker up and running, perhaps you can give it a test drive:

    docker run -it cboettig/ropensci-docker /bin/bash

You should find R installed with some common packages.  This image builds on Dirk Eddelbuettel's R docker images and serves as a starting point to test individual R packages or projects.


For instance, my RNeXML manuscript draft is a bit more of a bear then usual to run, since it needs `rJava` (requires external libs), `Sxslt` (only available on Omegahat and requires extra libs) and latest `phytools` (a tar.gz file from Liam's website), along with the usual mess of pandoc/latex environment to compile the manuscript itself.  By building on ropensci-docker, we need a [pretty minimal docker file](https://github.com/ropensci/RNeXML/tree/master/manuscripts/Dockerfile) to compile this environment:

You can test drive it ([docker image here](https://registry.hub.docker.com/u/cboettig/rnexml)):

    docker run -it cboettig/rnexml /bin/bash

Once in bash, launch R and run `rmarkdown::render("manuscript.Rmd")`.  This will recompile the manuscript from cache and leave you to interactively explore any of the R code shown.

## Advantages / Goals

Being able to download a pre-compiled image means a user can run the code without dependency hell (often not as much an R problem as it is in Python, but nevertheless one that I hit frequently, particularly as my projects age), and also without altering their personal R environment. Third (in principle) this makes it easy to run the code on a cloud server, scaling the computing resources appropriately.


I think the real acid test for this is not merely that it recreates the results, but that others can build and extend on the work (with fewer rather than more barriers than usual). I believe most of that has nothing to do with this whole software image thing -- providing the methods you use as general-purpose functions in an R package, or publishing the raw (& processed) data to Dryad with good documentation will always make work more modular and easier to re-use than cracking open someone's virtual machine.  But that is really a separate issue.

In this context, we look for an easy way to package up whatever a researcher or group is already doing into something portable and extensible.  So, is this really portable and extensible?

## Concerns:

1. This presupposes someone can run docker on their OS -- and from the command line at that.  Perhaps that's the biggest barrier to entry right now, (though given docker's virulent popularity, maybe something smart people with big money might soon solve).


2. The only way to interact with thing is through a bash shell running on the container.  An RStudio server might be much nicer, but I haven't been able to get that running.  *Anyone know how to run RStudio server from docker?*

(I tried & [failed](https://github.com/mingfang/docker-druid/issues/2))

3. I don't see how users can move local files on and off the docker container.  In some ways this is a great virtue -- forcing all code to use fully resolved paths like pulling data from Dryad instead of their hard-drive, and pushing results to a (possibly private) online site to view them.  But obviously a barrier to entry.  *Is there a better way to do this?*


## Alternative strategies


1) Docker is just one of many ways to do this (particularly if you're not concerned about maximum performance speed), and quite probably not the easiest. Our friends at Berkeley D-Lab opted for a GUI-driven virtual machine instead, built with Packer and run in Virtualbox, after their experience proved that students were much more comfortable with the mouse-driven installation and a pixel-identical environment to the instructor's (see their excellent [paper](https://berkeley.app.box.com/s/w424gdjot3tgksidyyfl) on this).

2) Will/should researchers be willing to work and develop in virtual environments?  In some cases, the virtual environment can be closely coupled to the native one -- you use your own editors etc to do all the writing, and then execute in the virtual environment (seems this is easier in docker/vagrant approach than in the BCE.

<!--

I would like a way for a collaborator who knows a little R to be able to open my .Rmd manuscript on his/her own computer, edit some parameters, recompile and view the pdf. RStudio w/ rmarkdown has gone a long way to making that happen.
-->


