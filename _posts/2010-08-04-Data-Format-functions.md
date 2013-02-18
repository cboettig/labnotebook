---
layout: post

categories: evolution
title: Data Format functions
---






 








-   Spent much of the day trying to code an intelligent
    data-preprocessing function. Seems to mostly be working now, see
    github for details. Testing on a variety of datasets.

-   Currently the function assumes paintings can be specified by common
    ancestors of a set of tips, assumes non-overlapping clades. Doesn't
    error-check for this either.

-   should also have more output processing functions, particularly to
    return a "phylo" object together with paintings (see earlier
    existing code in my Comparative-Phylogenetics repository).

Exploration on new data sets
----------------------------

-   **Carnivora** -- running with aquatic/terrestrial encoding and
    marine/freshwater/terrestrial encoding. Both set to run overnight.
    Wrightscape's simplex method has some trouble with certain initial
    conditions on the three-regime model.
-   **Mammalia** -- body size, with regime by biome (aquatic,
    terrestrial, volant (bats). Huge data set, also running over night.
-   **Cetacea** -- body size by diet. my preprocessing function seems to
    have some trouble with the painting

\

\

