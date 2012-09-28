---
comments: true
date: 2012-01-04 12:48:29
layout: post
slug: wrightscape-examples
title: wrightscape examples
redirects: [/wordpress/archives/3565, /archives/3565]
categories:
- evolution
---

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2012-01-03 7:00:37" max_upload_date="2012-01-03 22:23:37"]





	
  * kt and open seem the best focal traits. Unclear what good null traits to use would be.

	
  * Unclear if anything is gained by indep thetas in this example.

	
  * Performance of alpha v theta?


Edited plotting of likelihood comparisons, just grouped by trait to get common axis. (Difficult to get intelligent zooming on facet_grid to ignore the outliers). Trying such as:


```R

lims <- cast(dat, comparison ~ trait, function(x) quantile(x, c(.05,.95)))
coord_cartesian(ylim=c(min(lims), max(lims)), wise=TRUE)

```


but I need different ylims for each row when facet_grid has scales="free_y".

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2012-01-04 7:00:37" max_upload_date="2012-01-04 13:23:37"]



Running likelihood ratio comparisons across all traits in following model comparisons:

	
  1. Brownie vs alphas



	
  1. Brownie vs thetas (ouch/hansen)

	
  2. thetas vs alphas

	
  3. sigmas vs alpha-thetas

	
  4. alphas vs alpha-thetas

	
  5. thetas vs alpha-thetas


on both two-shifts regime model and the intramandibular regime model.

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2012-01-06 7:30:37" max_upload_date="2012-01-06 14:35:00"]




## New model comparisons





	
  1. BM vs Brownie

	
  2. BM vs OU

	
  3. Brownie vs alphas

	
  4. Brownie vs thetas

	
  5. OU vs Brownie

	
  6. thetas vs alphas




#### Labrid data, intramandibular innovation (Summary Plot)


![]( http://farm8.staticflickr.com/7004/6649525841_1885da3766_o.png )


Individual images:

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2012-01-06 14:35:00" max_upload_date="2012-01-06 16:00:37"]




### Parrotfish only


Not really enough power in Parrotfish-only version:

![]( http://farm8.staticflickr.com/7142/6649845527_f9e7115dc3_o.png )


[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2012-01-06 16:05:00" max_upload_date="2012-01-06 16:30:37"]


### Full Labrids


Still running: two-shifts version


