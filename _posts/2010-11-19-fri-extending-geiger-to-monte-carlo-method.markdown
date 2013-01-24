---
comments: true
date: 2010-11-19 19:51:34
layout: post
slug: fri-extending-geiger-to-monte-carlo-method
title: 'Fri: extending Geiger to Monte Carlo method'
redirects: [/wordpress/archives/356, /archives/356]
categories:
- evolution
---

Completing my extension of geiger into object oriented design whereby I can easily apply the Monte Carlo approach to test fits using function calls to model fits such as update() and simulate().  A quick convenient example: AIC would prefer (though not by munch) the delta transform model over the Brownian motion model; a conclusion not supported by the Monte Carlo test, which suggests there is not enough power to choose between these models:

![]( http://farm5.staticflickr.com/4132/5190435896_03fa7c4229_o.png )



The density kernel estimation does make it appear that some values are smaller than zero though.  Recall all estimates are from the replicates directly, so this doesn't introduce any errors in the numbers reported, only the visualization; still it is annoying.  Also note this is just with 100 replicates, not 2000, since I wanted a quick example and geiger is much slower than ouch.  

Will see if I can generate enough interesting examples out of the Anoles data or if it would be good to include some simulated data (and maybe some simulated trees with different structures).  Simulating under OU, fitting lambda and bm models.  Alpha = 1 and Alpha = 2

![]( http://farm2.staticflickr.com/1030/5190485606_3d3aa1e779_o.png )


![]( http://farm5.staticflickr.com/4149/5190522064_ee22fa88fe_o.png )


([code](https://github.com/cboettig/Comparative-Phylogenetics/tree/1222147f8abe83a54c698bb2178d3fc6e35ca744))

Ah, the strange likelihood ratios under the test simulation are possibly the result of a bug in the simulation script, need to rescale tree to estimate the phylogenetic mean.  Confirmed this works with ape's rTraitCont simulation which can simulate BM (and transformed tree versions of course) and OU) [See code changes](https://github.com/cboettig/Comparative-Phylogenetics/commit/cb1161cd2c091aa0e037434ec03df14fc91e3360#diff-1).  Still, surprisingly wide distribution of likelihoods under simulations of the lambda model.  

Consider the Geiger geospiza data for example, which shows the same wide uncertainty in simulating (n=2000 now) under the test model:

![]( http://farm6.staticflickr.com/5281/5191048330_4dcb0f36c5_o.png )

[(code)](https://github.com/cboettig/Comparative-Phylogenetics/commit/cb1161cd2c091aa0e037434ec03df14fc91e3360#diff-2)



Beginning to wonder if it's worth bothering to explain how this works in the context of type I and type II error, vs just measuring the divergence between the two distributions.  The important thing is realizing that its the likelihood ratio that it's key to look at, and to look at under both distributions.  a rather subtle thing.  

Also looks like it may be worth porting tree transforms into OUCH just for the purposes of doing this analysis at higher speed for the fits.  Should profile the code first though to make sure.  


