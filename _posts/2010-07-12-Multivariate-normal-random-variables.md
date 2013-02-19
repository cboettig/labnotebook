---
layout: post

categories: evolution
title: Multivariate normal random variables
---






 








-   GSL lacks a multivariate normal random variable option, so have
    implemented one using the eigenvalue decomposition (default method
    in the R function rmvnorm). Function should consider doing error
    handling (i.e. warning if covariance matrix isn't positive definite
    or if the vectors given don't match dimensions), though these may be
    mostly unnecessary cost. Also uses a general blas matrix
    multiplication when one of the matrices is just sqrt(eigenvalues) on
    the diagonal, so this could possibly be sped up considerably using
    the correct blas matrix multiply.

-   As the solutions to the regimes model are still multivariate normal,
    simulating data sets just means drawing random numbers from this
    distribution, as opposed to actually evolving the SDE along the
    tree.

\

