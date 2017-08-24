---
comments: true
date: 2010-12-06 21:24:00
layout: post
slug: follow-up-from-fri-discussions-revisiting-post-predictive-evaluation
title: 'follow up from Fri discussions: Revisiting post-predictive evaluation'
redirects: [/wordpress/archives/523, /archives/523]
categories:
- evolution
---

A few weeks ago, a seminar prompted me to take a closer look at a particular post-predictive evaluation technique applied reasonably often in our recent literature,[ see earlier entry](http://www.carlboettiger.info/archives/299).  I think by phrasing the approach more concisely and precisely it will be clear what the difficulty is.

As usual, we consider some data $ \vec X$ and a set of $ N$ models specified by parameters, $ \lbrace \vec \theta_1, \vec \theta_2, \vec \ldots \theta_N\rbrace $, then we can express the likelihood of the model as the probability of the data under the given model and parameter values:

$$ L(\vec \theta_i) = P(\vec X|\vec \theta_i) $$

From this object we could take a Bayesian approach, but we will simply maximize the likelihood through appropriate choice of $ \vec theta_i$ for each model $ i $.  Now we might compare these models by an information criterion applied to the likelihood estimates, or more completely by the Monte Carlo approach I've been working on in these pages.  Instead of these standard approaches though, we look in this entry at this post-predictive evaluation idea.

Post-predictive evaluation does the following.  Imagine we can compute some statistic on the data[ref] I drop the explicit vector notation for simplicity[/ref], $$ \mu = f(X)$$.  We may imagine this statistic as a scalar (such as the mean), though this is not strictly necessary.  Having fit our models to maximize $$ P(X|\theta) $$, we could compare the probabilities of observing this statistic under the model, $$ P(f(X) | \theta) $$.

Now it is patently obvious that maximizing $ P(X|\theta) $ will generally be different than maximizing $ P(f(X) | \theta)$, so that the most likely model need not be the best performing under the statistic.  Does that give us any reason to suspect that having fit the models by maximum likelihood, the one with the maximum probability of recovering this statistic is the best? [ref] Maximizing goes for the mode of  $ P(f(X)|\theta)$, we might also compare the observed $ f(X)$ to the expected value, $ E(P(f(X)|\theta) ) $ (mean instead of mode).  [/ref]

Certainly not.  There is no reason why recovering this particular statistic should be considered more important than recovering the entire data, nor any reason to believe that performance in one is a good proxy for performance in the other.  Trivial counter-examples of models who recover the statistic well but do not match the data are easy.  As are overfit models that do well on both.  [ref] Note that in a likelihood approach, overfitting doesn't have the same notion as as it does in least-squares or other regression fitting, since it must explicitly specify the probability.  That means that the expectation need not do well even when the model is very overfit.  [/ref]

Despite this, it is a very interesting question to turn on its head.  I was somewhat disappointed a few weeks ago when in doing the calculation for a simple example I realized that maximizing $ P(f(x) | \theta)$ gave almost the same parameter estimates for $ P(X | \theta)$.  It was only in sitting in Monte Carlo discussion Friday with Bruce Rannala, Brian Moore and a few students that I realized the significance of this calculation.  Where $ f(x) =N$ number of species represented, a large disparity between these would indicate that the phylogeny was quite informative.  For the quantities to be very similar indicates that the information comes almost entirely simply from the number of data points.  This is quite worrying in a paradigm where we spend great effort making sure the phylogeny is estimated accurately and less effort making sure it is sampled completely.


## Where to?


I think it worth developing both of these lines of thought a little further:



	
  * The "Rabosky question:"  $ P(f(X) | \theta) \neq P(X | \theta)$

	
  * The "Rannala question:" $ P(f(X) | \theta) \approx P(X | \theta)$


In the second case, $ f(X) $ is almost a (set of) sufficient statistic(s) for X, in which case it would not matter what we use, but we should treat them the same way (i.e. penalizing model complexity appropriately, in either information criteria, Monte Carlo, Bayesian approach).  To do Bayesian inference on the set of statistics $ f(X) $ is the basis of Approximate Bayesian Computing, ABC.  In the first case, $ f(X)$ is nowhere near a sufficient statistic, and we should not prefer models matching this statistic as a guarantee that those models have higher likelihood.

Will try and return to these ideas once I've wrapped up the manuscript and presentation on "are phylogenies informative" and "are warning signals informative?"
