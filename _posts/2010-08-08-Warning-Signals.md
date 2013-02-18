---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Warning Signals
---






 








-   Working on implementation of the the TwoRates model looking for
    changepoint:
-   See for most of code implementation
    [sde\_likelihood.R](http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/R/sde_likelihood.R "http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/R/sde_likelihood.R")
    and for the model choice example see
    [warning\_example.R](http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/demos/warning_example.R "http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/demos/warning_example.R")

General Code cleanup
--------------------

-   Added a [saddle-node
    bifurcation](http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/src/saddle_node_direct.c "http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/src/saddle_node_direct.c")
    simulation in the format of the metapop/hastings/crowley/beetles
    models already in the stochastic population dynamics library. Allows
    for C-based parallelized ensemble simulation using my Gillespie
    library. R call to all of these models can be found in
    [ind\_based\_models.R](http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/R/ind_based_models.R "http://github.com/cboettig/structured-populations/blob/c12b986d2804c261b2126edd4c53e421446f020a/R/ind_based_models.R")

\

\

