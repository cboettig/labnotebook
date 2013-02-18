---
comments: true
date: 2010-11-10 19:17:00
layout: post
slug: tuesday-sdes-then-back-to-phylogenetics
title: Tuesday - SDEs then back to phylogenetics
redirects: [/wordpress/archives/272, /archives/272]
categories:
- evolution
---

Nice meeting with Sebastian this morning, reviewed my spectral approach problem (see anything in Stochastic Population Dynamics / warning signals in the past week) and the multivariate [SDE problem Peter posed ](http://www.carlboettiger.info/archives/151)Oct 30th. No solutions yet but some ideas to get started.

With regards the SDE problem, note that it reduces to:

$$ dX_1 = B_2 d B_1 $$

and note also that if this were $$ dX_1 = B_1 d B_1 $$  this would be a classic exercise in intro SDEs we can look up in Oksendal,

$$ \int_0^t B_s dB_s = \frac{1}{2}B_t^2 - \frac{1}{2}t $$

Which can be shown either from the definition or from the Ito formula applied to the map $ g(x) = \frac{1}{2}x^2 $, see beginning of Ch. 4 in my Oksendal.  Will have to try this out on my problem later.

A couple notes on the spectral analysis.  First should be some interesting-to-a-mathematician claims about convergence of these integrals on $ \mathcal{R} $, and some central-limit like result on finite time domain. Second, make sure I simulate sample paths vs simulating just the distribution accurately.  Third, take an approach from the correlation function, clear that variance is largest at the low frequencies where there's less data, and this at least can be treated analytically by considering the new stochastic process $ X_t X_s $ and arguing for stationarity and solving the correlation function.  Anyway, exercises to return to after I get more writing done.


### Phylogenetics Figures, Power examples


Working on revising this stuff today.


### Rabosky Seminar


(Live notes) Rabosky evolutionary radiation define as any descendant process.  Spectrum: species diversity, phenotypic diversity.  Why radiations differ.  Focus on species richness.

Part I: anoles differences
Species richness vs island area (losos&  schluter, nature 2000).  Note radiations occurred within islands.  Is clade age or rate diff responsible?  (Assumes diversity is still increasing! )  or 3: ecological limits to richness (equib model!)   Looks like a linear decrease in rate through time.

First step - ancestral assignment of island.  Also see maddison evolution 2006 bsse model.  Rates of transition linked to state.  4 b rates, 4 d rates, 12 island transition rates. Times 2 for diff on big isl vs small isl.

Fitted model prediction of richness.  Exp growth predict much smaller.

@me thats obv ahead of time.  Uncertainty is greater w higher rate, so underestimates it.  Would happen even if you simulate from the exp models.

@me: we need different speciation rate models.

Part II:  tree of life
Stim Age v diversity. Often no trend I.e. ferns, angiosperms, act. Fishes, mammals, squamates ... wow!   Only holds for beetles.  Resolution only to families Peter points out.  @me battery dying.

@me Added after seminar:

Continues to compare the three models (const rate, variable rate, niche filling) in manner as before and favors niche filling.

Stimulating discussion with Dan afterwards on statistical inferences based on posterior comparison of model prediction to parameters.  I believe this looks very convincing but can be deeply misleading.  Will try and write up some example of this tomorrow/soon.


### Misc


Switched photofeed to operate based on tags instead of sets (since these can be set by flickr_upload command line).

Scheduling Mendeley visit for next week
