---
layout: post

categories: [ecology]
title: Status on Structured Populations
---






 








### Model roundup

1.  **metapop** Two populations with one-step transitions. IBM in C
    code, R interface to IBM and linear noise approximation.
2.  **crowley** One-step transitions version of metapop. R interface to
    IBM and linear noise.
3.  **beetles** Two-step transitions with exponential waiting times in
    age classes. R interface completed in ind\_based\_models.R
4.  **hastings** Simple two-step model. no R interfaces yet.
5.  **tribolium** Non-markov aging process. R interface completed in
    simulate.R. includes likelihood inference as well.

-   Individual-based models, implemented in C using my gillespie
    library, interfaced in R in ind\_based\_models.R. Could probably
    benefit from C++ class structure, as the codes involve more written
    repetition than necessary, and renaming similar functions to avoid
    name conflicts in the object files for the R package. All individual
    simulations now include parallelization of replicates the C level
    via the gillespie library, which seems to be working correctly even
    when called from R.

-   R files with model names include individual based simulation and the
    approximation, plotted in comparison.

-   Beetles simple noise simulation likewise does not agree with the
    approximation, still troubleshooting the approximation.

![image](http://openwetware.org/images/8/82/Beetles_bugs.png)

Other exploration
-----------------

Revisit Phil Holmes notes on free-response protocol / information theory
and Neyman-Pearson theorem.

Meetings
--------

-   Schreiber Lab meeting, discussed articles 4 and 5 below.
-   Discussion with Graham, see phylogenetics notebook.
-   GTC meeting, more on toolbox, interesting stats discussion
    afterwards, neg binomial as number of failures before n successes,
    claim that this almost always outperforms poisson models (in
    information criteria sense) on ecological datasets -- nothing is
    ever uncorrelated...

Reading
-------

A couple good articles today, see Mendeley for details.

1. Goel AK, Vattam SS, Rugaber S, et al. Learning Functional and Causal
Abstractions of Classroom Aquaria The SBF Theory of Understanding of
Complex Systems ACT : Interactive Construction of SBF Models. In Review.
2010.

2. Crutchfield JP, Whalen S. Structural Drift : The Population Dynamics
of Sequential Learning. In review. 2010:1-14.

3. Raghib M, Hill Na, Dieckmann U. A multiscale maximum entropy moment
closure for locally regulated space-time point process models of
population dynamics. Journal of mathematical biology. 2010. Available
at:
[http://www.ncbi.nlm.nih.gov/pubmed/20446087](http://www.ncbi.nlm.nih.gov/pubmed/20446087 "http://www.ncbi.nlm.nih.gov/pubmed/20446087").

4. Lindegren M, Möllmann C, Nielsen A, et al. Ecological forecasting
under climate change: the case of Baltic cod. Proceedings. Biological
sciences / The Royal Society. 2010. Available at:
[http://www.ncbi.nlm.nih.gov/pubmed/20236982](http://www.ncbi.nlm.nih.gov/pubmed/20236982 "http://www.ncbi.nlm.nih.gov/pubmed/20236982").

5. Berkley Ha, Kendall BE, Mitarai S, Siegel Da. Turbulent dispersal
promotes species coexistence. Ecology Letters. 2010;13(3):360-371.
Available at:
[http://blackwell-synergy.com/doi/abs/10.1111/j.1461-0248.2009.01427.x](http://blackwell-synergy.com/doi/abs/10.1111/j.1461-0248.2009.01427.x "http://blackwell-synergy.com/doi/abs/10.1111/j.1461-0248.2009.01427.x").

Misc Code
---------

Apparently R doesn't have a convenient generalized eigenvalue solver
(for case of a matrix on either side). Wrote quick interface to the gsl
lapack routines. Github's gists seem an ideal way to store and share
such code snippets, so here it is embedded.

\

\

\

