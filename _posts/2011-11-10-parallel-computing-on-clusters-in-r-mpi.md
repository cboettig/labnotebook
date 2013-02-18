---
comments: true
date: 2011-11-10 16:49:17
layout: post
slug: parallel-hpc-on-clusters-in-r-mpi
title: Parallel hpc on clusters in R, MPI
redirects: [/wordpress/archives/3274, /archives/3274]
categories:
- computation
tags:
- hpc
---

Some notes for reference on parallel computing strategies on R with dedicated high performance clusters.


## parallelization in R


For cluster computing in R, I've found the "snow" package with MPI to be the most flexible and robust solution. snowfall is a useful package to use multiple cores on a single processor, but requesting all 16 threads on a node is a much more difficult demand for the queue to fill than 16 threads on all nodes. Requesting more nodes is sometimes useful simply to have more memory, and also to take advantage of the communication speed between nodes.

Regardless, parallelization across a cluster in R requires: (1) initializing the cluster, (2) export library, variables and functions, (3) execute a parallelized apply command.

Illustrating a couple different approaches:

[gist id=1356682]


## Working with the queue


Writing a shell script for NERSC's [Carver](http://www.nersc.gov/users/computational-systems/carver/getting-started/), (IBM iDataPlex). Note the commands that begin #PBS look to be commented out but are really preprocessor commands used to set up the queue before the actual bash commands are run. Using double hashes to distinguish true comments. Writing shell script for [Farm cluster](http://cccc.caes.ucdavis.edu/), CentOS5.5, syntax differs a bit.

[gist id=1356685]



	
  * qsub run.sh (submits the shell script to the queue)

	
  * qstat - u username (status)

	
  * qdel (removes item from queue)

	
  * qlogin (on farm, log into a computational node for some quick testing.




## NERSC particulars





	
  * Great information on [NERSC systems](http://www.nersc.gov/systems/) and tutorials on their website.

	
  * Get an [allocation](https://www.nersc.gov/users/accounts/allocations/)

	
  * [log in](https://shib.nersc.gov/idp/Authn/UserPassword), [My NERSC Dashboard](https://www.nersc.gov/users/my-nersc-2/).




## Authentication


Should summarize setting up RSA authentication keys, meanwhile see [ubuntu reference](https://help.ubuntu.com/community/SSH/OpenSSH/Keys).

See notes on [Segue](http://www.carlboettiger.info/archives/2133) for Computing on Amazon clusters.
