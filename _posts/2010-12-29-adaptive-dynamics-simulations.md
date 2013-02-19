---
comments: true
date: 2010-12-29 16:29:25
layout: post
slug: adaptive-dynamics-simulations
title: adaptive-dynamics Simulations
redirects: [/wordpress/archives/675, /archives/675]
categories:
- ecology
tags:
- adaptive-dynamics
---

Setting up some adaptive dynamics simulations to complete the parameter-space search.  Currently the demo library contains two files, providing the coexistence-only tests and the full evolutionary simulation.  This picks up from Aug 30/Sept 1 on coexistence times and [Aug 12/13 entries ](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/08/12)on waiting times until branching (while still on OWW).


## coexistence times


coexist_times.R creates contour plots of the coexistence time under demographic noise expected at a particular position of the pairwise invasibility plot (PIP).  I also attempt to calculate these using an analytic approximation derived through the Arrhenius law trick to the SDE approximation.

ensemble_coexistence() runs just the coexistence simulation from

coexist_analytics() attempts to create the same graph analytically.

Unfortunately the analytic approximation seems insufficient:

[flickr-gallery mode ="tag" tags="contour_analytics_vs_simulation"]


## Phases of the branching Process


ensemble_sim() runs the full simulation with mutations.  Returns an ad_ensemble object with three elements: $data, $pars, and $reps.  $data is a list element for each replicate.  For each replicate, it records 4 time-points:



	
  1. First time two coexisting branches are established

	
  2. Last (most recent) time two coexisting branches were established

	
  3. Time to finish phase 2: (satisfies invade_pair() test: trimorphic, third type can coexist (positive invasion), is above threshold and two coexisting types already stored in pair

	
  4. Time to Finish line (a threshold separation): traits separated by more than critical threshold


For each of these it returns the trait values of the identified coexisting dimorphism as well (x,y).  This x,y data is plotted for all replicates in four butterfly plots (for each time interval) by plot_butterfly.  Time data is coded in the shading. (just call plot_butterfly on the ad_ensemble object).

In addition to these four (t, x, y) triplets, each replicate reports two counts:

	
  1. Number of times the dimporphism is lost in phase 2

	
  2. Number of times the dimorphism is lost in phase 1


These are histogrammed by plot_failures(object).  Finally, plot_waitingtimes(object) just histograms the distribution of waiting times  across replicates for each of the four phases outlined above.  Figures from today's version of [waiting_times.R](https://github.com/cboettig/AdaptiveDynamics/blob/6af69eec9e7b8087d0ed5b52d8af8cdbfa008d40/demos/waiting_times.R)

[flickr-gallery mode="tag" tags="waiting_times"]


## Illustrating Key Phenomena


The motivation for these two lines of investigation go back to simulations from [May 3-4 entries](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Comparative_Phylogenetics/2010/05/04) which begin to show distinction between different mechanisms of branching.  The hint comes between processes that appear limited by phase 1 an those limited by phase 2.  This can be illustrated by the time required or the number of attempts necessary (failure rate histograms).

Running simulation sets now varying the range of sigma_mu, sigma_c2, and mu to illustrate the sharpness of the transitions between noise-limited and not limited branching dynamics, and how the difference in times and attempts between phases changes with these parameters.  i.e.

![]( http://farm6.staticflickr.com/5202/5304975278_6840299016_o.png )



### Computing Notes:


Setup AdaptiveDynamics repository on zero.  An outdated rsa_id key in /.ssh was causing me not to be able to commit from
