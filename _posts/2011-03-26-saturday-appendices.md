---
comments: true
date: 2011-03-26 23:28:00
layout: post
title: Saturday-- Appendices
categories:
- ecology 
tags:
- warning-signals
- delayed-release
---

## Appendices


Working on Appendices


#### Ergodicity


Null of Kendall's tau/rank correlations -- independence of X and Y, not satisfied even over replicates.  Adjusted codes to use Pearson's (default option, need to pass option up to higher-level functions).  Repeated Figure 2 plots with Pearson's, results not much different, funny multimodal though:

![]( http://farm6.staticflickr.com/5133/5562412943_79f3dd3ecf_o.png )


Actually verifying independence is rather more challenging, though convenient in this case that a test such as Pearson's is not designed to do this, see http://en.wikipedia.org/wiki/Brownian_covariance


#### Calculating Error

Still to write.  Figures with shading, management angle.  References to management of risk?


#### Models


Wrote section, still could use panel figure on models.

For each model: Graph of birth rate and death rate, with several overlays showing parameter change.  Graph of net growth rate.  Graph of linearized system.  bifurcation plot.  energy landscape.
[Earlier entries](http://www.carlboettiger.info/archives/1185) for starting point on this.


#### Likelihood Calculations


Wrote section.


#### Model Choice


Model choice between LTC and LSN for examples.
![]( http://farm6.staticflickr.com/5060/5551674282_e8335023b8_o.png )
![]( http://farm6.staticflickr.com/5051/5552850530_0aea953363_o.png )


* Comments on model adequacy.

#### Examples

Still assembling.

* Should probably focus on empirical examples.
* Could do simulated data not from LTC/LSN dynamics.
* Should include LTC dynamics on some models.
* Include Drake data?
* Include CaCO3 data?
* Kendall's tau estimates for Deut I, II, III. (III already done, just for comparison.  IV throws error exceptions).
* Other deuterium runs show much the same story, very little power in the correlation statistics and even clearer detection of models:


![]( http://farm6.staticflickr.com/5181/5562383846_a341504682_o.png )

![]( http://farm6.staticflickr.com/5182/5562961240_9d44037b15_o.png )


A bit surprising given model parameters show very slow rate of change (though over a long interval), and given how poorly even the variance indicator does.


## Misc


Moved into LaTeX as well to get sense of length, though will be difficult to edit two copies.  Writing appendix in LaTeX for simplicity.

Stats stack-exchange: http://stats.stackexchange.com/



