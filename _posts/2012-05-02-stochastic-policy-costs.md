---
layout: post
title: Stochastic policy costs
category: ecology
tags: control 
---


Updated runs for various norms, added profit plots.

- [L1](https://github.com/cboettig/pdg_control/blob/ecc1b23594234cbc99def6114d5ccf6f48908e3a/inst/examples/policycosts/L1.md)
- [L2](https://github.com/cboettig/pdg_control/blob/ecc1b23594234cbc99def6114d5ccf6f48908e3a/inst/examples/policycosts/L2.md)
- asymmetric: differs on the sign of the asymmetry? Penalty only for [decreasing quotas](https://github.com/cboettig/pdg_control/blob/ecc1b23594234cbc99def6114d5ccf6f48908e3a/inst/examples/policycosts/free_increase.md).  Penalty only for [increasing quotas](https://github.com/cboettig/pdg_control/blob/ecc1b23594234cbc99def6114d5ccf6f48908e3a/inst/examples/policycosts/free_decrease.md). check implementation.
- fixed transaction fee -- whoops, fixed cost should still be free when `h == h_prev`. 


We need to determine a the magnitude of penalty coefficient to compare between the different functional forms. For instance, for what value of `c` is an `L2` penalty,
\\( c ( h_t - h_p )^2 \\) comparable to the `L1` penalty, \\( c  \operatorname{abs}(h_t - h_p ) \\) ?

I think we decided that we should select this parameter such that the penalty induces the same equilibrium expected profit from fishing (before costs of policy-changes are subtracted) in each functional form.  Is this correct?  

Consequently we simply calculate this expected-profit-from-fishing under each penalty over a range of `c` values, and plot a curve for each profit value as a function of `c`.  A horizontal line across this graph at, say, 50% of the adjustment-costs-free (i.e. Reed) profits would intersect each curve at the value of `c` that corresponded to this common baseline.  Was that the agreed upon apples-to-apples strategy?


- Computing this from the numerics: average over replicates. Provides variance estimates too, but rather noisy. [results](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/simulate_npv_curves.md)
- Computing exactly from the SDP solution -- record the equilbrium value-to-go would be before profits have been added. [results](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/exact_npv.md).  Also needs rerunning with corrected fixed-fee model. 

