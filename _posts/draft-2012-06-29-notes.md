---
layout: post
title: Progress this week, by project

---

### Critical transitions

Must determine the correct set of comparisons:  

* Solve the SDP optim using the exact time dependent  
* Simulate under an f with the same escapement policy but different functional form, i.e. logistic with K & r estimated from the May example, either analytically or directly from the data.  
* Considering the [costs of "cautious policy"](https://github.com/cboettig/pdg_control/blob/ef5148047563ca8e1bd05d4d946161cc64364f16/inst/examples/cautious.md) (calculates optimal harvest recursively but always selects a fraction P of the optimal.)   Results in non-constant escapement rules:

![plot of chunk policyfn_plot](http://farm9.staticflickr.com/8152/7455686164_d55ac0dde9_o.png) 

Also has nonlinear (convex) impact on value.   


Filing out the boxes:

* the value of no action, no shift -- NPV under assumed model
* the value of no action, shift -- depends when shift occurs.  Assume worst?  
* value of action, no shift -- Action is p = ?  
* value of action, shift -- action is p = ?  Under what shift process? 

* Consider the single-timestep decision first.  Then the repeated decision.  

### Value of information

* [logistic, lognormal](https://github.com/cboettig/pdg_control/blob/8373d9ae215cb49bceb5f8b2684078335ce68e44/inst/examples/logistic_lognormal.md) (any measurement error is most conservative, then determinstic.  gi the least)
* Beverton-Holt, lognormal ([early version of figures](https://github.com/cboettig/pdg_control/blob/0a43d3e60966b9af9ad6adfe7c3ff4a62638226a/inst/examples/value_of_information.md)) deterministic is _least_ conservative, measurement errors, combined errors most. (Rerunning as bh_lognormal.Rmd) 
* [logistic, uniform](https://github.com/cboettig/pdg_control/blob/2d6d42f04de6df2fdca6a16a67c8a665b202a8f6/inst/examples/voi_sethi_parameters.md) (deterministic is always most conservative.  gi is least)
* [Beverton-Holt, uniform](https://github.com/cboettig/pdg_control/blob/2d6d42f04de6df2fdca6a16a67c8a665b202a8f6/inst/examples/bh_uniform.md) (deterministic is most conservative, growth noise is least!)


### rfishbase revisions

* add fair use text, future development with fishbase.org
* add all dependencies
* Reply letter text, send to P and D
* fix regression
* fix figures
* Resubmit.  


### Treebase

* Finish updates based on Duncan's suggestions
* Submit 0.0-6 to CRAN. DONE
* Submit manuscript.  DONE


### To Do

- rfishbase -- revisions
- evolution talk
- ievobio talk
- csgf talk
- esa talk
- wrightscape
- Alan decision theory and early warning 
- Jim's precautionary paper JEEM 
- PDG policy costs 
- Jake uncertainty and learning




