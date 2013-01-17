---
layout: post

categories: evolution
title: Peter Meeting
---






 








Discussed potential solution to the model choice scenario:

-   Consider an ordered list of models, A, B, C, D
-   Then the Neyman-Pearson Lemma (see earlier entry on this) lets us
    walk through the list in the following fashion: We generate the
    simulated data sets under model A and compare likelihood ratios in
    each case. If the likelihood ratio of the observed data falls
    outside the 95% confidence interval, than it with this confidence
    that we are saying the data justify the alternate model (model B).
    Then repeat, generating under model B and comparing to model C, and
    so forth until we cannot reject the simpler model.

More subtle concerns:

-   The model generating the data used in the bootstrap in an estimate,
    and shouldn't be treated as the true model with no uncertainty, but
    rather be bootstrapped itself.
-   Of course the method should consider probabilistic partitions of the
    data. The MLE partition alone will be misleading.

Notes
-----

-   My lightning talk proposal to iEvoBio was accepted!

-   Still mostly working in the Stochastic Population Dynamics notebook
    this week.

\

