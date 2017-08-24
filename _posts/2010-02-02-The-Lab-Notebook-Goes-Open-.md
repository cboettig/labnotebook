---
layout: post
tags: [tribolium, warning-signals]
categories: [ecology]
title: The Lab Notebook Goes Open 
---






(Originally posted on OpenWetWare)

-   This is the first entry in my lab notebook, but not the beginning of
    the project. I have been exploring demographic and colored
    environmental noise since beginning my graduate program at UC Davis.
    Much of that time has been spent in building the appropriate tool
    set though, so now it's time to dive in.

-   A good starting point is Denis et. al. (2001) *Ecological
    Monographs* 71.2. In this paper they reconsider the LPA model for
    *Tribolium* and determine that most of the variation can be
    attributed to demographic noise rather than chaos, limit cycles or
    environmental noise, contrary to their earlier work.

-   Thus far I've implemented a continuous time individual-based
    stochastic population model with four age classes. Currently
    demographic stochasticity is the only source of variation, though
    the age structure creates large shocks. Analytic treatment is
    difficult in a continuous time framework since having fixed ages of
    maturity makes the model time heterogeneous.

-   Code for the project is hosted open source through [Google
    code](http://code.google.com/p/popdyn/ "http://code.google.com/p/popdyn/")
    and managed with subversion.

Early Warning Signals
---------------------

-   I've also done some work towards the early warning signal modeling.
    I've implemented a simple population individual-based model with
    saddle-node bifurcation in both C and netlogo. The netlogo
    implementation allows for a better visualization with slider-bars
    that change the parameters and dynamic plotting, the C code allows
    larger numbers, longer times, and replicates (ensemble) simulation.
    The C code is also in continuous time (via Gillespie method), while
    netlogo is in discrete time. Both need some modification.



