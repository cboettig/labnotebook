---
comments: true
date: 2011-11-13 00:54:39
layout: post
slug: non-optimal-outcomes-of-optimal-solutions
title: non-optimal outcomes of optimal solutions
redirects: [/wordpress/archives/3296, /archives/3296]
categories:
- ecology
tags:
- pdg-control
---

I consider the optimal stochastic-dynamic programming solution for the model specified with known stochasticity in population dynamics, but now vary the actual simulated dynamics to include further uncertainty or error not included in the optimal solution in different ways.  In some way this is an "unfair" analysis, as I really should be solving for the optimal solution in light of the fully uncertain space, but in practice this at least serves as a sensitivity analysis to the assumptions that certain quantities are perfectly known. I consider several scenarios below.  





### Parameter value misspecification


Has essentially no impact on extinction risk on models without allee effects, but dramatic impact of 5% overestimate in a parameter.  Many optimally managed populations crash, compare to very few crashes of the same dynamics in unharvested scenario:

![]( http://farm7.staticflickr.com/6053/6339141969_0ff1be1d6a_o.png )


![]( http://farm7.staticflickr.com/6234/6339892296_18a8e5a0db_o.png )






### Uncertainty in harvest and stock


Doing optimal management that accounts for stock growth uncertainty but not harvest uncertainty or stock assessment uncertainty. Large stock assessment uncertainty can crash even the  non-allee Beverton-Holt model.



#### Risk of ignoring stock-assessment uncertainty



![]( http://farm7.staticflickr.com/6231/6339956972_10d3a84497_o.png )


Will need to account for these uncertainties in the optimal solution. Increasing noise in the population dynamics (which the optimal solution is compensating for) can compensate for this, and additional stock assessment noise doesn't do much additional damage:



####  Unaccounted-for uncertainty can have little impact when smaller than the accounted-for sources 

#### 
![]( http://farm7.staticflickr.com/6226/6339968498_c715285c49_o.png )




### including policy limitations


Consider performing the stock assessment and updating the harvest quota (according to the optimal management solution) every four years.  Note this is suboptimal as the optimization assumed updating every year was possible. 

![]( http://farm7.staticflickr.com/6232/6345350242_8b11b20f21_o.png )


![]( http://farm7.staticflickr.com/6114/6345352340_8394155570_o.png )




###  further simple examples 





	
  * Should consider annually adjusted quotas based on projected stock assessment. Compare to fixed quota calculated for a 4-yr interval between assessments.

	
  * Slower-responding policy variable?  cost to changing fishing effort?  differential cost to increase vs decrease effort?  differing timescales?

	
  * Should add plots to compare profits associated with different perturbations







### Varying the cost of extinction


This one is a bit different then the uncertainty experiments.  Since the population can crash, we can consider a penalty for crashing the population by offering a reward for meeting the boundary condition. In the deterministic (or nearly deterministic) case, this condition is always satisfied.  In the very stochastic case, the optimal solution accepts some probability of not satisfying the boundary condition in return for a greater harvest reward. 

Dramatically (100x) increasing reward for meeting boundary condition at or above allee threshold can decrease crashes even in spite of model parameter misspecification (5% lower growth, as above):

![]( http://farm7.staticflickr.com/6111/6339906744_b68e322437_o.png )


Direct (but finite) cost penalty on extinction, vs adjusting reward for meeting boundary condition? How is this implemented?





### Learning & adaptive management





## Reading/Refs


Working through Sethi et al, "Fishery Management Under Multiple Uncertainty," (Sethi _et. al._ 2005)

## References


- Sethi G, Costello C, Fisher A, Hanemann M and Karp L (2005).
"Fishery Management Under Multiple Uncertainty."
*Journal of Environmental Economics And Management*, **50**.
ISSN 00950696, <a href="http://dx.doi.org/10.1016/j.jeem.2004.11.005">http://dx.doi.org/10.1016/j.jeem.2004.11.005</a>.
