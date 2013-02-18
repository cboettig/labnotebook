---
comments: true
date: 2011-08-17 22:53:33
layout: post
slug: wednesday-migrating-codes-into-mpi
title: 'Wednesday: migrating codes into MPI'
redirects: [/wordpress/archives/2362, /archives/2362]
categories:
- computation
tags:
- hpc
---

## Parellelization/Scaling of code


MPI on farm cluster

Got my MPI codes running.  
Much better way to get jobs into the queue, asking for 16 threads that don't have to be on the same node is much faster.  Can also ask for 161 threads, but will wait longer in the queue.  

The trick to getting this to run was mostly getting the library set correctly.  Setting the library path at the top of the script did the trick:

```R

RLIBS="~/R/x86_64-redhat-linux-gnu-library/2.13"
.libPaths(c(RLIBS, .libPaths()))
```


From there I can initialize an MPI instance, set up exit conditions, load variables and functions to the slave nodes and then have them all execute the desired function:


```R


N <- 10 # n-1 from the threads allocated(?) 

require(Rmpi)
mpi.spawn.Rslaves(nslaves=N)

## Clean-up 
.Last <- function(){
    if (is.loaded("mpi_initialize")){
        if (mpi.comm.size(1) > 0){
            print("Please use mpi.close.Rslaves() to close slaves.")
            mpi.close.Rslaves()
        }
        print("Please use mpi.quit() to quit R")
        .Call("mpi_finalize")
    }
}

mpi.bcast.Robj2slave(monkey)
mpi.bcast.Robj2slave(new_world)
mpi.bcast.Robj2slave(chains)

mcmc_out <- mpi.remote.exec(chains())


# close slaves and exit
mpi.close.Rslaves()
mpi.quit(save = "no")
```


Where "chains" is the function earlier defined that runs on each node.  

Hmm... seem to run into trouble scaling this out to 161 nodes.  Meanwhile better to run MCMCs as separate jobs, write data to a tmp folder, and then read in with a different script for the analysis, a la Eastman's approach.  




###  NERSC machine 







  * setup for github: copy .ssh/rda and .ssh/rda.pub


  * installing R packages: load the R module and swap in the intel compilers first





```bash

module load R/2.12.1
module swap pgi intel
module swap openmpi openmpi-intel 

```



Note that format for the batch jobs differs substantially between architectures.  Hopper is a Cray, and launches commands with [aprun](http://www.csc.fi/english/pages/louhi_guide/batch_jobs/commands/aprun), see [example](http://www.nersc.gov/users/computational-systems/hopper/getting-started/your-first-program/).

Carver is an IBM, and seems to use [mpirun](http://www.mcs.anl.gov/research/projects/mpi/www/www1/mpirun.html) instead, which appears to be a more general architecture command.  See the [Carver example program](http://www.nersc.gov/users/computational-systems/carver/getting-started/).    



##### Testing:


Run brute_force example script on Carver and Hopper.  Can't launch R on compute nodes, perhaps a module loading issue.  Will need to explore further.  Otherwise might be better to move all code down into C and write the MPI there....




##  Misc 






  * Buy home server? [ZaReason Breeze](http://zareason.com/shop/Breeze-Server-4220.html)?


  * Conferences I've followed on twitter this summer: [Research Data Lifecycle management](http://rcs.columbia.edu/rdlm), #rdlmw #useR11 #scifoo11 [Reproducible Research](http://www.mitacs.ca/events/index.php?option=com_content&view=article&id=214&Itemid=231&lang=en) ([talk archive](http://www.stodden.net/AMP2011/)) 



