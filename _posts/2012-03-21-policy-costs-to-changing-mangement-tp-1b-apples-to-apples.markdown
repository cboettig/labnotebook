---
comments: true
date: 2012-03-21 14:42:57
layout: post
slug: policy-costs-to-changing-mangement-tp-1b-apples-to-apples
title: 'Policy costs to changing mangement, TP 1b: Apples to Apples'
redirects: [/wordpress/archives/4334, /archives/4334]
categories:
- ecology
tags:
- pdg-control
---

A central question of training problem 1b addressed at the working group was how to compare the different penalties.  Following up on those discussions, here are a few notes on how far I've gotten in the analysis regarding the best way to make these comparisons.




	
  * [simulate_npv_curves](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/simulate_npv_curves.md) Nice job of showing the performance of the variance ratio, clear example for L2.  Correlation test should probably be applied to differences, pattern is much less clear.  As for NPV comparison, looks too noisy, should calculate exactly from the SDP policy matrix in the way Michael suggested. 

	
  * [exact_npv](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/exact_npv.md). Much clearer plot than the stochastic case, not sure why asymmetric shows no penalty. Note that fixed costs keep increasing, getting policy-cost to exceed NPV0, implying that the profit margin has gone to zero.  Probably not worth computing the cases that go beyond this.  Surprised how much a difference discretization makes too.

	
  * updated [policycost_L1](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/policycost_L1.md). I've updated the simulation function to keep track of policy costs and total costs on the fly, so I no longer need to calculate these post-hoc, but this breaks the earlier version calls to ForwardSim. Likewise I've updated the policy cost dynamic programming solution to allow for arbitrary cost penalty, and to treat the quadratic effort penalty as a cost (for accounting purposes) which also breaks the prior version of these calls.  Note that we're also in Dan's values for default parameters now.  This file has been updated to reflect these changes, the examples of other penalties should be one-line chances to this code.



Example figures (more figures and details in the analyses linked above)

![]( http://farm8.staticflickr.com/7068/6983560431_053aa815b0_o.png )


![]( http://farm8.staticflickr.com/7061/6842399336_6eaaa99e3d_o.png )

