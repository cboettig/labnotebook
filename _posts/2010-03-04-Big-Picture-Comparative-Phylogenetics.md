---
layout: post
tags: [code-tricks, ]
categories: evolution
title: Big Picture Comparative Phylogenetics
---






 








-   A [Task
    View](http://www.bio.unc.edu/faculty/vision/lab/CPM_taskview.html "http://www.bio.unc.edu/faculty/vision/lab/CPM_taskview.html")
    on Phylogenetic Comparative Methods (in R on CRAN) has been released
    today, maintained by Brian O'Meara. Quite thorough and concise.

-   Follow-up discussion on:
    -   List is useful, but would be nice to be able to expand /
        collapse the list to see more / less details about the functions
        available. More detail makes it harder to maintain, perhaps get
        the developers involved?
    -   List is also quite provocative source to realize what's missing
        (there's no way to estimate ancestral states under OU using
        existing software?) I'm interested in exploring a way users
        could both suggest and then rank / vote for certain requests to
        be implemented, in the style of
        [uservoice](http://www.uservoice.com "http://www.uservoice.com")
        or
        [stackoverflow](http://www.stackoverflow.com "http://www.stackoverflow.com").
        Piloting an [example of
        this](http://phylogenetics.uservoice.com "http://phylogenetics.uservoice.com")
        during the phylogenetics workshop at Bodega.

* * * * *

1:30 pm Meeting with [Tom
Near](http://www.yale.edu/eeb/near "http://www.yale.edu/eeb/near"),
visiting from Yale. Chance to discuss both projects in this notebook:

-   Inferring multistate optima and transitions.
-   Assessing power in trees; bootstrapping model fits.

* * * * *

2pm 4pm Installing software for [Bodega Phylogenetics Workshop next
week](http://bodegaphylo.wikispot.org/2010_Workshop "http://bodegaphylo.wikispot.org/2010_Workshop").
Some packages are Linux friendly, others less so. Java packages are
particularly useful/reliable as cross-platform apps.

-   BEAST -- Java
-   BEST -- C compiles fine with make.
-   Brownie -- C++ won't compile (no configure script)
-   FigTree - Java
-   Garli -- C++, requires Nexus Class Library installed (C++ library
    which installs fine with configure, make, make install). However
    Garli still refuses to compile with enough errors to make me feel a
    header file is missing (things undefined, stdio.h undeclared, etc).
-   Mesquite -- Java
-   Phylocom -- R, src (in C, which compiles fine with make), directory
    also contains Win and Mac binaries
-   MrBayes -- Is in the Ubuntu repositories, just apt-get it. Rock on!
-   RaxML -- C, just run the gcc version of the makefile. Haven't tried
    the MPI version
-   Tracer -- Java

\

* * * * *

4pm EVE Seminar: Tom Near

-   Antarctic fishes as an example of an adaptive radiation. Fossil
    record shows cosmopolitian mix of species: skates, labrids, sharks,
    cods. At the time the continent was farther north and warmer
    (geological record and δO~18~ isotope describes temperature.) Mass
    extinction, followed by invasion of this antarctic group with
    protein for antifreeze that rapidly radiates into dominant fish
    diversity form in the region. Strong result for much faster
    speciation relative to nearby groups.

