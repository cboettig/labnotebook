---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Effective warning signals
---






 








-   Predicting variance of variance by direct calculation -- still need
    to crunch some math for the expected convergence.
    -   Still, the approach should be able to do more than describe
        single points as unexpected deviates.
    -   Still need to address gradual change vs change point analysis.
    -   Essentially the same as the phyolgenentic problem -- one rate vs
        two rates. Model selection approaches?
    -   So far theory is essentially built on a model selection between
        linear models.

-   Calculate the eigenvalue directly rather than ratio of eigenvalue to
    noise:
    -   Estimate the eigenvalue from the correlation function and from
        power spectrum, rather than the lag-1 autocorrelation, or
        variance.
    -   Proper signal processing techniques for detecting bifurcations?

### Coding Progress

-   Added a proper autocorrelation function calculation, log transform
    and linear regression gives the eigenvalue and the variance.
-   Tested using the Langevin model

![ x\_{t+1} = x\_t \\left(1- \\frac{\\kappa}{\\gamma} \\Delta t \\right)
+ \\Delta t \\sqrt{\\frac{2 K\_B T}{\\gamma} } \\xi\_t
](http://openwetware.org/images/math/a/4/b/a4b7d6a34ddae316029729bd7c1b9303.png)

Whose correlation function is given by

![ \\frac{K\_BT}{\\gamma} e\^{-\\kappa t / \\gamma}
](http://openwetware.org/images/math/7/8/1/7811817fde052d555cadbfd36a77d213.png)

\

