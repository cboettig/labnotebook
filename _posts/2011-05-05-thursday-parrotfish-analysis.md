---
comments: true
date: 2011-05-05 16:57:28
layout: post
slug: thursday-parrotfish-analysis
title: 'Thursday: parrotfish analysis'
redirects: [/wordpress/archives/1608, /archives/1608]
categories:
- evolution
---

Summarizing parrotfish data under the single shift at the intramandibular joint.  See version stable code for data loading/transforms ([parrotfish_data.R](https://github.com/cboettig/wrightscape/blob/827da7db4b1825ca2f800002328c31c8fe0e1024/demos/parrotfish_data.R)), and for plots ([parrotfish.R](https://github.com/cboettig/wrightscape/blob/6e545b9ff299cb30f2e3a7e95acc09b0d42a1c3a/demos/parrotfish.R)) as shown, and for analysis functions ([loop_models_traits_regimes.R](https://github.com/cboettig/wrightscape/blob/6e545b9ff299cb30f2e3a7e95acc09b0d42a1c3a/demos/loop_models_traits_regimes.R)).  Models are named by the parameter which is regime-dependent.  Results are shown sorted by likelihood, so the best model is on top, and likelihood values are scaled by the weakest model.

Tree:
![]( http://farm6.staticflickr.com/5021/5691359485_a00d084d85_o.png )


alpha is favored in all the ratio traits, sometimes substantially.
![]( http://farm6.staticflickr.com/5265/5691184643_184bca54d2_o.png )


Without size corrections the muscle traits essentially reflect body mass.  Though ratio may be better than the regression:

![]( http://farm6.staticflickr.com/5184/5691756348_90744b6d35_o.png )


Size-corrected length traits show a substantial signal:

![]( http://farm6.staticflickr.com/5309/5691756336_4c0267c963_o.png )


The appaxial muscle looks strong candidate for release of constraint, the control muscles not involved with the jaw mechanism do not show any such release:

![]( http://farm6.staticflickr.com/5187/5691184637_2e1c33781b_o.png )


Strength of constraint (alpha parameter), by trait: log ratio of intramandibular to other parrotfish:
![]( http://farm6.staticflickr.com/5069/5691354277_db6aaf2b2b_o.png )


hmm, doesn't match the general model fits:
![]( http://farm6.staticflickr.com/5142/5691354301_b2f6914bdd_o.png )



## Puzzles and puzzle-shooting


A couple traits don't converge for the general model:

> conv(test)
[1] "trait  AM.x regime intramandibular model wright didn't converge"
[1] "trait  SH.y regime intramandibular model wright didn't converge"
[1] "trait  LP.y regime intramandibular model wright didn't converge"
>

Above uses equal-alpha always as starting conditions (taken from hansen fit).  Comparing against a fit attempt using very different alphas for each regime (intra at 0.1, other at 5).  Comparisons run and pushed to flickr, gallery below.  Results are clearly different; i.e. alpha ratios on release (alpha varies) model:

![]( http://farm6.staticflickr.com/5304/5692100638_22d88e2637_o.png )


(replotted without the two dominant ratios [here](http://www.flickr.com/photos/cboettig/5692103784/in/photostream/), first in stream below.)

[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2011-05-05 18:00:00" max_upload_date="2011-05-05 18:45:00"]

Results in more convergence errors, but not enough to explain difference (only one release_constraint model didn't converge):

> conv(test)
[1] "trait bodymass, regime intramandibular, model ouch didn't converge"
[1] "trait bodymass, regime intramandibular, model release_constraint didn't converge"
[1] "trait LP.x, regime intramandibular, model ouch didn't converge"
[1] "trait open, regime intramandibular, model ouch didn't converge"
[1] "trait kt, regime intramandibular, model ouch didn't converge"
[1] "trait LP.y, regime intramandibular, model wright didn't converge"

([commit ](https://github.com/cboettig/wrightscape/commit/296b2f11a6ac9ffb2f5e02bc22de7b4116ef30fb)with this version of code)

Illustrates need for more robust searching of the likelihood surface!

Trying now with simulated annealing, shows a release of constraint:

> wright_alphas
intramandibular    other
gape.y        3.786699 12.59779
prot.y        9.275002 15.27857
> release_alphas
intramandibular     other
gape.y        2.008825  2.262495
prot.y       23.093936 25.768637
>
Protrusion strongly favors alpha model:

> lliks
$gape.y
gen     alpha     sigma
0.0000000 0.7693642 1.0315282

$prot.y
sigma      gen    alpha
0.00000 13.04190 13.44653

Worrisome that gen doesn't do best though, it probably needs a slower cooling schedule for so many parameters. ([code](https://github.com/cboettig/wrightscape/commit/9edfeabe785a6be8e3ce5db137278695f29ea4cd))

Trying with slower cooling, starting with unfavorable init conditions (higher alpha for intramandibulars):

release_alphas
intramandibular      other
gape.y        1.969489  0.6064478
prot.y       25.087304 27.2187761
> wright_alphas
intramandibular     other
gape.y        2.198133  4.446376
prot.y       20.443740 22.325272
>

Clearly just need super aggressive parameters.  Robust search for actual inferences coming up.  Need to add automated clever convergence testing.




## Meetings:




### Duncan


Discussing web tools to interface with APIs, with implementations in R.  OAuth, CURL, XML, JSON.  Approaches in REST vs SOAP.  Notes (in prep, will be separate post.)


### Marissa Lab
