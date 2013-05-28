---
comments: true
date: 2010-10-26 16:46:24
layout: post
slug: correcting-for-the-mean-dynamics
title: Correcting for the mean dynamics
redirects: [/wordpress/archives/108, /archives/108]
categories:
- ecology
tags:
- warning-signals
---

Yesterday I began to address concerns of different models that have different mean dynamics, and how this influences the warning signals.  This poses several kinds of issues.



	
  * First, if the mean is changing, the model fitting must be appropriate to this -- either by fitting this rate of change or correcting for it.

	
  * Second, the variance is expected to scale with the mean, and scale differently under different noise models (particularly environmental vs. demographic).  Hence information about the mean cannot simply be discarded (i.e. by subtracting out a regression fit).

	
  * Third, certain dynamics need not give much warning, even though they consist of saddle-node bifurcations.  By changing the curvature of the rate model we can examples with more and less advanced warning.  In some cases the change can happen fast enough that noise forces the system over the edge without warning.


With changing mean:

<embed src="http://www.carlboettiger.info/assets/files/bifur.swf" width=300 height=300>

With "constant" mean:

<embed src="http://www.carlboettiger.info/assets/files/bifur_mean_const.swf" width=300 height=300>

Note that the mean changes quite suddenly at the end, though the loss of stability is more pronounced much earlier on.  (Images are is now sfw-flash objects instead of gif loops so can be  paused, etc by right click.  Hosted locally in this site's media library  as flickr stream doesn't support flash.)

[Code archive for these figures;](http://github.com/cboettig/structured-populations/blob/39a295ae0e3bde82af6800f8cf87f61f74726979/demos/saddle_analytics.R) uses the animation package and SWF tools to create the flash images.  Multiple root finding (a problem in the numerical examples earlier which used nlm) supported now by rootSolve package.


### So what does this mean?


Ignoring mean rate of change will be misleading, but a linear approximation to the rate of change doesn't capture the second model well right near the switch point.  Over most of the parameter range this can be ignored, with the rate estimated as essentially flat for this model.  It is the corrections to the variance due to changes in the expected value that are more challenging.  It is in this example that estimating the return rate, critical slowing down, will be more promising.  The explicit analytics might help us further here:

Starting from the expansion of the master equation and taking the linear noise approximation, we can express the dynamics in Ito form:

$$ dX_t = \left[ b(X_t)-d(X_t) \right] dt + \sqrt{\frac{b(X_t) + d(X_t)}{N}}dW_t $$

Around the equilibrium $\hat x$ we have variance

$$ \frac{b(\hat x) + d(\hat x)}{2 N  \left[\ partial_x b(x) - d(x)\right]_{x = \hat x}} $$

Defining:
$$ \alpha(\hat x) =  \partial_x  \left[b(x) - d(x)\right]_{x = \hat x} $$

$$ \sigma^2(\hat x) = \frac{b(\hat x) + d(\hat x)}{N} $$

and can write the correlation function:
$$ \langle\langle X_0 X_t \rangle \rangle = \sigma^2(\hat x) e^{-\alpha(\hat x) t} $$

It is precisely this $\alpha(\hat x)$ that we wish to estimate.  Now it changes due to changes in $\hat x$ as well as changes in the bifurcation parameter, $a$, which of course also influences $\hat x$ directly.  So we want to rewrite this as a function of the bifurcation parameter alone:

$$ \partial_x  \left[b(x,a) - d(x,a)\right]_{x = \hat x(a)} =: f(a) $$

A little tired of LaTeX writing, I  approximate $\alpha(a)|_{\hat x}$,  the slope at equilibrium as a function of the bifurcation parameter. Going astray: [calculation here](http://www.flickr.com/photos/cboettig/5118738314), [results graphed here](http://farm2.static.flickr.com/1419/5118172479_aaf1a2d5a1_m.jpg), upshot is assuming saturation doesn't capture the bifurcation.  Applying that approximation earlier to the derivative expression gives a slope of $-e$, no $a$ dependence at saturation anyway.


#### Numerical Solution


Foregoing a complete analytic treatment, we can solve for function numerically to get the picture.  For the first model with the steady changing mean, we see the mean, the eigenvalue $\alpha$, demographic noise term $\sigma^2$, and total variance:
![]( http://farm2.staticflickr.com/1178/5119205688_e05388859a_o.png )


And for the second model (note smaller values of a now lead to the bifurcation):
![]( http://farm2.staticflickr.com/1220/5118603695_df7a11b494_o.png )


([see code for these graphs](http://github.com/cboettig/structured-populations/blob/a3ba76f81e72e972e2c5fa6e0cf87da5e15de80c/demos/saddle_analytics.R), also has the updated code for flash animated bifurcations).  Hard to justify good fits to a model form of
$$ dX_t = \alpha(a, X_t) (\theta(a, X_t) - X_t)dt + \sigma(a, X_t) dW_t $$

where the parameters are linear functions in time or in a (changing linearly with time).  So, what's the power spectrum of the time-dependent function

$$\langle\langle X_0 X_t \rangle \rangle = \sigma^2(\hat x) e^{-\alpha(\hat x, t) t} $$

where $\alpha(\hat x, t)$ is a function of $a$ as given by the graphs above and $a$ changes linearly at some rate?  Is it to this that we must compare fits under models of changing and non-changing $a$?


