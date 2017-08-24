---
comments: true
date: 2011-01-31 12:15:45
layout: post
slug: notes-on-bokma-2010-evolution-in-drifts-and-jumps
title: 'Notes on Bokma 2010: evolution in drifts and jumps'
redirects: [/wordpress/archives/886, /archives/886]
categories:
- evolution
---

[Bokma 2010](http://dx.doi.org/10.1093/sysbio/syq029) asks if there is an analytic expression for the likelihood in the evolutionary model he describes.

The trait value of the process is determined by two things -- a Brownian motion random walk (diffusion) with rate parameter $ s_a^2$ and speciation events.  Under a speciation event, the trait jumps to a new value that differs from it's parent's by some amount chosen from zero-mean normal distribution with variance $ s_c^2$.  Speciation events occur as a Poisson process at rate $ \lambda$.  Species go extinct at rate $ \mu$, terminating the process along that branch.

First, observe that in the purely speciational case in the limit where $ s_c^2$ is small and $ \mu = 0$, we have a diffusion limit to a Brownian process.  However, in Bokma's model, the branches don't assume the trait value of their ancestor as their starting point $ x_a$, but draw a random step away from there: $ x_a + N(0, s_c^2)$.  This is equivalent to lengthening a branch by a factor of $ s_c^2$ for every node (branching event) it has since its common ancestor.  This creates a pattern that is in principle distinguishable from the purely gradual Brownian model.  Of course the inference problem faces the difficulty of extinctions such that the number of nodes cannot be known.

Bokma asks if it is possible to write down the likelihood function for the birth-death parameters and trait parameters.  Under the standard BM+birth/death models, these are independent and we have analytic forms for both.  In the pure birth model, we can still estimate the likelihoods independently, as the estimated birth rate $ \lambda$ does not influence the number of nodes and thus the number of jumps in the cladogenetic evolution.  Bokma's likelihood (eq 2 in the paper) only becomes a challenge when the number of nodes is unknown because of the extinctions.  Bokma proposes the ABC approach, simulating realizations of the birth-death process and trait evolution under different values of the parameters and using some distant metric between observed and simulated values in place of the likelihood.

It seems an efficient analytical approximation would simply assign the expected number of extinction events to be observed along each branch.  As there is the same amount of total time in each data point, I first assumed the number of expected cladogenetic events would be the same for each data point, and thus just be a rescaling of the tree.  Of course this ignores the information that some have surviving branch events, while others do not -- so rather, this would be conditional on the number of branching events already known: The number of ancestral nodes between the tip and the root given the number/position of those that persisted to present day (and the birth & death parameters) can already be estimated from the birth-death likelihood function.   This should be known, will have to look it up (conditional probability those lineages haven't gone extinct and any others born in that time have -- just this time it is maximized/varied over events while birth-death parameters are held fixed).  Knowing the number of expected events, the branches can be lengthened appropriately by factors of $\sigma_c$ and then the diversification rate $ \sigma_a$ estimated.
