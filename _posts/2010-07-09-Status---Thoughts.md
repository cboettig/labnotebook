---
layout: post

categories: evolution
title: Status - Thoughts
---






 








-   **Goal:** BM vs OU vs proposed multipeak OU model with and without
    global alpha/sigma. Anoles dataset, carex dataset, labrids?

-   Added ape2ouch\_all function based on maticce to convert file
    formats. Might be worth checking against my current implementation.
    Meanwhile it's really the converting trees back from ouch to ape
    that gives the ace function trouble. something about ordering of the
    nodes, even though that shouldn't matter in the phylo format.

-   For the moment, probably worth always running hansen first and using
    output to seed the run of wrightscape.
-   Later, should modify so that wrightscape and declare any parameters
    global or local
-   Wrightscape's simulated annealing should do something clever to
    choose which parameters to optimize first.

\

-   Write bootstrap version for wrightscape. Use the object class and
    call categories to choose appropriate method automatically.

-   MCMC version! Does this need to be reversible jump or can I just run
    this on the richest model and look at overlap?

-   negative values can somehow sneak in to simulated annealing
    approach.

-   need to figure out distributing R packages with C code depending on
    GSL

-   Make sense of max-likelihood inferred painting approach. Write a
    full R implementation for stochastic mapping (simmap).

-   Need a simulation method for wrightscape!

Code Updates
------------

-   Rewriting likelihood bootstrap method. Should guess the correct
    method (for the moment will ignore the auto-partitioning approach?)
    Should make pretty plots.

\

