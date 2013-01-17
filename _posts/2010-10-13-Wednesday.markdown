---
layout: post

categories: evolution
title: Wednesday
---






 








### Monte Carlo

-   Reading Sanderson's nonparametric rate smoothing and semi-parametric
    r8s papers in Monte Carlo with Rannala. Comments on articles in
    text, but great discussion today, particularly Bruce's take on this
    style of approach.

1.  Sanderson, M.J. Estimating absolute rates of molecular evolution and
    divergence times: a penalized likelihood approach. Molecular biology
    and evolution 19, 101-9(2002).
2.  Sanderson, M.J. A Nonparametric Approach of Rate Constancy to
    Estimating Divergence Times in the Absence. Molecular Biology and
    Evolution 14, 1218-1231(1997).

\

### Hastings lab presentation

Presented chalk talk on the Warning Signals project (see stochastic
population dynamics notebook).

### Misc

Mendeley upgrade for Ubuntu up, still need to explore groups and
reconsider organization of my lists...

### Writing LR continues

see version history.

### R list discussion continued

Good question about the applicability of lambda transforms to discrete
models (though included in Geiger examples). Interpretation isn't
trivial, but neither can it be dismissed as simply incorrect to do.
Here's my take:

Good question. Lambda is often taken as a measure of phylogenetic
signal. It's just a tree transform, so it's just a matter of trying to
explain what it means to say a discrete model would fit better if you
rescaled the tree like so. In the BM case, you would argue that lambda
<< 1 might mean something rather non-brownian is going on, making things
forget their ancestry faster. In this case, it seems Lara is assuming an
equal rates model, which means that an unbalanced fraction of taxa in a
particular trait value can only be explained by phylogeny; not by the
stationary solution of some model. A good fit with small lambda would
indicate that the phylogeny was not being helpful in explaining this
imbalance (imagine an 80/20 split in a binary trait arranged in the
least parsimonious manner possible -- this would prefer a small lambda
and a hint that ecological forces are playing a more important role than
phylogenetic inertia).

If the rates can call differ, small lambda (an unimportant influence of
phylogeny) may be confounding with higher transition rates, such that
the system can forget its ancestry quickly and reach the stationary
distribution. In such cases estimating the tree transforms such as
lambda will have identifiability issues -- perhaps that plays a role in
Lara's convergence error messages.

In general if the model is fitting better with the tree transform then
without it, this can be taken as an indication that the model itself
isn't a good description of the data. I think that's as true in the land
of continuous traits and BM as it is in discrete traits, regardless of
how that particular transform is defined or motivated. Perhaps others
would comment on this perspective.

\

