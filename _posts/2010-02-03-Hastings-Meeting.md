---
layout: post
tags: [tribolium]
categories: [ecology]
title: Hastings Meeting
---


-   Meeting with Dr. Alan Hastings soon to discuss progress on this
    project. We'll also see what he thinks of the open lab notebook.
    There's a lot I want to cover in this meeting.

### Warning Signals

-   Tomorrow I'm leading a discussion in seminar on regime shift
    literature, so I need to review major ideas of the paper with Alan.
    Particularly need to be clear on the role of dimensionality and
    if/when the population dynamics lack an appropriate Hamiltonian and
    whether that's an important part of the argument.

### Beetle Dynamics

-   Summary of where we are / what I've done and the primary goals for
    the project. I'm hoping the intro to the lab notebook will help
    facilitate this.
-   Finish discussion of Denis et al Eco Monographs (2001) paper.
    Discuss alternate approaches that use model comparison.
-   Dealing with the age classes in continuous time when rates are time
    dependent remains a source of frustration. There are several
    possible approaches here, so might be good to compare how each
    performs against the data:

1.  assume constant rates of transition between age classes, restoring
    temporal homogeneity.
2.  add an energy function that explicitly models energy uptake and make
    transition rates between age classes dependent upon this
3.  see how far I can get with the straight-forward / correct approach
    of integrating directly. Certainly fine for the ODE but less
    familiar with the theory for temporally heterogeneous stochastic
    process, since it loses the Markov property (rate depends on how
    long you've been in a state).

### Post Meeting Eval

-   Goals for next time: Feb 10th

1.  Implement the analytic energy-based model for transitions between
    states, solve for fluctuation dynamics
2.  Review [integral projection
    models](http://www.eeb.cornell.edu/Ellner/pubs/EasterlingIntegral00.pdf "http://www.eeb.cornell.edu/Ellner/pubs/EasterlingIntegral00.pdf")
    of Steve Ellner as an approach to handling age / stage structure
3.  Experiment with adding individual heterogeneity and environmental
    variation to the continuous time simulation
4.  Explore implementation strategies for likelihood evaluation of the
    various models to simulated and real data
5.  Continue [background
    reading](http://www.mendeley.com/collections/972151/StochasticPopulationDynamics/ "http://www.mendeley.com/collections/972151/StochasticPopulationDynamics/")

\

\

