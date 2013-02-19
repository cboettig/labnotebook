---
comments: true
date: 2011-02-08 13:47:10
layout: post
slug: notes-during-revisions-on-phylogenetics-manuscript
title: Notes during revisions on phylogenetics manuscript
redirects: [/wordpress/archives/952, /archives/952]
categories:
- evolution
---

I have made the revisions to attempt to address Graham's annotations  and Peter's comments.  (revisions are also up on the git  repo.)   I have added a brief section introducing the models immediately after  the introduction.  I also rewrote more of the PMC method to include  definitions of p and power in the context of comparing model likelihood  ratios.  I moved the AIC section up before I talk about the other  comparisons.  How does this whole section work overall where I use a  different comparison of models to discuss a different issue/phenomena  anyway?  Recall I use:



	
  * **OU.3 v OU15**: illustrate AIC problem (though I illustrate this in all  four comparisons). clearly prefers the simpler model (why does that seem  strange that this has good power?  the models are very different)



	
  * **BM v OU.3:** Quantify model choice, p & power.  Prefers complex model.

	
  * **OU.3 v OU.4**: how to compare non-Nested models.  Prefers simpler model (just).

	
  * **BM v OU.1:** too limited by power to tell


Some issues/questions remaining:

	
  1. I'd still appreciate any comments on the organizational structure.

	
  2. I also think we need to give a bit more attention to the figures --  do we have the right number of figures, or is there something we should  add? Curves shaded to indicate the definitions of p and power?   Should they be presented in the 2x2 panels or separately?  How would you  revise the conceptual figure?  Parameter distributions?

	
  3. Last paragraph describing PMC before the Anoles example is a bit of  a grab-bag of details, I don't know what should be included and what  shouldn't, could definitely use more advice.

	
  4. Let me know if there are any parts either of you would prefer to write

	
  5. I'd just like to chat briefly about the statistical interpretations

	
  6. Do we have adequate references?




### Stats: Refining language





	
  * estimator vs statistic?

	
  * Define: choosing the wrong model. One selects models based on AIC.  Information-criteria based model choice doesn't "fail to reject the null model" because it doesn't consider a model as a null.

	
  * MLE is biased estimator of _expected_ likelihood.  MLE likelihood is always higher.  AIC is motivated as unbiased estimator of expected likelihood (i.e. if estimated likelihood from replicate simulations of process, vs estimating from a single realization, the single realization likelihood estimate will be higher).

	
  * More on comparison to Bayesian approach in Discussion?  Mention earlier?

	
  * Model choice of fixed parameters; when frequentist interpretation doesn't make as much sense: see "[Two Questions](http://www.carlboettiger.info/archives/386)" entry.




### Meeting with Graham


Discussing further with Graham this afternoon.  Good brief meeting, covered most of above.  Next steps:

Revise lambda discussion as to significance of the particular example, discussion of danger in interpreting parameter values estimated with inadequate data.

Have Brian look over manuscript.

Tighten up language, explanations, figures, etc.


## Peter's question on variation in parameter estimates


Discussed estimating standard error of heterogeneous Brownian motion models (Brownie-style) with Peter by repeating MLE estimates over stochastic character mappings and over an ensemble of trees.  What aspects can contribute most to remarkably high variation in estimates?
