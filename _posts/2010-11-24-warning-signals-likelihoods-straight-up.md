---
comments: true
date: 2010-11-24 21:44:57
layout: post
slug: warning-signals-likelihoods-straight-up
title: 'Warning signals: Likelihoods Straight-up'
redirects: [/wordpress/archives/416, /archives/416]
categories:
- ecology
tags:
- derivation
- warning-signals
---

Meeting with Alan this morning.  I haven't solved likelihood of power spectra (previous couple entries in Stoch. Pop / warning signals), though after meeting with Sebastian (11/9) probably the best method works from the correlation function.  Define a new stochastic process Y
$$ Y_1 = X_1 X_2 + X_2 X_3 + X_3 X_4 + \ldots $$
$$ Y_2 = X_1 X_3 + X_2 X_4 + \ldots $$
$$ Y_3 = \ldots $$

Argue that $ Y$ is stationary when $ X $ is stationary.  Then apply a central-limit theorem to error estimate in Y given error estimate in X, noting higher Y have much greater error due to be computed from fewer points (uncertainty near the peak of the Lorentzian (low frequency, long wavelength) or tail of the correlation function. A lot of work for a rainy day.


## Back to the Previous tack


Meanwhile, focus on estimating the likelihood of the set of models directly.  Rather than rely on the OU model with linear moving mean, etc, will write down the probability for the quadratic model.

Canonical form of the [saddle-node bifurcation](http://en.wikipedia.org/wiki/Saddle-node_bifurcation):

$$ \frac{dx}{dt} = x^2+r $$

Modifying this slightly for our purposes: I've introduced an extra parameter to allow for the bifurcation to  occur at $ x = \theta $ instead of at zero, and swapped the sign  so that the stable point is to the right of the unstable:

$$ \frac{dx}{dt} = -(x-\theta)^2+r $$

Such that bifurcation occurs when $ r$ becomes negative.  Phrasing this as the appropriate SDE for demographic noise:

$$dX = \left( r - (x-\theta)^2\right)dt + \beta \sqrt{X} dB_t $$

Which is a nonlinear model without an analytic solution with which we can calculate the probability density to evaluate the likelihood of the timeseries.  However, we can back up a few steps and go back through the linear noise approximation to the birth death model, where we have
$$ \frac{d \hat{x}}{dt} = r - (\hat{x}-\theta)^2 $$
$$  \frac{d \sigma^2}{dt} = -2 (\hat x - \theta )\sigma^2 + \beta  $$

From which we need to construct the conditional probability of observing the system at state $ x_t$ given in started at state $ x_0$ at time t.
$$ P(x_t | x_0) = N(\mu(x_t | x_0), \sigma(x_t | x_0)  $$

For the OU process,
$$ \mu(x_0) = (x_0 - \theta) e^{-\alpha t} + \theta $$
\[ \sigma(x_t, x_0) = \frac{\sigma^2}{2 \alpha } \left( 1-e^{-\alpha t} \right)
$$

Meanwhile the above ODEs for our quadratic model don't have good closed form solutions, but the ODE system can simply  be solved numerically.

(using a simplified notation to query wxmaxima)
$$ -\frac{log\left( -\frac{-x\left( t\right) +\sqrt{r}+a}{x\left( t\right) +\sqrt{r}-a}\right) }{2\,\sqrt{r}}=t+c $$
$$ \sigma^2\left( t\right) =e^{2\int x\left( t\right) dt-2at}\left( b\int e^{2 a t - 2\int x \left( t \right) dt} dt+c\right)  $$

Comment on bifurcation classes.  [Transcritical bifurcations](http://en.wikipedia.org/wiki/Transcritical_bifurcation), which involve an exchange of stability: still driven by the $ r$ parameter changing sign:
$$
\frac{dx}{dt} = x^2 + rx
$$
for which the logistic equation is a good example:

$$
\frac{dx}{dt} = r x \left(1-\frac{x}{K}\right)
$$

Perhaps this provides a nice simpler example worth focusing on, can probably give complete analytic treatment.  The explicit demographic model requires a parameterization of this in terms of birth and death rates.  The Levins model provides one reasonable interpretation (actually has a few biological interpretations, including the dispersal model it was introduced as, and as the SIR model of epidemiology):

$$
\frac{dx}{dt} = c x \left(1-\frac{x}{K}\right) - e x
$$

where the bifurcation occurs at $ c < e$ rather than $r < 0$.
