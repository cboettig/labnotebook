---
layout: post

categories: [ecology]
title: Warning Signals
---






 








Exploring convergence in maximum likelihood model fits each on data
produced by their own simulation method:

-   fit1, basic OU method, converges just fine. (using L-BFGS-B method
    with appropriate bounding box to avoid negatives).
-   fit2 , the linear change rate model, converges fine using
    Nelder-Meade (using 1e12 \~ inf likelihood return when attempting
    negative alpha or sigma), but throws hard errors for L-BFGS-B:

<!-- -->

     Error in optim(pars, warning.likfn, method = method, lower = lower) : 
     non-finite finite-difference value [3]

-   fit3 runs on "L-BFGS-B" and returns reasonable values, though not
    meeting convergence standards. Converges successfully on
    Nelder-Mead.

-   using [this
    version](http://github.com/cboettig/structured-populations/blob/48c204f7cff5c29c7c7a80b24f760cd051df8a21/demos/warning_example.R "http://github.com/cboettig/structured-populations/blob/48c204f7cff5c29c7c7a80b24f760cd051df8a21/demos/warning_example.R")
    of warning\_example.R for the example exploration and
-   using [this
    version](http://github.com/cboettig/structured-populations/blob/48c204f7cff5c29c7c7a80b24f760cd051df8a21/R/sde_likelihood.R "http://github.com/cboettig/structured-populations/blob/48c204f7cff5c29c7c7a80b24f760cd051df8a21/R/sde_likelihood.R")
    of methods from sde\_likelihood.R

Code notes
----------

-   Because optim call takes just parameters and not data, writing data
    directly to the environment as X so it can be found, following the
    example of sde package. However this means in functions that want to
    pass the data to optim calls, they must write the data to the
    appropriate level, right

\

