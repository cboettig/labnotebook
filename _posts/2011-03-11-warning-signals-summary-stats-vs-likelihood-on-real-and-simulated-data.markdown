---
comments: true
date: 2011-03-11 14:35:05
layout: post
slug: warning-signals-summary-stats-vs-likelihood-on-real-and-simulated-data
title: 'Warning signals: summary stats vs likelihood on real and simulated data'
redirects: [/wordpress/archives/1177, /archives/1177]
categories:
- ecology
tags:
- warning-signals
---

Added bar of observed tau on real data to the tau distributions.
Fixed the tau-distribution method, running new data and real examples now.

Simulated data: can tell tau apart for instance, for autocorrelation (see photostream for variance, code hash for parameters, etc).
![]( http://farm6.staticflickr.com/5298/5518459610_b4a79201a7_o.png )


While can't really tell anything based on the tau on the autocorrelation for the Deuterium data for Glaciation III (which has just about the clearest signal of the deuterium set):
![]( http://farm6.staticflickr.com/5251/5517841341_5a20b049e4_o.png )


Waiting to see how the likelihood statistics compare on these examples.

Today's runs:
[flickr-gallery mode="search" tags="warningsignals" min_upload_date="2011-03-11 00:00:00" max_upload_date="2011-03-11 23:59:59"]

With more replicates, simulated data shows the increased power of the likelihood approach relative to the summary statistics:

![]( http://farm6.staticflickr.com/5132/5518595002_6fd35d8d2d_o.png )

![]( http://farm6.staticflickr.com/5140/5518595068_abb5a72cbe_o.png )




Likelihood-based approach for the same data:
![]( http://farm6.staticflickr.com/5258/5519026318_9e0e5dd5d0_o.png )



#### CaCO3 data


The model fit to CaCO3 data actually suggests a stabilizing pattern as the best fit, despite the fact that the estimated autocorrelation is positive.  This produces null distributions with largely negative Tau trends in variance (seen in the real data as well) and a negative overall pattern in autocorrelation.  The models can be identified by likelihood, though in this case it for a trend of increasing rather than decreasing eigenvalue.  

[![](http://farm6.static.flickr.com/5096/5517792569_f634b329a0_o.png)](http://farm6.static.flickr.com/5096/5517792569_f634b329a0_o.png)[![](http://farm6.static.flickr.com/5220/5518384482_55998356c0_o.png)](http://farm6.static.flickr.com/5220/5518384482_55998356c0_o.png)
[![](http://farm6.static.flickr.com/5255/5518867116_dd06e88cef.jpg)](http://farm6.static.flickr.com/5255/5518867116_dd06e88cef.jpg)





### Manuscript working notes


Should make plots for a panel showing how the nonlinear S curve model reduces to a quadratic saddle-node bifurcation picture which reduces to a linear OU model (with moving-average,  changing noise and stability, both pictorially and by equations).
