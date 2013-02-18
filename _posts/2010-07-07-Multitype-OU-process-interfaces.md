---
layout: post

categories: evolution
title: Multitype OU process interfaces
---






 








-   Removing old implementations from the R package, so will need to
    grab them from the [version
    history](http://github.com/cboettig/wrightscape/commit/a3cebb06b8e0e28fe43fbb22e6bd9f0c499271e3 "http://github.com/cboettig/wrightscape/commit/a3cebb06b8e0e28fe43fbb22e6bd9f0c499271e3")
    from now on to access the original linear implementations.

-   Nelder-Mead simplex algorithm seems quite sensitive to starting
    conditions. Seeding it with values fit from the hansen algorithm
    (global alpha and sigma), it rapidly improves the log likelihood
    score (going up from 25 to 30, which is just barely significant
    according to AIC). With more arbitrary starting conditions it
    significantly under-performs even Brownian motion models.

-   Implemented a simulated annealing likelihood maximization routine,
    which proves much more robust to starting conditions, though taking
    significantly longer to converge. Also this performance requires
    appropriately high starting temperature and number of regimes.
    Hopefully is easy to convert to an MCMC routine. Should add lockable
    parameters and should use the faster linear solvers for BM and OU1
    to make a general MCMC suite for comparative methods.

\

\

\

