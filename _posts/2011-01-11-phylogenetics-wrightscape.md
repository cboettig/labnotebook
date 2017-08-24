---
comments: true
date: 2011-01-11 15:38:41
layout: post
slug: phylogenetics-wrightscape
title: evolution- wrightscape
redirects: [/wordpress/archives/775, /archives/775]
categories:
- evolution
---

Interesting meeting with Peter to discuss a variety of issues in comparative phylogenetics.  Short notes:



	
  * Transforming data, log data

	
  * Trends in directions in convergent traits

	
  * multivariate inference

	
  * Manuscript




### Wrightscape


First have to test PMC to make sure it works with OUCH classes.  Also adding PMC-required wrappers for wrightscape.  Ended up modifying PMC to handle the case of simulate functions that return replicates, like these packages do.  Both are working now.

Shows clear differences between models under the release-of-constraint vs simply different optima hypothesis.  Increasing max-iterations of simplex (from 1000 to 10000) to help with poorly convergent cases now. (Recall that object files must be removed to recompile the src code)

![]( http://farm6.staticflickr.com/5122/5347054109_475e57bd2a_o.png )

