---
layout: post

categories: [ecology]
title: General matrix form and correcting equations
---






 








Pursuing a matrix form, seems I had missed some terms in the covariance
equations Friday, which are suggested by the nice symmetry of this
representation:
![image](http://openwetware.org/images/thumb/5/55/Eqns.jpg/800px-Eqns.jpg)
(sometimes chalk and a camera are faster than tex).

This suggests the general form looks like

*d**M* = *J**M* + (*J**M*)^*T*^ + *g*

Where *M* is the covariance matrix and *J* the Jacobian of *f* as
before. *dM* is the matrix of derivative terms, though clearly not a
rigorous notation.

Fixing Crowley results
----------------------

-   A couple numerical errors in the implementation of the Crowley model
    yesterday led to the divergence. The updated numerical results can
    produce large but stable noise. Also applies system size scaling to
    match the individual-based simulation.

![Image:Crowley\_noise.png](http://openwetware.org/images/d/d5/Crowley_noise.png)

-   Working on graphing the direct comparison between the approximation
    and the individual simulation next.
-   Also working on updating gillespie simulation in
    [warningSignals](http://github.com/cboettig/warningSignals "http://github.com/cboettig/warningSignals")
    in order to remerge the crowley branch with the master branch.
-   warningSignals crowley branch successfully merged back onto master.
-   *Next steps*:
    -   Add individual simulations to R interface for warningSignals
        (currently C code just computes window-averaging and ensemble on
        the fly instead of saving the full sample history).
    -   add R function interface to Crowley model
    -   Compare Crowley simulation to analytics.
    -   Increase density-dependence and decrease size of key class in
        Crowley for larger noise effects.

\

