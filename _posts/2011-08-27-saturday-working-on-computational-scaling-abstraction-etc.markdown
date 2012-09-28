---
comments: true
date: 2011-08-27 23:44:09
layout: post
slug: saturday-working-on-computational-scaling-ion-etc
title: 'Saturday: working on computational scaling, ion, etc'
redirects: [/wordpress/archives/2450, /archives/2450]
categories:
- computation
tags:
- hpc
---

Can I get a generic montecarlotest function working for both warningsignals and pmc?  

Needs to be able to handle S4 classes as well as S3 classes, or need to define the methods update, simulate, loglik and getParameters for any object that would use the method.  i.e. these need to be defined in warningsignals for its functions and in wrightscape/pmc for its creatures.  then the generic can be used.  Implementing now...  Completed.  pmc and wrightscape now depend on my mcmcTools package, which now provides the montecarlotest() function.  This function can be run piecewise as well using two new functions, compare_models(), and collect().  compare_models contains the abstract parallelization loop, which can be applied in any parallelization manner (including bash-script serial runs of the function) using any lapply formating.  Results from separate runs can simply be concatenated and passed to collect(), which does some basic reformatting. 

![]( http://farm7.staticflickr.com/6197/6090938628_313358fec8_o.png )
 ![]( http://farm7.staticflickr.com/6085/6090932874_d2b3b20cd4_o.png )


Seems to be working: pmc example montecarlotest and compare_models() methods seem to show the comparable results.  

Exploring parallelization methods between snow, snowfall, and Rmpi.  All working in preliminary examples on carver.  All except the snowfall mpi mode work on farm, unfortunately.  filed ticket.  

```r

# Initialize the Rmpi environment
library(Rmpi)

## load the packages we'll need
RLIBS="~/R/x86_64-redhat-linux-gnu-library/2.13"
.libPaths(c(RLIBS, .libPaths()))

### Direct RMPI way:
mpi.spawn.Rslaves(nslaves=15)
slavefn <- function() { print(paste("Hello from", foldNumber)) }
mpi.bcast.cmd(foldNumber <- mpi.comm.rank())
mpi.bcast.Robj2slave(slavefn)
result <- mpi.remote.exec(slavefn())
print(result)
mpi.close.Rslaves()


library(snow)
## snow method
cluster <- makeCluster(16, type="MPI")
out <- parSapply(cluster, 1:16, function(x) print(paste("snow hello from ", x)))
print(out)
stopCluster(cluster)

## SNOWFALL method
library(snowfall)
# default
sfInit( parallel=TRUE, cpus=16)
out <- sfSapply(1:16, function(x) print(paste("snow hello from ", x)))
print(out)
sfStop()

# snowfall MPI
sfInit( parallel=TRUE, cpus=16, type="MPI" )
out <- sfSapply(1:16, function(x) print(paste("snow hello from ", x)))
print(out)
sfStop()

mpi.quit(save = "no")
```




exploring mpi in C on carver. Working example on carver.  Will see about pure-C implementations of wrightscape. Pure c on warning signals will wait on better handling of the integration, see earlier [optimization](http://www.carlboettiger.info/archives/1169) on this.  

on farm, need to load compiler first: 

```bash

module load gcc openmpi

```


