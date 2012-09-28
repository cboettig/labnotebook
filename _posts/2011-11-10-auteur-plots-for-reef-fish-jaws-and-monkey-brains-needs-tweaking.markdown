---
comments: true
date: 2011-11-10 17:22:17
layout: post
slug: auteur-plots-for-reef-fish-jaws-and-monkey-brains-needs-tweaking
title: Auteur plots for reef fish jaws and monkey brains -- needs tweaking
redirects: [/wordpress/archives/3229, /archives/3229]
categories:
- evolution
---

Looking at the diversification patterns from Auteur.  Longer rjmcmc runs aren't showing a significant difference, but more attention needed in parameters such as initial merge-split probability perhaps?  Seems to overestimate the change points.

![]( http://farm7.staticflickr.com/6033/6333499476_06c5674425_o.png )

![]( http://farm7.staticflickr.com/6235/6327052959_473815cc4d_o.png )




![]( http://farm7.staticflickr.com/6105/6332213939_5c0707a26d_o.png )




![]( http://farm7.staticflickr.com/6226/6327078803_4b6dd1cc44_o.png )




Remains true for the primate brains example:

![]( http://farm7.staticflickr.com/6119/6322815367_6a796cd607_o.png )




Set up to run on carver cluster, copy over the saved rda file and all files matching the random string already saved as outputs.  Full labrid example on 20 cores still exceeds the allocation capacity for an R vector.



	
  * Note on the x-axis scale - often isn't autoscaled, but providing the appropriate a range to xlim (matching max branch length) can fix this.



	
  * Cannot figure out how to increase the fontsize of species names - cex or pointsize for png output both only seem to increase fontsize for the legends, etc.


