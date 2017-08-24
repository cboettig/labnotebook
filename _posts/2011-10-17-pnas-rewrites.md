---
comments: true
date: 2011-10-17 17:37:19
layout: post
title: Rewrites
categories:
- ecology
tags:
- warning-signals
- delayed-release
---

- Add more data set examples
- Remove skew, Remove the broken CaCO3 analysis
- Show distributions for increased sampling effort.
- Does time interval make a difference for convergence of deuterium2 run?  Nope.  Fails in parallel, running in series.


## Code:


* get away from explicit parallelization and deeply nested functions.
* really master optimizers, and avoid errors & failed convergence.
* store finished data for plotting as data objects.
- CaCO3 example -> MLE estimate of unstable model doesn't converge, shouldn't be used to simulate then! Add functions to check this convergence.
- Examples: Could use further examples, not so convincing as is.
- rescale time before fitting doesn't change anything.
- show fixed true pos, fixed false pos.
- show thresholds, show observed
- scripts that save must use rm list=ls()
- G6, G10, ibm_short, deut2 running.
