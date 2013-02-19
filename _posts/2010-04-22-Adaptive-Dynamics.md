---
layout: post
tags: [adaptive-dynamics, code-tricks]
categories: evolution
title: Adaptive Dynamics
---






 








### compiling with R and C and parallel computing

-   **Problem:** cannot get the R code to take advantage of
    parallelization via openMP.

-   **Solution:**

C++ file mangles names in .so, changing the .C call. to get the object
name:

~~~~ {.de1}
objdump -x file.so
~~~~

**Carl Boettiger 03:01, 25 May 2010 (EDT)**: More standard solution:
enclose cpp code in

     extern C {

\

-   **Problem:** Trouble getting R to export the C library to all nodes.
    (Sol'n thanks to Vinh on R-sig-hpc!)
-   Also, locating the .so file in a way that is independent of package
    installation, needs to find the package install. (Sol'n thanks to
    Vince on statcompsci). (Updated on 2010-04-23).
-   **Solution:**

~~~~ {.de1}
    loc <- system.file(package="BranchingTime")
    lib <- paste(loc, "/libs/BranchingTime.so", sep="")
    sfExport("lib")
    sfClusterEval(dyn.load(lib) )
~~~~

-   **Problem** Random number generator needs to be specified above the
    parallel computation loop. Easy to do in C, but won't work for R
    where the random number generator is from GSL but the
    parallelization is at the R level. Will need to figure out how to
    generate different random seeds on each thread and pass that down to
    the C code...

-   **Solution:**

Now R generates and passes a random seed to the C function.
(2010-04-23).

Git Log
-------

~~~~ {.de1}
commit 9c4167b1943d8713ce179f48432fcb750fbda26d
Author: Carl Boettiger <cboettig@gmail.com>
Date:   Thu Apr 22 19:03:09 2010 -0700
 
    removing unused C files integrate.c png
 
commit 73f389abbe53eb923f1aea49bc9f110cfa5531a7
Author: Carl Boettiger <cboettig@gmail.com>
Date:   Thu Apr 22 19:01:52 2010 -0700
 
    minor mods
 
commit a8ca40ef883b1dd33e1b7ab27f8a215e7c2746f9
Author: Carl Boettiger <cboettig@gmail.com>
Date:   Thu Apr 22 18:55:32 2010 -0700
 
    Working R calls
 
commit 7c565bef0a378a68ce2c0a2a1ad73c6039871431
Author: Carl Boettiger <cboettig@gmail.com>
Date:   Thu Apr 22 15:31:10 2010 -0700
 
    rng initialized in outer loop
 
commit 60192d74b45c64423994b451aad6a7627e2a56b8
Author: Carl Boettiger <cboettig@gmail.com>
Date:   Thu Apr 22 14:37:36 2010 -0700
 
    streamlining parallelization
 
commit a4de1d11a2a9ce0179636770246707b18c8d8c06
Author: Carl Boettiger <cboettig@gmail.com>
Date:   Thu Apr 22 13:03:03 2010 -0700
 
    reorganizing files by functions
~~~~

\

