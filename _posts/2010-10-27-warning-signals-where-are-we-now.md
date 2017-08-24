---
comments: true
date: 2010-10-27 16:00:48
layout: post
slug: warning-signals-where-are-we-now
title: Warning Signals -- Where are we now?
redirects: [/wordpress/archives/129, /archives/129]
categories:
- ecology
tags:
- warning-signals
---

The last few days have involved an investigation into the ability to capture the essential features of the dynamics leading up to a saddle node bifurcation as a linear stochastic differential equation.  The warning signals question then becomes a model-choice problem between constant and time-dependent coefficients:

$$ dX_t = \alpha \left(\theta_t - X_t\right) dt + \sigma_t dW_t $$

and 

$$ dX_t = \alpha_t (\theta_t - X_t) dt + \sigma_t dW_t $$

Where changing stability is characterized by critical slowing down seen in decreasing $ \alpha $.  Unfortunately, a general parameterization for the other parameters which will change in both models is challenging, (see the end of yesterday's notes) and without a good fit to these it may be difficult to attribute the model choice to sensitivity in $ \alpha $.  Without the ability to frame reliable models to capture the process, we must be careful to compare them.  Different mechanisms driving the bifurcation can create substantially different pictures that may not be well caught by the same parameterization of the above model.  



###  So where next? 


Ultimately, it is still necessary to quantify the probability of detection of a warning signal in the simplest, best-case scenario of the data observed from a system known to exhibit a saddle-node bifurcation.  That is, we still want to compare a model involving the change with one not involving the change, and quantify the information necessary (sensitivity to rate of change, amount of data, etc -- all issues of power) to distinguish between them.  Instead of building this around the SDE above, we can build this around a transformation of the data that does not exhibit this sensitivity to the model details.  Solving for the time-dependent spectral density seems a promising way to go, avoiding many of the issues highlighted in yesterday's notes.  




