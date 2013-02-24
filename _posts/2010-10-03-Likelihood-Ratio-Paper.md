---
layout: post
tags: [pmc, adaptive-dynamics]
categories: evolution
title: Likelihood Ratio Paper
---






 








### Higher resolution power plot for Anoles tree

Figure (below right) shows power for increasing alpha in the Anoles
tree. The vertical line shows the estimated value of alpha for the
body-size data -- unlikely that a tree of this size can detect selection
that is this weak even if it were present. Consequently, this fit should
not be taken as evidence that BM is a better fit than the OU, but rather
that the data is insufficient to inform this analysis.

[![image](http://farm5.static.flickr.com/4144/5049237297_86c89766ab.jpg)](http://www.flickr.com/photos/cboettig/5049237297/)

\

### The Geiger model fits

Thinking of extending bootstrap methods to work for geiger tests, i.e.
can one justify the lambda transform?

-   Wrote
    [anoles\_ape.R](http://github.com/cboettig/Comparative-Phylogenetics/blob/8bcb043dd72d45566fa82de4af80672a42443673/demos/anoles_ape.R "http://github.com/cboettig/Comparative-Phylogenetics/blob/8bcb043dd72d45566fa82de4af80672a42443673/demos/anoles_ape.R")
    in Comparative-Phylogenetics code demos, showing converting the
    anoles dataset for use with geiger functions. Will write a general
    bootstrapping that can handle the geiger models. Unfortunately the
    geiger model fits are not general model fit objects that can be
    passed to generic functions such as update and simulate.
    fitContinuous should return the transformed tree, the data, a class
    object of the fit, the call etc, and be assigned a class. Will have
    to get around to this later.

-   Note: for Anoles data, almost none of the tree transformations can
    improve the likelihood. Delta (exp scaling of branch length) does,
    just:

\

#### Model likelihoods for Anoles under various tree transformations

~~~~ {.de1}
> bm$Trait1$lnl
[1] -53.66927
> ou$Trait1$lnl
[1] -53.66268
> lambda$Trait1$lnl
[1] -53.66927
> kappa$Trait1$lnl
[1] -53.66927
> delta$Trait1$lnl
[1] -53.49763
> eb$Trait1$lnl
[1] -53.64517
~~~~

\

\

\

### Back to Writing

Reorganizing the manuscript structure ... again. (draft not shown).
Mapping out the outline here:

#### Are phylogenies Informative?

-   Concerns about the model
-   Concerns about the data
-   phylogenetic signal

#### Examples from Anoles

-   Why model choice BM vs OU
-   Why not AIC -- the overparameterized example
-   Why a power test: BM vs OU

... hmm, how is it dark already? better find my bike lights and continue
this later.

Adaptive Dynamics: Comparing contour plots
------------------------------------------

Meanwhile, some adaptive dynamics simulations have completed at least.
Should remember to save png as higher resolution, but the bottom line
seems to show substantial differences between analytic approximation and
numerical simulation:

[code for figures
below](http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_demo.R "http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_demo.R")

Comparing results, simulation on the left, Analytic on the right.

\

\

