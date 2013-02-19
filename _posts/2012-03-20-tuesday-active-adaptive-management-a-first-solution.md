---
comments: true
date: 2012-03-20 22:31:42
layout: post
slug: tuesday-active-adaptive-management-a-first-solution
title: 'Tuesday: active adaptive management, a first solution'
redirects: [/wordpress/archives/4311, /archives/4311]
categories:
- ecology
tags:
- pdg-control
---

Spent way more of today than I wanted to hammering out the active adaptive management implementation for a trivial model-choice problem using the discretized belief-SDP approach.  

We have alternate models $f_1$ and $f_2$ of the state equations (population growth dynamics)
$$ x_{t+1} = z_t f(x_t) $$
and introduce a continuously valued belief probability $p$ that model 1 is correct.  This lends itself to a Bayesian updating rule for our belief based on observing a transition from $x$ to $y$, 

$$ p_{t+1} = \frac{p_t P(y, f_1(x))}{p_t P(y, f_1(x)) + (1- p_t) P(y, f_2(x))}$$

We define a two-dimensional state space as the continuously valued population density $x$ and belief $y$, and then discretized both of these to fixed grids (feeling acutely the curse of dimensionality in the process.) We calculate and SDP matrix which essentially "factors" the original, known model matrix over beliefs, and have to keep track of this giant creature. The implementation is rather straight-forward, with a little book-keeping, but somehow I introduced a bug or two along the way which I proceeded not to track down very effectively... 

Not sure that I have this working yet.  I now get agreement between the optimal strategy proposed when model 1 is known to be correct, and the the optimal strategy proposed when there are two models, and model 1 is most likely; however this active adaptive solution does not seem to vary with belief state(!) so something is still wrong.  




	
  * [model_uncertainty.md example](https://github.com/cboettig/pdg_control/blob/ec5a588a92b02d46931d709f8bce51cd097bf754/inst/examples/model_uncertainty.md)

	
  * [history](https://github.com/cboettig/pdg_control/blob/master/inst/examples/model_uncertainty.md)











