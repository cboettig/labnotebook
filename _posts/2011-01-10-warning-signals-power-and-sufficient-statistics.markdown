---
comments: true
date: 2011-01-10 15:57:57
layout: post
slug: warning-signals-power-and-sufficient-statistics
title: Warning Signals, Power and Sufficient Statistics
redirects: [/wordpress/archives/763, /archives/763]
categories:
- ecology
tags:
- warning-signals
---

Working on warning signals manuscript. Looking at overall powercurves as a function of sample size and rate of stability loss in both models.  Planning to repeat that analysis with summary statistics approach to illustrate the relative loss in power of the "leading indicator" approach. (simulations just set up to run now, figures should appear below as they complete.  Click on figures for links to code).



	
  * Power curve based on transcritical bifurcation as a function of rate of stability loss:


[flickr-gallery mode="search" tags="warningsignals, LTC, stability" tag_mode="all" min_upload_date="2011-01-10 00:00:00" max_upload_date="2011-01-12 23:59:59"]

	
  * Power curve based on transcritical bifurcation as a function of sample points:


[flickr-gallery mode="search" tags="warningsignals, LTC, sample, powercurves.R" tag_mode="all" min_upload_date="2011-01-10 00:00:00" max_upload_date="2011-01-12 23:59:59" user_id="46456847@N08"]

	
  * Power curve based on saddle node bifurcation as a function of rate of stability loss:


[flickr-gallery mode="search" tags="warningsignals, LSN, stability, powercurves.R" tag_mode="all" min_upload_date="2011-01-10 00:00:00" max_upload_date="2011-01-12 23:59:59" user_id="46456847@N08"]

	
  * Power curve based on saddle node bifurcation as a function of rate of sample points:


[flickr-gallery mode="search" tag_mode="all" tags="warningsignals, LSN, sample, powercurves.R" min_upload_date="2011-01-10 00:00:00" max_upload_date="2011-01-12 23:59:59" user_id="46456847@N08"]

([code](https://github.com/cboettig/structured-populations/commit/867c55d251aad14ca5ed8d91e897c576ddd5d778))

Significant variation in power based on the simulation.  Also not all runs appear to get adequate convergence for the model fits.
