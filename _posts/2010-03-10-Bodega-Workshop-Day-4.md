---
layout: post
tags: []
categories: evolution
title: Bodega Workshop Day 4
---






 








Morphological Evolution Day:

-   Peter Wainwright
-   Sam Price
-   Johnathan Eisen

We have the afternoon session off for field trips and research.

\

### Peter Wainwright, Comparative Analysis of Morphological Diversity

-   Fantastic diversity in morphology, corresponds to niche! But
    morphological diversity isn't evenly distributed across tree of
    life. (See slides, parallels Peter's section on core and gives the
    best biological coverage we've had this week).

What changes morphological diversification rate

-   **Intrinsic factors** functional innovations (endothermy, flight),
    decoupling (gene duplication, pharangial jaws), increased complexity
    (new parts), loss in complexity (parasitoid/parasite examples --
    perhaps this hasn't been well studied in phylogenetic context?)
-   **Extrinsic factors:** change adaptive landscape, invade new
    geography, new community composition, sexual selection.

How about traits that constrain morphological diversification rate?

-   Disparity as a measure of diversity. Are Galapagos finches more
    diverse than mainland finches? Does disparity always increase?
-   Brian Moore comments on interface between rates of lineage
    diversfication and increases in trait disparity.

### Samantha Price, brownie tutorial

-   Does the one-rate or two-rate model fit the data best?
-   My version of the question: can the data discriminate between a
    one-rate and two-rate model?
    -   (based on Sam's analogy explanation of OU, Justen jests:
        implementation of brownian motion is sort of like jumping of a
        bridge, minus the bungie cord (but assuming no ground). )

-   Discusses the censored rate tests vs non-censored. (painted).
-   Brownie implementation accomplishes hansen fits of ouch, and also
    brownian motion.
-   Brownie and ouch make alpha and sigma globals, so can't compare
    across trees. some other stuff out there has started to do that.

### Jonathan Eisen, Microbial Phylogenomics

8p

-   No such thing as a core set of genes in bacteria. More genomes you
    look at, the smaller the overlap.
-   16s: good but not perfect -- comparisons to whole genome trees!
-   Gene function as evolutionary character state, not distance (BLAST).
    Infer ancestral states on functions on *phylogram* trees! Eisen 1998
    Genome Res.
-   Non-homology functional prediction methods, phylogenetic profiling.
-   Michael Eisen assembled the complete wolbachia genome from within
    the drosphilia genome... Many assemblies of symbiont genomes from
    the host sequencing project.
-   Kelly's comment: many can't be cultured do to dependence on other
    bacteria in the community. How can we measure ecological
    interactions? (Brilliant example of ecological thinking often
    missing from microbial research).

\

Research Progress
-----------------

### Bodega Project

-   Began basic data import and exploration. Some notes are available on
    my [Bodega
    page](http://bodegaphylo.wikispot.org/Users/Carl "http://bodegaphylo.wikispot.org/Users/Carl").
-   Wrote an R function using geiger's name.check function that will
    take a tree and traits and return only a pruned tree and pruned
    dataset that contains only species that are both on the tree and
    have trait data.
-   Divided continuous data into discrete categories based on my new
    maximum likelihood function. Ancestral state reconstruction on
    discretized fin angle:

![image](http://openwetware.org/images/thumb/b/b7/Discrete.png/600px-Discrete.png)

### Adaptive landscapes from trees

Going after fitting the stationary distribution of the Discretizing a
continuous trait involves an arbitrary threshhold. Should be able to fit
a multi-regime model to the data, and estimate the number of regimes.
Important that this uses the joint stationary distribution of the
multiregime model, rather than first assigning points to regimes.

1.  specify the model
2.  evaluate density of the model at the location of each data point
3.  product of all these densities (sum the log densities)

10am

-   Tried exploring packages on
    [CRAN](http://cran.r-project.org/web/packages/ "http://cran.r-project.org/web/packages/")
    for clustering an Bayesian clustering. There are several but none
    seem to take the approach I would like. Should be easy enough to
    write myself in R or C. Beginning the prototype in R.

1:30pm

-   Implemented the two regimes model in R using Nelder-Mead search for
    optimum thetas and sigmas.

Scratch pad: random thoughts and ideas
--------------------------------------

-   Consider writeup/talk on evaluating a method (at least in
    comparative context) Why this should happen before and independent
    of testing with data.
-   How well could we formulate Peter's take on morphological
    diversification directly into models? Could we then derive
    approximations to those descriptions that resemble / disagree with
    Brownian motion?
-   Picking units successfully is crucial to comparing diversification
    rates, particularly across broad phylogenies.
-   Independence of traits / base-pairs in sequence alignment, things
    that create correlation, things that remove it. OU weakens the
    time/disparity correlation, introduces new reason for traits to be
    correlated (other than phylogeny).
-   Rich Glor introduced me to
    [dechronization](http://treethinkers.blogspot.com/ "http://treethinkers.blogspot.com/"),
    excellent source of ideas in the field.
-   Added several ideas, partly inspired by today's lecture, onto my
    newly created [idea
    forum](http://phylogenetics.uservoice.com/forums/43843-general "http://phylogenetics.uservoice.com/forums/43843-general")
    for phyologenetic comparative methods. Several have been started.
-   Should be able to infer the painting under BM
-   Simmap -- a proprietary license, runs only on OSX, and only creates
    simulated output. Ought to translate this into R.
-   MK1, Jukes-Cantor, can't believe we use arbitrary names to specify
    different finite state continuous time Markov processes. Can't we
    just specify the dimension and the level of symmetry imposed?
-   Would be great to have the Bodega wiki hosted/mirrored locally to
    deal with the limited bandwidth here.

