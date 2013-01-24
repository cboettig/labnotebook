---
comments: true
date: 2011-10-27 13:53:50
layout: post
slug: optimal-control-next-steps
title: Optimal control sample problems (Mostly continuous time by Pontryagin principle)
redirects: [/wordpress/archives/3049, /archives/3049]
categories:
- ecology
tags:
- pdg-control
---

###  Optimal Control by Pontryagin principle 





#### Problem statement 





	
  * State equation: $\dot x = x \exp \left( \alpha \left(1-\frac{x}{K}\right) \left( \frac{x-C}{K} \right) \right) - x h$


	
  * Utility function $\pi(h, x, t) = \frac{h^{1+\gamma}}{1+\gamma}$


	
  * Boundary constraints: $x(0) = X_0 \qquad x(T) = X_T$




See problem statement and analytic BVP formulation details in [this post](http://www.carlboettiger.info/archives/3001).  Additionally we scale the variables appropriately.  Then we can begin with some basic parameter exploration in the original model formulation.  We solve by collocation: 


![]( http://farm7.staticflickr.com/6232/6286772118_872b47a7f7_o.png )


Decreasing the ecological dynamics timescale (growth rate $\alpha$ ) leads to less fishing eventually but also slower decrease in fishing rate:

![]( http://farm7.staticflickr.com/6046/6286772066_b37c2e7588_o.png )


Increased discounting means fish faster now and....

![]( http://farm7.staticflickr.com/6223/6286391925_da5987dce6_o.png )


...whoops, put fish back in the sea later (negative harvest).

Control on harvest directly rather than harvest effort gives ill-behaved solution:

![]( http://farm7.staticflickr.com/6094/6287043786_05e270fa1d_o.png )






	
  * **Code [defining the system](https://github.com/cboettig/pdg_control/blob/1fb870e5a22a54fdb44f8e25ad65a74822c60188/training_prob2_collocation.R)**.


	
  * **Code for [running the examples](https://github.com/cboettig/pdg_control/blob/1fb870e5a22a54fdb44f8e25ad65a74822c60188/run_collocation.R)**.







##  Inequalities 



This solution has only equality based constraints. A trivial inequality to consider is the final stock size is properly a lower bound, but clearly the optimal solution will attain this bound.  The next inequality constraint to consider is $ h > 0 $, avoiding results such as above.  I believe this constraint must enter through the state equation, as it is a dynamic constraint?

We could solve the Hamilton-Jacobi-Bellman equation instead; may be a good building block for the stochastic case.  Perhaps warm up for this using the discrete case...




###  Discrete-time state equation 



a discrete Ricker-style model:
$$ x_{t+1} = f(x,h) = x \exp \left( \alpha \left(1-\frac{x}{K}\right) \left( \frac{x-C}{K} \right) \right) - h \beta $$
or a more Beverton-Holt style model:
$$ x_{t+1} = r\frac{x^{\alpha}}{1+\frac{x^{\alpha}}{K}} - x E_h \beta $$

Sounds like a dynamic programming approach is called for.  




###  Stochastic Optimal Control 


Looks like this needs a dynamic programming approach.  




###  Higher-dimensional state equations 







###  Steps check list 





	
  1. Simple boundary-value problem solution by collocation. [Example](http://www.carlboettiger.info/archives/3001).

	
  2. Chebychev polynomial collocation

	
  3. Jim's additional examples. Matlab examples.

	
  4. Harvest vs fishing effort as control variable.

	
  5. Solution under inequality bounds

	
  6. Discrete-time state equations

	
  7. Stochastic Control

	
  8. Horan 2 dimensional system









