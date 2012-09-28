---
comments: true
date: 2011-06-09 16:48:42
layout: post
slug: mcmc-and-bootstrapped-likelihood-runs-on-parrotfish-tree
title: mcmc and bootstrapped likelihood runs on parrotfish tree
redirects: [/wordpress/archives/1951, /archives/1951]
categories:
- evolution
---

## Thursday Overview





	
  * Alan Meeting

	
  * Still running scripts, see below

	
  * pmc vignette




## To Do





	
  * Got Duncan's ROAuth utilities for RMendeley, still need to test.



	
  * Testing Scott's rplos functions

	
  * Send Alan the paragraph for edits.





## Computation





#### Running on one





	
  * n 15: sim_general_mcmc.R   MCMC of general model with 8 x 1e6 reps.  alpha diverged. DEAD

	
  * n14 Retry above with 8 x 1e6 and with less general model: sigma, theta indep only. WAITING

	
  * n 18: parrotfish_gape.R: alpha,theta indep, vs sigma, theta indep on lever closing ratio (not gape, actually) data.  whoops, ran alpha twice instead.  DEAD

	
  * n18 Rerun with 800 boot reps.  on "close" lever ratio: SUCCESS

![]( http://farm6.staticflickr.com/5222/5815759965_0cd67baa47_o.png )

![]( http://farm3.staticflickr.com/2012/5815760235_9a712a2713_o.png )

![]( http://farm3.staticflickr.com/2173/5816327756_4742c4c72c_o.png )


	
  * n16 simulated release: as above on sim (alpha,theta indep, vs sigma, theta global on sim data).  Parallel Error.  DEAD

	
  * n16 Retry. SUCCESS

Note that this is actually less clear fit to (underlying) alpha model than in the true data.  Also, theta is global (differing theta runs faced difficulties, not sure why).
![]( http://farm6.staticflickr.com/5231/5815700214_a606a42554_o.png )

![]( http://farm4.staticflickr.com/3033/5815132713_821c101d0c_o.png )

![]( http://farm3.staticflickr.com/2752/5815700830_60c588749b_o.png )

The two sigma peaks aren't visible due to y-axis scaling, which will have to be fixed (one is around 0, the other around 5).
	
  * n17 gape.y mcmc_demo.R with sigma, theta indep, 1e6 x 8 DEAD (hits bad hastings ratio)

	
  * n19 gape.y mcmc_demo.R with alpha, theta indep, 1e6 x 8 DEAD (hits bad hastings ratio)




## Auto-generated gallery of today's runs


[flickr-gallery mode="search" tags="phylogenetics" min_upload_date="2011-06-08 22:00:00" max_upload_date="2011-06-09 23:00:00"]


## Code tidbits


Would be nice to force me to write the comment about the script at runtime, rather than in the script itself (where I might forget to update it on a run).
As long as any parameters are not written in by hand, the latter is okay.  Tried adding prompt on batch mode, unsuccessfully:

Read in command line arguments at batch mode: ((Adapted from [here](http://yangfeng.wordpress.com/2009/09/03/including-arguments-in-r-cmd-batch-mode/)))


```bash

$ R CMD BATCH --no-save --no-restore '--args a=1 b=c(2,5,6)' test.R test.out &

```


Each argument must have no spaces, doesn't seem to be able to pass text strings.


```r

##First read in the arguments listed at the command line
args=(commandArgs(TRUE))

##args is now a list of character vectors
## First check to see if arguments are passed.
## Then cycle through each element of the list and evaluate the expressions.
if(length(args)==0){
    print("No arguments supplied.")
    ##supply default values
    a = 1
    b = c(1,1,1)
}else{
    for(i in 1:length(args)){
         eval(parse(text=args[[i]]))
    }
}
print(a*2)
print(b*3)

```


Always forget how to do block commenting in VIM: ((from [here](http://hurley.wordpress.com/2007/06/13/vim-tip-comment-out-multiple-lines/))) Easiest to just select in visual mode (v) and then do :s/^/^#/
