---
comments: true
date: 2010-11-29 07:21:00
layout: post
slug: challenges-in-estimating-phylogenetic-signal
title: Challenges in estimating phylogenetic signal
redirects: [/wordpress/archives/478, /archives/478]
categories:
- evolution
---

Uncertainty in estimate of lambda illustrated by simulating 1000 data sets on the Geopsiza tree under a model with lambda = 0.62.  Shows the high uncertainty in estimating lambda at all, despite the power in the estimate at this value.

![]( http://farm6.staticflickr.com/5284/5219389687_265d4e8b5c_o.png )


([Code](https://github.com/cboettig/Comparative-Phylogenetics/commit/6295eb867ca011816972d0260b66db896e7c48a5#diff-0))


Will fill this out further later.  Will be interesting to compare at different base values of lambda used for the simulation.  
Have updated the codbase to provide bootstraps of parameters as part of the monte carlo output.  Requires another generic function introduction: getParameters (in addition to getLikelihood), will probably make optional to keep method simple and general.  See the [PMC package code](https://github.com/cboettig/Comparative-Phylogenetics/commit/0b3a5f6ea0a8ae955e97fbdfabaf73302c104962#diff-1).




###  Inference in larger trees 


Two days later... Dec 1st: I run roughly the same strength of phylogenetic signal but with a much larger (simulated) tree, with 354 tips.  Here the estimate is at least centered around the true value and contains none of the zero estimates of the geospiza tree.  

![]( http://farm6.staticflickr.com/5203/5225272183_99f25c7fd0_o.png )


