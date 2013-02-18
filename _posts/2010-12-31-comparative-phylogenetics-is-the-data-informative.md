---
comments: true
date: 2010-12-31 21:22:07
layout: post
slug: comparative-phylogenetics-is-the-data-informative
title: 'Comparative evolution: Is the data informative?'
redirects: [/wordpress/archives/721, /archives/721]
categories:
- evolution
---

Working on my SICB talk, going a little further into the example of fitting the lambda model on the Anoles data to illustrate the ways in which we may lack sufficient data for the question.



	
  1. The dataset may not contain adequate signal of the parameter / phenomenon in question

	
  2. The dataset may not be adequately large


Anoles data set (23 taxa):

![]( http://farm6.staticflickr.com/5244/5309932027_a43349ff6a_o.png )


This first image shows the distribution of lambda values estimated from many datasets all simulated under a lambda = 0.6.  (Replotted from earlier entry)

![]( http://farm6.staticflickr.com/5086/5310521188_dc5b23cf56_o.png )


A larger (simulated > 300 taxa) tree has can infer lambda with somewhat greater accuracy, though still rather sizable variance. (reran this simulation from earlier entry code that didn't store the .Rdat file)

![]( http://farm6.staticflickr.com/5045/5310150538_6a1b4fa16c_o.png )


How informative the data are depends on the question.  Using the original 23 taxa tree we find it is plenty big enough to reliably recover the estimate of sigma, even though many of those estimates come from models that have rather mismatched lambda.  This suggests that sigma is nearly a sufficient statistic, while lambda is not.  That it can fit even when lambda is mismatched further suggests that the tree itself isn't informing that estimate much -- simply matching the variance in the data is most important.  This apparent lack of phylogenetic signal, however, says everything about how small the tree is, not how well or not well Brownian motion fits the data.
