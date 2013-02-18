---
comments: true
date: 2011-01-06 10:56:11
layout: post
slug: two-routes-to-adaptive-branching
title: Two routes to adaptive branching
redirects: [/wordpress/archives/733, /archives/733]
categories:
- ecology
tags:
- adaptive-dynamics
---

Simulations completed, help accentuate the different paths for branching.  When the most failures occur while waiting for the first mutation to enter first established dimorphism, mutation rate seems limiting (left):

![]( http://farm6.staticflickr.com/5082/5330189191_a102ab6930_o.png )


![]( http://farm6.staticflickr.com/5003/5330799994_d9d050c587_o.png )


(right) With a higher mutation rate, most collapses back to monomorphism occur after a mutation successfully invades in the dimorphic population. Unfortunately these runs result in large fraction of the ensemble never reaching the final branching, those that do, do so fast:

![]( http://farm6.staticflickr.com/5044/5330262645_409b7f722e_o.png )


![]( http://farm6.staticflickr.com/5243/5330873676_00a39384f4_o.png )


Note that 1e7 is the max running time.  Running a set of new simulations well outside of the range where some will not complete in the max-time interval of 1e7. ([commit](https://github.com/cboettig/AdaptiveDynamics/commit/bb0dd7111f696a1de2654a21df6d03068ac6fae6), [codes](https://github.com/cboettig/AdaptiveDynamics/blob/bb0dd7111f696a1de2654a21df6d03068ac6fae6/demos/fewmore.R) and [more](https://github.com/cboettig/AdaptiveDynamics/blob/593b0ac13b6065aa77c9235edeafdafe4cc0fe8a/demos/step_limited.R) to specify parameters.)  [See flickr collection of today in adaptive dynamics for more](http://www.flickr.com/search/?q=adaptivedynamics&m=tags&d=taken-20110106-20110106&ss=0&ct=0&mt=all&w=46456847%40N08&adv=1), embedded below:

[flickr-gallery mode="search" tags="adaptivedynamics" min_upload_date="2011-01-06 00:00:00" max_upload_date="2011-01-07 00:00:00"]
