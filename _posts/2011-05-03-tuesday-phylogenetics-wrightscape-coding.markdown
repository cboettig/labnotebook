---
comments: true
date: 2011-05-03 23:31:25
layout: post
slug: tuesday-phylogenetics-wrightscape-coding
title: 'Tuesday: phylogenetics- wrightscape coding'
redirects: [/wordpress/archives/1543, /archives/1543]
categories:
- evolution
---

Writing methods to loop wrightscape models over lists of different traits, regimes, and model specifications.  Easy to end up with large-dimensional output, challenge for visualization.  Experimenting with different groupings.

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2011-05-03 00:00:00" max_upload_date="2011-05-03 23:59:59"]

See code: [loop_models_traits_regimes.R](https://github.com/cboettig/wrightscape/blob/e8d421733d46adc1f936a19772ca3d9a3f98013c/demos/loop_models_traits_regimes.R)

Routine attempts hansen fit for initial estimates of alpha and sigma.  Could be greatly improved.  Should extend attempts to guess initial conditions for optimization.  Should add better convergence testing, simulated annealing option.


## Wainwright lab presentation


Presented recent work in Wainwright lab today, focusing mostly on release of constraint work.  Suggestions:



	
  * show graph of parameter scores fixed by clade (instead of painting).

	
  * Refer to as generalized model, rather than just "release of constraint."

	
  * Illustrating two transitions greatly complicates the presentation: begin with parrotfish only as a first example, focusing on the intramandibular joint.

	
  * Intriguing pattern in gape suggests a change in alpha at both transitions, and change in theta only at the intramandibular joint.  Will have to see if closer analysis bears this out.

	
  * Can software identify most promising cases, rather than always presenting results for all traits and models?




## Misc





	
  * Finish up [Friday's entry](http://www.carlboettiger.info/archives/1534).

	
  * Submitted Warning Signals abstract for CSGF conference

	
  * Prepared [iEvoBio lightning talk](http://ievobio.org/ocs/index.php/ievobio/2011/schedConf/cfp#lightning)[proposal](http://www.carlboettiger.info/archives/1549)

	
  * added pdf export support for pages (as-pdf and pdf24 don't seem to format well, using [Kalins PDF creation station plugin](http://wordpress.org/extend/plugins/kalins-pdf-creation-station/), which support running other plugins (kcite) before creating pdf, in addition to other customization options).  Rather than providing a link (still an option), posts or pages can be converted to pdf in the tools menu in dashboard.


