---
comments: true
date: 2011-06-15 22:36:07
layout: post
slug: wednesday-mcmc-and-mles-for-wrightscape
title: Wednesday MCMC and MLEs for wrightscape
redirects: [/wordpress/archives/1988, /archives/1988]
categories:
- evolution
---


	
  * Wrote plotting function for wrightscape MCMC analysis

	
  * added support to write MCMC to a file.

	
  * exploring divergent MCMCs.  more checks on NaNs

	
  * trying MLE initiated MCMC

	
  * Revising talk for evolution

	
  * tweaks to socialR reporting -- include error message, exit with status=1, fewer time sigfigs; see gitlog.




## Max likelihoods & bootstraps




### Parrotfish protrusion (size corrected, 400 reps)


If thetas are different and not allowed to vary, the alpha model will obviously do worse than the sigma model, even if it is correct.


##### Alpha


![]( http://farm6.staticflickr.com/5142/5835746025_850538f03c_o.png )



##### Sigma


![]( http://farm6.staticflickr.com/5302/5835747179_0af35db2a9_o.png )



##### Alpha vs Sigma


![]( http://farm3.staticflickr.com/2515/5835744831_fe47ba11fc_o.png )



### Parrotfish Closing Lever Ratio (400 reps)




##### sigma-theta


![]( http://farm6.staticflickr.com/5274/5835165136_aa9b08f95b_o.png )



##### alpha-theta


![]( http://farm3.staticflickr.com/2546/5835164312_8208fba174_o.png )



##### alpha-theta vs sigma-theta:


![]( http://farm6.staticflickr.com/5038/5835163592_db36ffc457_o.png )



### All Labrids, (size corrected) Protrusion, (400 reps)




##### alpha


![]( http://farm3.staticflickr.com/2454/5837934440_16e015f0fa_o.png )



## Need (now running):





	
  * all labrids, prot.y alpha v sigma (one, n12)

	
  * all labrids prot.y alpha-theta v sigma-theta (running on zero)

	
  * parrotfish closing ratio alpha v sigma  (one, n18)

	
  * parrotfish prot.y alpha-theta vs sigma-theta (one, n19)


