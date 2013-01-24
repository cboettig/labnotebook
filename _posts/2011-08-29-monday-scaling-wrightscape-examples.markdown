---
comments: true
date: 2011-08-29 18:27:20
layout: post
slug: monday-scaling-wrightscape-examples
title: 'Monday: scaling wrightscape examples'
redirects: [/wordpress/archives/2473, /archives/2473]
categories:
- computation
- evolution
tags:
- hpc
---



	
  * syntaxHighligher isn't working. no idea why, posted to forums.

	
  * Still no luck compiling gsl on carver.  Can't install gsl R package or compile wrightscape C code.  posted C issue to NERSC, R issue to statscicomp.  



Commits to taxize pushed to Scott.



##  wrightscape 





###  parrotfish example 


Convergence test: with simple (common) initial values (alpha=.1, sigma=1), the different methods behave mostly appropriately: outer nested models out-perform inner ones, and likelihoods roughly agree between ouch package methods and wrightscape equivalents:

[gist id=1179079]

values agree with those from the sigma=40 starting condition (biased to explain variation by sigma instead of alpha).  Note that with fixed alpha, the sigmas-indep is doing just slightly worse than the sigmas-global model, and the sigmas-indep model with sigma=40 starting condition did substantially worse than this.  

So, it looks like good evidence for selection at least (non-zero alpha).  Next run should see if there's any evidence of two different selection strengths.  



	
  * Running ou vs 2 alphas on farm, 64 nodes 


Some evidence, thought difference in alphas seems very small relative to the resolution:

![]( http://farm7.staticflickr.com/6182/6094130312_ca51efa2a7_o.png )
 ![]( http://farm7.staticflickr.com/6069/6094130360_aa6ec76838_o.png )


Running alphas vs sigmas2, an OU model with sigmas indep vs one with indep alphas.  Likely not distinquishable: parrotfish2. 64 cores, farm.  

Also running the fully general model against the indep sigmas, second-best scoring.  May be distinguishable: parrotfish_indep, 128 cores, farm.  



### Primates example 



A much larger tree, routine is much slower.  For some reason, MLE on the brownie-style models do the worse.  Primates dataset shows release of constraint over OU:

![]( http://farm7.staticflickr.com/6203/6094761018_0b2c2387ff_o.png )
 ![]( http://farm7.staticflickr.com/6083/6094761040_de833e0882_o.png )
 

Waiting on primates2.R to compare this to brownie result.  



###  Wrightscape/gsl compile on carver!


Automatic configuration failed, but was able to set libraries manually in Makevars:


    
    
    PKG_CPPFLAGS=-I/usr/common/usg/gsl/1.13/include -Wall -O3
    PKG_LIBS=-L/usr/common/usg/gsl/1.13/lib -lm -lgsl -lgslcblas                                                       
    



Then removing all the configure files and loading the intel modules (R wants the intel compilers for carver I guess):


    
    
    module swap pgi intel
    module swap openmpi openmpi-intel
    module load gsl
    module load R/2.12.1
    R CMD INSTALL wrightscape
    


and we're live!  

[NERSC grant submitted](https://nim.nersc.gov/ercap_menu.php).  
