---
comments: true
date: 2011-03-14 11:18:59
layout: post
slug: warning-signals-monday
title: Warning Signals, Monday
redirects: [/wordpress/archives/1185, /archives/1185]
categories:
- ecology
tags:
- warning-signals
---

Set up a few long runs of simulated data to better illustrate the effects of sampling time and density, and better resolve the distributions.



	
  * Longer baseline run, nice 19, indicator_vs_likelihood.R 1600 reps, m=-0.015, N=500, T=100

	
  * Longer sampling, same interval: nice 18, stronger_signal.R 160 reps m=-0.015, N = 2500, T=500

Fails to compute, looks like poor estimates of model fits.
	
  * Denser sampling, nice 17: indicator_vs_likelihood.R 160 reps, m=-0.015, N=2500, T=100

	
  * Longer less dense sampling, nice 16: indicator_vs_likelihood.R 160 reps, m=-0.015, N=500, T=500.  Fails to compute, looks like poor estimates of model fits.

	
  * Less dense sampling, nice 16: indicator_vs_likelihood.R 160 reps, m=-0.015, N=50, T=100.


Results pulled in below:

[flickr-gallery mode="search" tags="warningsignals" min_upload_date="2011-03-14 00:00:00" max_upload_date="2011-03-15 23:59:59"]


## Bifurcations




### Transcritical bifurcation





	
  * **Canonical form:**


$$ \frac{dx}{dt} = -r_t x^2 $$

driven by changing sign on $ r_t $

	
  * **Example biological model **(with stochasticity):


$$ dX_t = r_t X_t (1-X_t/K)dt + \sigma dB_t $$

	
  * **Linearized form:**


$$ dX_t = r_t  (K-X_t)dt + \sigma dB_t $$


### Saddle-node






	
  * **Canonical form**:


$$ \frac{dx}{dt} = r - x^2 $$

Driven by changing sign on $ r_t $

	
  * ** Example biological model:**


$$ dX_t = \left( \frac{e K x^2}{X^2 + h_t^2} - e X_t - a_t\right) dt +   \sigma \sqrt{ \frac{e K x^2}{X^2 + h_t^2} + e X_t + a_t} dB_t $$

Either $ a_t$ or $ e$ decreasing through zero can force this through a saddle-node bifurcation, [see this entry](http://www.carlboettiger.info/archives/108).  Either of these can be approximated as a quadratic in the neighborhood of the stable point, which gives the bifurcation the canonical form,

$$ dX = r_t - (\theta - X_t)^2 dt + \sqrt{\sigma (r_t+ (\theta-X_t)^2) }dB_t $$



	
  * **Linearized**:


$$ \phi_t = \sqrt{r_t} + \theta $$
$$ dX = 2 \sqrt{ r_t } \left(\phi_t - X_t\right)  + \sigma \sqrt{ \phi_t } dB_t $$


#### Previous entries:





	
  * [On estimating quadratic models](http://www.carlboettiger.info/archives/461)

	
  * [Challenges in quadratic models](http://www.carlboettiger.info/archives/452)

	
  * [Visualizing Saddle-node types](http://www.carlboettiger.info/archives/108) -- should add bifurcation diagram, and transcritical bifurcations to this set

	
  * [Linearized models](http://www.carlboettiger.info/archives/468)




## Writing/figures





	
  * Need a panel and figure explaining the models

	
  * Need a panel and figure explaining the algorithm


Parametric bootstrap monte carlo


## Notebook notes


Pasting in from word (or the visual editor?) turns LaTeX minus signs into longer dashes, causing the latex interpreter to fail.  Rather annoying syntax error to find.
