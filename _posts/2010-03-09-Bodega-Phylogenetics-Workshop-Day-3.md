---
layout: post
tags: []
categories: evolution
title: Bodega Phylogenetics Workshop Day 3
---






 








Rich Glor, Character Evolution
------------------------------

[Official slides and
tutorial](http://bodegaphylo.wikispot.org/Discrete_Character_Evolution_%28Glor%29_2010 "http://bodegaphylo.wikispot.org/Discrete_Character_Evolution_%28Glor%29_2010")

-   Weakness of ancestral state reconstruction
    -   Cunningham 1999
    -   Losos 1999

-   Testing hypotheses with ancestral reconstruction
    -   **Parsimony**
    -   Farris method. Downward/upward pass. Gives a maximum parsimony
        reconstruction. May miss other ones.
    -   Apparently this Parsimony analysis can be done for continuous
        traits as well, needs a measure of distance
    -   **Likelihood**
    -   Pagel 1994
    -   Schluter 1997

### R tutorial

(see anolis\_cheat.R)

-   Discrete trait ancestral state reconstruction
    -   Wouldn't it be nice to have functions that applied Rich's
        awesome plots to any data? Segway to writing functions
    -   Wouldn't a zoomable updatable plot interface be nice? update
        plot fn and cairo pdf.

-   Testing for phylogenetic signal
    -   Lambda: rescale all internal branches by a factor of lambda.
    -   Compare likelihood of output under rescaled and original trees.

-   The model for these is a single constant rate of transition between
    all states. Wondering what would happen if we didn't refit the model
    to each tree but simply compared the likelihood of the model fit to
    the original tree when analyzed with the dataset on the modified
    tree.

Carl Boettiger: useful software
-------------------------------

-   I gave a 20 minute introduction to subversion and Mendeley.
    -   Gave a demonstration on using subversion with MrBayes. Useful
        example, but should have emphasized the generality. Also didn't
        have a chance to demonstrate the rapidsvn GUI.

-   I've added information about **[using
    subversion](http://bodegaphylo.wikispot.org/Version_Management "http://bodegaphylo.wikispot.org/Version_Management")**
    to the Bodega wiki.
    -   Settled on rapidsvn as the suggested GUI, even though I'm not
        totally happy with it. The kdesvn gui seems a better choice for
        linux, but rapidsvn works on all platforms and has an [excellent
        guide.](http://www.rapidsvn.org/index.php/Main_Page "http://www.rapidsvn.org/index.php/Main_Page")

\

Justin Whittall: cts character traits
-------------------------------------

[Official slides and
tutorial](http://bodegaphylo.wikispot.org/Continuous_Character_Evolution_%28Whittall%29_2010 "http://bodegaphylo.wikispot.org/Continuous_Character_Evolution_%28Whittall%29_2010")

-   Check out the Charlie Nunn Papers.
-   Compare incoperates uncertainty in the species means.
-   Are contrasts standardized by branch length? Absolute value of
    contrast independent of standard deviation of contrast? If not,
    transform data..

\

My Thoughts and Explorations for the Day
----------------------------------------

-   Many analyses are not explicit about the model used and the
    assumptions it involves!
-   Not happy with the independence assumption on columns of the
    alignment in DNA data. We can quantify the predictive capacity of
    that information...
-   Rich Glor's likelihood test under Pagel's lambda. seems a strange
    thing to do, what does it actually mean?
-   Need to explore the later applications of independent contrasts
    further.

Research Progress
-----------------

-   Figuring out strange behavior in ouch. the value kept at model@alpha
    is actually the [Cholesky
    decomposition](http://en.wikipedia.org/wiki/Cholesky_decomposition "http://en.wikipedia.org/wiki/Cholesky_decomposition")
    of the alpha matrix, just as the values of sigma are the Cholesky
    decomposition of the σ^2^ matrix. This seems like a strange
    convention, surely the user would rather specify the matrices as
    full matrices and let the software do the decomposition? Because
    this decomposes matrix *M* into *M* = *L**L*^*T*^, for single trait
    value alpha is a scalar and this is the square root. sym.par()
    function in ouch is often called in the source to assemble M from
    the decomposition...

\

