---
comments: true
date: 2011-06-16 22:14:58
layout: post
slug: wrightscape-labridparrotfish-results-evolution-pres
title: Wrightscape labrid/parrotfish results; Evolution pres
redirects: [/wordpress/archives/2011, /archives/2011]
categories:
- evolution
---

## Analysis




### Summarizing recently completed runs:





	
  * Reviewing last night's runs.  Some mcmcs complete:




##### Labrid prot.y alpha


![]( http://farm4.staticflickr.com/3011/5839272436_8b1fa13fdd_o.png )




	
  * and some crashed mcmc's on Zero launched Tuesday night. (gape.y, close, open don't seem to want to run)



	
  * the sigma-theta Vs alpha-theta on parrotfish (size-corrected) protrusion (over intramandibular innovation), which looks indistinguishable:




##### sigma-theta vs alpha-theta, parrotfish prot.y


![]( http://farm4.staticflickr.com/3643/5838783582_5163ed9340_o.png )


![]( http://farm6.staticflickr.com/5320/5838230713_6d0a28c2b5_o.png )


![]( http://farm3.staticflickr.com/2527/5838781212_b5899fba56_o.png )


alpha v sigma also indistinguishable on this data, see yesterday.


#### Closing, alpha vs sigma, parrotfish (intramandibular, 200 reps)




##### Alpha


![]( http://farm6.staticflickr.com/5269/5840194504_85847a578c_o.png )



##### Sigma


![]( http://farm4.staticflickr.com/3310/5839645873_d9eec0d8bd_o.png )



##### Comparison


![]( http://farm3.staticflickr.com/2767/5840194082_1c2b941997_o.png )


Would like nicer with more replicates, but clearly distinguishable, as were yesterday's when theta could also vary.  Note: Green is intramdibular, blue is other.  If trait can't vary across phylogeny, then there's only a green distribution for both.


### Runs launched today





	
  * Would really like a full labrid tree, Pharyngeal innovation, alpha-v-sigma MLE.  Running on zero at nice 0 (10:59am).

	
  * an alpha-sigma mcmc of labrid tree would also be nice. Trying on eleven (nice 10) now. (~11:15a)

	
  * Would be nice to compare directly against Brownie/pure diversification.  running on parrotfish close ratio at (nice 1) on one (2:48pm).

	
  * Would also be nice on labrids protrusion.  running on zero, nice 5 (2:55pm)




## Code Updates


Added plotting facility for MLE bootstrap distributions.  Needs to be added to the calls for the MLE examples.


## Presentation





	
  * Add tree for the examples

	
  * Distribution walkthrough

	
  * distinguish between MCMC and bootstraps clearly.

	
  * Describe software package availability

	
  * Motivate better the need for other models




## Checking in on Warningsignals





	
  * caco3 run was terminated, deut run never restarted after lapply failed.  running deut_analysis.R now (n19) on zero (3:00pm).




## Misc





	
  * Filed TreeBASE [bug](https://sourceforge.net/tracker/?func=detail&aid=3317415&group_id=248804&atid=1126676) in logicals

	
  * Excellent set of slides and commentary by Rod Page on the state of [phylogeny visualization](http://www.slideshare.net/rdmpage/phylogeny-vizbi-2011).


