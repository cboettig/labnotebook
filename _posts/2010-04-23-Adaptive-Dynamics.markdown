---
layout: post
tags: [adaptive-dynamics]
categories: evolution
title: Adaptive Dynamics
---






 








### Computing Challenges

-   10 - 1p Adding solutions to yesterday's puzzles, see Yesterday's
    Entry
-   The random number generator solution is imperfect, as it limits the
    total number of seeds to 1e9 since coercing to an integer will
    create NAs with larger numbers.

\

     seeds <- 1e9*runif(reps)
     out <- sfSapply(1:reps, function(i){ branch_simulation(seed=seeds[i]) })

### Analytic Solutions

Git Log
-------

<syntax\> Created commit da58a6e: random number seeds now set to avoid
parallel cores running with same seed

    2 files changed, 19 insertions(+), 9 deletions(-)

cboettig@wiglaf:\~/Documents/ucdavis/research/adaptiveDynamics/code/branchingtime$
git log commit da58a6eb079a8ff9c2c28a2e5e1c27fe484f43fc Author: Carl
Boettiger <cboettig@gmail.com\> Date: Fri Apr 23 13:05:30 2010 -0700

       random number seeds now set to avoid parallel cores running with same seed

commit 6e5363559f602d1dd2e2f8addec0716e8a5c842a Author: Carl Boettiger
<cboettig@gmail.com\> Date: Fri Apr 23 11:46:42 2010 -0700

       solution for exporting .C call to parallel cores

\
 </syntax\>

Other Work
----------

-   Completed review for Theoretical Ecology.
-   Still finishing review for JTB
-   PDG group reading [Nee et. al.
    (2006)](http://hdl.handle.net/10.1146/annurev.ecolsys.37.091305.110035 "doi:10.1146/annurev.ecolsys.37.091305.110035")

\

