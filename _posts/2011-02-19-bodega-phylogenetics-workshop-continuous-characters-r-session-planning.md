---
comments: true
date: 2011-02-19 03:45:09
layout: post
slug: bodega-phylogenetics-workshop-continuous-characters-r-session-planning
title: 'Bodega evolution Workshop: Continuous Characters R session planning'
redirects: [/wordpress/archives/1080, /archives/1080]
categories:
- evolution
- teaching
---

Preparing for the Bodega Phylogenetics workshop.  I'll be covering the R tutorial following[ Justen Whittall's](http://www.jbwhittall.com/) introduction to continuous characters:


> In my intro lecture i will discuss Felsenstein 1985 (including a  little phylo signal), then follow with some alternatives (including the  OU model). I can also discuss the tree transformations ala Pagel's  kappa, delta, etc. and mention multivariate approaches to detecting  correlated characters in a phylogenetic context.


I'm toying with the idea of a brief (~1hr) phylogenetic signal / model inference exercise:



	
  1. Students simulate a dataset under assigned model (a few different ones varying in tree size, phylogenetic signal, etc)

	
  2. Students than exchange datasets with neighbors, without disclosing  models and parameters, and attempt to guess which model, parameter  values, etc the other has used.

	
  3. I might pool the group data that evening and summarize in a slide or two next morning?


Goals:

	
  * Practice simulating models as a way to understand them,

	
  * Illustrate potential and the limitations of these inferences

	
  * Illustrate the importance of having sufficient data, not just the model

	
  * give this kind of analysis a more empirical rather than black-box feel


Begun development of tutorial in R package, [see code](https://github.com/cboettig/Comparative-Phylogenetics/tree/master/bodega).
