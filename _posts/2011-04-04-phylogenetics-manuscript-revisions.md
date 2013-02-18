---
comments: true
date: 2011-04-04 22:48:21
layout: post
slug: phylogenetics-manuscript-revisions
title: evolution manuscript revisions
redirects: [/wordpress/archives/1354, /archives/1354]
categories:
- evolution
---

Heard back from Graham Friday on manuscript revisions.  Notes on reviewing edits:



	
  * Reconsider title?  (Currently: "is your phylogeny informative? estimating power in phylogenetic trees").  Suggestions from Graham/Brian?

	
  * 1000 taxa, 500 taxa seem to break the ouch package inferences.

	
  * Add table for AIC comparisons etc

	
  * Does AIC work better/worse on the lambda = 0 trees?



    
    
    n[1:3]
    [1]  10  50 100
    aic_errors_size <- sapply(1:(length(n)-2), function(i) sum(size[[i]]$null_dist > aic)/size[[i]]$nboot )
    aic_errors_size
    [1] 0.1505 0.1285 0.0845
    lambda
    [1] 0.01 0.10 0.40 0.70 1.00
    aic_errors_shape <- sapply(1:length(n), function(i) sum(shape[[i]]$null_dist > aic)/shape[[i]]$nboot )
     aic_errors_shape
    [1] 0.0000 0.2580 0.0305 0.0415 0.0685





	
  * Improves as tree size increases, impact of lambda somewhat unclear -- AIC seems to perform better on heavily transformed trees, except for lambda = 0.1 seems anomalous?  Worth a closer look

	
  * Rerrunning with a few other examples, now on zero nice 1:



    
    alpha <- c(seq(.1, 1, length=10), 2:10, seq(20,50, by=10))



    
    n <- c(10, 20, 40, 60, 80, 100, 150, 200)



    
    lambda <- c(.01, .05, .1, .2, .4, .6, .8, 1)





	
  * Recall this results only from the null distribution tightening up, as it is Type I error (area of null right of the AIC threshold, independent of test distribution).



	
  * edit/rewrite introductory paragraphs (less passive voice).  Intro is set up as addressing two key issues, framed as: model problems/model selection/model adequacy, etc, vs data problems.  Perhaps better to phrase more classically in terms of Type I /Type II error explicitly?  emphasize power effectively.

	
  * Rest of edits have been relatively straight forward changes.





