---
comments: true
date: 2011-10-26 15:49:27
layout: post
slug: labrid-submodels
title: Labrid submodels
redirects: [/wordpress/archives/3037, /archives/3037]
categories:
- Phylogenetics
---

Updates to labrids results:



	
  * [Results from](http://www.carlboettiger.info/archives/2960) Parrotfish tree & 2-partition Labrid tree on full model.




### Full model, Labrids Pharyngeal Shift




[![](http://farm7.static.flickr.com/6056/6284030745_75ea415a08_o.png)](http://farm7.static.flickr.com/6056/6284030745_75ea415a08_o.png)





#### Alphas




![]( http://farm7.staticflickr.com/6236/6284030401_985162f874_o.png )






#### Sigmas


![]( http://farm7.staticflickr.com/6043/6284030429_3fe0187f59_o.png )



### Full Model,  Intramandibular Shift


![]( http://farm7.staticflickr.com/6049/6284507842_ea98730121_o.png )


![]( http://farm7.staticflickr.com/6040/6284507386_7ee804e414_o.png )


![]( http://farm7.staticflickr.com/6118/6284507370_1615c32c6b_o.png )


.


### Labrid tree, multi-sigma model,  both shifts


Surprising less powerful at identifying the differences.

![]( http://farm7.staticflickr.com/6106/6284061485_9d3013448e_o.png )


Note that this still estimates OU models, and hence has a global alpha, and unique thetas:

![]( http://farm7.staticflickr.com/6229/6284609616_faf3fce83f_o.png )



### LABRID TREE, MULTI-alpha,  BOTH SHIFTS


![]( http://farm7.staticflickr.com/6049/6284581522_3057f6cb92_o.png )



### Parrotfish tree, multi-sigma model:


![]( http://farm7.staticflickr.com/6212/6284625308_a190be5675_o.png )



### Parrotfish tree, multi-alpha model:


![]( http://farm7.staticflickr.com/6119/6284105359_6c633db6a6_o.png )



### Labrid pharyngeal only, multi-sigma model:


[flickr]http://www.flickr.com/photos/cboettig/6284633974[/flickr]


### Labrid pharyngeal, multi-alpha


[flickr]http://www.flickr.com/photos/cboettig/6284114285[/flickr]


### Labrid intramandibular only, multi-sigma model:


[flickr]http://www.flickr.com/photos/cboettig/6284640552[/flickr]


### Labrid intramandibular, multi-alpha


[flickr]http://www.flickr.com/photos/cboettig/6284121123[/flickr]

Full model plots with: [method2_plots.R](https://github.com/cboettig/wrightscape/commit/1c1dcc93c7d5185e2763503d38739a72b4b18d0e#diff-0)

submodel plots with: [ method2_subplot.R](https://github.com/cboettig/wrightscape/commit/1c1dcc93c7d5185e2763503d38739a72b4b18d0e#diff-1)


## What's not here: pure BM shift models





	
  * Auteur version




	
  * Brownie version




	
  * Wrightscape version


running on parrotfish and full labrid_data example.
