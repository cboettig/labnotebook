---
comments: true
date: 2010-11-29 19:01:29
layout: post
slug: further-treatment-of-the-limiting-models
title: Further treatment of the limiting models
redirects: [/wordpress/archives/468, /archives/468]
categories:
- ecology
tags:
- derivation
- warning-signals
---

Have spent the last three days building and testing the infrastructure to fit the canonical form of a saddle-node (fold) bifurcation by likelihood.  Actually I don't use the canonical form straight up: $ dx/dt = x^2 +r$ cannot be fit directly in this manner, since it needs a couple scale transformations on the variables to get the units right (a multiple for the unit scale and an additive factor for the zero point), and more importantly, isn't a stochastic model so cannot assign probabilities to the outcomes.  Allowing for these, the model becomes:


$$ dX = r - (X-\theta)^2 dt + \sqrt{ \beta (r + (X-\theta)^2)}dB_t $$

Where several other possible formulations of the noise could be possible, and yes, it makes a significant difference.  Other than the noise formulation, or even including it, the data really only contains information about this curve around the equilibrium point, so there is little reason why this fit could do better (and good reason why numerically it will be not just slower but harder/less accurate) than the linear fits we began with (the OU models):

$$ dX = \alpha (\theta -X) dt + \sigma dB_t $$

We can fit this model and then estimate the corresponding quadratic by setting this equal to its linearization (equations in yesterday's entry.)  The only real reason to use the quadratic is once we allow r to vary.  Then this model captures the change in $ \hat x$ as r changes, since $ \hat x = \sqrt{r} + \theta $, [see the earlier discussion on this](http://www.carlboettiger.info/archives/108).  We could simply fit a linear model in which the fixed point moves in this manner:

$$ dX = 2\sqrt{r} (\sqrt{r} + \theta -X) dt + \sigma dB_t $$

Where we've used the fact that the derivative at the equilibrium is $ \alpha $ in the OU model or $ 2\sqrt{r}$ in the saddle-node (SN) model, where it is assumed that $ r $ is changing linearly. We might also modify the noise term in the linear model to reflect the changing noise level due to this changing equilibrium, $ \sigma \sqrt{\sqrt{r}+\theta}$.   We then still have a a three-parameter linear model, but explicitly in terms of the bifurcation parameter r (in which we isolate the time dependence):

$$ dX = 2\sqrt{r(t)} (\sqrt{r(t)} + \theta -X) dt + \sigma \sqrt{\sqrt{r(t)}+\theta} dB_t $$

Now with a parameterization of $ r(t)$ we can at least numerically solve for the probability distribution.  We are still rather limited if we want to say that r is changing without parameterizing this change.


### Analytic treatment for transcritical Bifurcation


The transcritical bifurcation captures most of the properties of interest of the saddle-node bifurcation with a potentially simpler model set.  Simpler mostly because that the critical points don't move, the only exchange stability.  Similar in the sense that it also shows critical slowing down (eigenvalue of the stable point going through zero from negative to positive), and it ends poorly for the species it describes.  Taking the simple logistic model

$$ dx/dt = r x (1-x/K) $$

and taking the linear term as the birth rate and the quadratic term as the death rate (a simple convenience), we have a demographic noise model.  As before, we probably only have information around the critical point, and cannot do better than to fit the linearization around the equilibrium rather than the full non-linear equation (another quadratic, which we could do with the numerical integration for the moments just as we did for the saddle-node).

$$ dX = r(t) (K - X) dt + \sqrt{K} dB_t $$

Which just another form of the an OU model with time dependent coefficients as we had before.  Perhaps a simpler test case to check the ability to detect a non-stationary coefficient.


### So what have we learned?


We can do estimation for these higher-order models without closed form solutions, but it doesn't often pay.  The warning signal approach is based around the linearization, which is almost but not quite the same for these different bifurcations.  We've derived those linearizations for comparison.  It remains to attempt fitting to these simpler models, something we already have implemented from earlier, before we had the particular parameterizations for these rates of change (and thus were allowing them to be estimated independently).
