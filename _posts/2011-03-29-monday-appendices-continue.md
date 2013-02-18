---
comments: true
date: 2011-03-29 01:09:43
layout: post
slug: monday-appendices-continue
title: Monday, appendices continue...
redirects: [/wordpress/archives/1317, /archives/1317]
categories:
- ecology
tags:
- warning-signals
---

Finished writing up section on correlations (time averages vs ensembles) and the following section on error types.  (yay, that writing went much better than yesterday). Appendices nearly done, a few more bits:



	
  * Must figure out what data examples are going into the supplement.  Most should be reasonably straight-forward to set up, may take a while to run.



	
  * Have to figure out what to say about likelihood-based statistical method beyond definition of Cox's delta,

	
  * whether the methods sections need elaboration beyond the summary paragraph for parametric bootstrap and likelihood test, and

	
  * AIC section.

	
  * Also have to figure out if I need panel for bifurcation types.

	
  * Have to write Model Choice section and what to say about model adequacy.

	
  * And of course, the extent of data examples.

	
  * Alan's comments on appendices.

	
  * Alex's figure comments.




### CaCO3 model fit -- stabilizing data


Adjusted code to specify numerical optimization routine in the calls to update.  Note that this must be given explicitly, will not guess the method last used to update the fit, but instead use the default method (Nelder-Mead) if nothing is specified.

CaCO3 data appeared to fit a stabilizing model under LTC but destablizing under LSN.  LSN fits the data considerably better than LTC.  Should probably include in the additional examples section.

Working getting L-BFGS-B bounded search to work, a bit troublesome in handling out-of-bounds parameter proposals. Achieves approximately same optimum as Nelder-Mead in testing on CaCO3 data.

In socialR, figures should save just what is in their local environment, otherwise still chance for error in parameter values stored.


## Data examples


Should include equivalent of Figures 1, 2 & 3 for each.



	
  1. Simulated destabilizing system with non-significant trends in variance, autocorrelation

	
  2. Other climate data examples -- CaCO3, Deuterium.

	
  3. Non-significant warning signal even under figure 3 (from climate data?)  (Estimate CaCO3 with bounded negative-trend only?)

	
  4. Simulated saddle-node bifurcation from individual dynamics sim, stable and unstable.

	
  5. Simulated other bifurcation types? Hopf bifurcation, oscillating system?

	
  6. Drake single replicates, ensemble (?)


