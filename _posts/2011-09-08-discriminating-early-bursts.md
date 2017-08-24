---
comments: true
date: 2011-09-08 23:08:33
layout: post
slug: discriminating-early-bursts
title: discriminating early bursts
redirects: [/wordpress/archives/2558, /archives/2558]
categories:
- evolution
---

Looking at cases when early burst can be discriminated from OU, a la Harmon et al 2010 (Harmon _et. al._ 2010). Fixed models can be told apart. Rather trivially, none of these models can be told apart if initially estimated from Brownian data. Rather encouraging: models estimated from common data can be told apart. 600 taxa tree

![]( http://farm7.staticflickr.com/6199/6125357510_a09d6f32dd_o.png )


Still works on 60 taxa, identifying OU correctly when sim under OU (left), and EB for EB data (right):

![]( http://farm7.staticflickr.com/6185/6126018835_6199c37005_o.png )
  ![]( http://farm7.staticflickr.com/6209/6128149375_b398dc55dd_o.png )


But not always.

Parameter estimation on weak EB can be quite tough.  600 taxa tree does fine with a stronger EB signal, though with considerable uncertainty

![]( http://farm7.staticflickr.com/6193/6124689945_db2e564065_o.png )


For instance, the small geospiza data set (13 taxa) the OU fits better, but not substantially:

![]( http://farm7.staticflickr.com/6186/6130047163_ca04cc1f3d_o.png )


Should add parameter distributions for the above cases and run the model choice on a couple simulations with weaker EB parameters, as well as a couple of the real data sets.

## References


- Harmon L, Losos J, Jonathan Davies T, Gillespie R, Gittleman J, Bryan Jennings W, Kozak K, McPeek M, Moreno-Roark F, Near T, Purvis A, Ricklefs R, Schluter D, Schulte II J, Seehausen O, Sidlauskas B, Torres-Carvajal O, Weir J and Mooers A (2010).
"Early Bursts of Body Size And Shape Evolution Are Rare in Comparative Data."
*Evolution*.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2010.01025.x">http://dx.doi.org/10.1111/j.1558-5646.2010.01025.x</a>.
