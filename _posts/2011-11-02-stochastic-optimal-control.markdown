---
comments: true
date: 2011-11-02 22:57:57
layout: post
slug: stochastic-optimal-control
title: Stochastic Optimal Control
redirects: [/wordpress/archives/3124, /archives/3124]
categories:
- ecology
tags:
- pdg-control
---

Starting with Reed 1979 Reed, 1979.
Consider the stochastic population growth model

$$ X_{t+1} = Z_n f(X_n) $$

$ f(x) $ is concave and non-decreasing (compensating, not over-compensating).  A natural choice is the Beverton-Holt model,

$$ f(x) = \frac{A x}{1+B x} $$

Cost of harvest is Schaefer production function $ c(x) = k/q x $, (i.e. doubling fish density halves the cost, assume $q $ constant), or Cobbs-Douglas form $ c(x) = k/x^{\theta} $ where $ \theta = 1+\beta \leq 1$.  

We'll solve through a dynamic programming approach using the Bellman equation.  

We begin by discretizing the system to a grid.  Let us assume that the fish population can only assume a set of discrete values, $ x \in \{ x_i \} $ on a grid $N \in (0, x_2, x_3, ..., 2 K) $, where $K$ is the unharvested equilibrium.  (Of course if we think of $ x $ as number instead of density, this finite, discrete case is natural).  Let us further assume that the control variable, harvesting level, can only assume discrete values as well.  For convenience we'll use the same grid, since it doesn't make sense to harvest fractions of fish or more than the total stock, but let's call this grid $ H $.  Time is already discrete in the model above, assuming values $ t \in \{0, 1, 2, \ldots, T \} $.  

[Code](https://github.com/cboettig/pdg_control/blob/41023cdf80f2f41bf215d83f94bb32b4e485bc46/R/Reed.R).

Results: Optimally harvested (black) and unharvested (green) population dynamics, for a stochastic realization.

![]( http://farm7.staticflickr.com/6213/6307860283_47fc9e704c_o.png )




From the original Matlab example from michael (run in Octave):

![]( http://farm7.staticflickr.com/6102/6308462214_1f255cc3ca_o.png )










-  Optimal Escapement Levels in Stochastic And Deterministic Harvesting Models, William J Reed,  (1979) *Journal of Environmental Economics And Management*, **6**    [10.1016/0095-0696(79)90014-7](http://dx.doi.org/10.1016/0095-0696(79)90014-7)
