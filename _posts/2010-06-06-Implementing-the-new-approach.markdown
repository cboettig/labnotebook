---
layout: post

categories: evolution
title: Implementing the new approach
---






 








-   Spent just about the entire day off and on implementing the approach
    described in yesterday's entry. Code includes the more direct
    implementation of the likelihood by generating trees from the
    process and averaging, as well as by weighting trees by their
    probability. Methods appear to agree reasonably well. The second
    approach should generate a wider variety of trees instead of using
    those produced by the first method. This could be done by varying
    the parameters of the transition rates to populate the collection.
    This needs significantly more exploring.

\

-   Note that the major time savings in the new approach stem from the
    fact that when the transition matrix is changed, it may not be
    necessary generate new trees, only to change the weights ![
    P(C|\\mathbb{Q})
    ](http://openwetware.org/images/math/5/a/0/5a0d9e1f1ef3c42a0ec1e51e7535d4e1.png),
    and therefore it is not necessary to recalculate the likelihood of
    the OU model, since the painting hasn't changed. Indeed, even the
    optimization / posteriors can be saved for each tree, offering
    substantial computational savings. In this way, every time the
    algorithm generates and fits a new tree, it can use that information
    for the rest of time, while it uses the MCMC approach to generate
    more likely trees, rather than trying an exhaustive approach. Note
    that this is MCMC approach can be used for an entirely frequentist
    style if desired, not all MCMCs are used to integrate posteriors.
    The makov chain construction part just speeds up the integration by
    monte carlo approach by focusing on the meaningful area of parameter
    space.

-   Still actually need to implement the MCMC portion, so far just
    calculates the likelihood.
-   Also should implement the multi-tree initialization and
    tree-augmentation steps.

Implementation of the approach ([version stable
copy](http://github.com/cboettig/Comparative-Phylogenetics/blob/75b7bfdc7b1d5ccd3ce986db9cd5f7dd034cd5d1/R/method3.R "http://github.com/cboettig/Comparative-Phylogenetics/blob/75b7bfdc7b1d5ccd3ce986db9cd5f7dd034cd5d1/R/method3.R"))
([most current
version](http://github.com/cboettig/Comparative-Phylogenetics/blob/master/R/method3.R "http://github.com/cboettig/Comparative-Phylogenetics/blob/master/R/method3.R")).

Computational note: All in pure R, may move all or slowest parts to C
after profiling and optimization. Requires the
[msm](http://cran.r-project.org/web/packages/msm/ "http://cran.r-project.org/web/packages/msm/")
package (multistate/hidden markov) for [its matrix
exponentials](http://pbil.univ-lyon1.fr/library/msm/html/MatrixExp.html "http://pbil.univ-lyon1.fr/library/msm/html/MatrixExp.html").

\

\

