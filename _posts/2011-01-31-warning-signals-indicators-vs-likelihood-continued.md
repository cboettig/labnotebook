---
comments: true
date: 2011-01-31 16:49:22
layout: post
slug: warning-signals-indicators-vs-likelihood-continued
title: 'Warning signals: Indicators vs Likelihood continued'
redirects: [/wordpress/archives/898, /archives/898]
categories:
- ecology
tags:
- warning-signals
---

Continuing to explore examples

Some difficulty in the "snowfall" parallel computation engine, removing the ~/.sfCluster directory seems to reset the error "unable to unserialize nodes..."  Also don't have good handling of variable names for tracking the boostrapping of parameters.  For the moment have just added a toggle to suppress these to avoid dim mismatch in rownames command.  Strange that this happens to the indicator_vs_likelihood code but not to the nearly-identical call to montecarlotest() in lin_bifur_models.R.

Various simulation/analyses runs from today:
[flickr-gallery mode="search" tags="warningsignals" min_upload_date="2011-01-31 00:00:00" max_upload_date="2011-02-01 8:59:59"]

trying still-harder-to-detect change (m=-.01)
Running right now on zero:



	
  * at nice 15: indicator_vs_likelihood.R

	
  * at nice 19:  indicator_vs_likelihood.R (with more reps?)

	
  * at 18: LTC.R

	
  * at 17: LSN.R


