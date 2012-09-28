---
comments: true
date: 2011-02-03 18:30:15
layout: post
slug: progress-on-warning-signals
title: Progress on warning signals
redirects: [/wordpress/archives/936, /archives/936]
categories:
- ecology
tags:
- warning-signals
---

Going several directions at once in tweaking the warning signals code to make sure I have clear comparisons that are not resulting from any limitations in the numerical algorithms.  Performing a variety of error checks, etc:



	
  * Comparing fixed models vs comparing models estimated from the data

	
  * Ensure that const model doesn't attempt to estimate m (doesn't impact likelihood anyway

	
  * Ensure only positive values of sigma are returned (trying use trigger in setLTC and setLSN to return infinite variance if sigma is negative)

	
  * tau distributions compare totally separate null and test models, rather than ones both estimated from the same dataset.


Today's simulations
[flickr-gallery mode="search" tags="stochpop" min_upload_date="2011-02-02 00:00:00" max_upload_date="2011-02-03 23:59:59"]

