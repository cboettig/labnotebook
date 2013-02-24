---
comments: true
date: 2011-12-05 18:45:32
layout: post
slug: monday-wrightscape-meetings-pdg-meeting
title: Monday - wrightscape meetings, PDG meeting
redirects: [/wordpress/archives/3472, /archives/3472]
categories:
- evolution
- ecology
tags: 
- pdg-control
- wrightscape
---

Wrightscape -- added a user utility to to specify custom model types, such that some subset of the total number of regimes can share certain parameters.


## Peter Meeting
	
* Derivation -- provide clear examples of the differences and by how much it matters.
* Expected result from the biology: the jaw lever traits should show greater changes than the other traits after a release of constraint.
* Based on previous studies, expect most of the action to be around the intramandibular joint innovation.

## Luke Meeting

* Set up wrightscape to run on the _Anolis_ ecomorph data.  Requires custom_Multitype() to specify separate shared and independent parameters on different regimes.
* Get wrightscape to compile on Luke's Mac.  He has gsl libraries installed, yet somehow package won't compile by R, complains that R cannot find gcc-4.2.  **Solved** aliased gcc to gcc-4.2, and compile worked fine.  Wish that didn't take so long to think of.
* Up and running on Luke's _Anolis_ data.


## PDG Training Problem 1 Conference Call


### 1b: penalties on rate of change of control variable.

* c depend on h -- not a velocity penalty.
* L_1 vs L_2  is a bigger penalty for large changes, small penalty for smaller
* Operational question: do penalties change the nature of the optimal policy?
* No cost penalties, upper bound on h
* Jake with h_max stochastic problem -- lose the state independence, alter the Reed solution.
* Highlight differences from constant-escapement policy.

### 1a: curvature question

Focus on cases where state equation has stable node, chattering/limit cycles introduced by the control.

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2011-12-05 8:00:37" max_upload_date="2011-12-05 23:23:37"]
