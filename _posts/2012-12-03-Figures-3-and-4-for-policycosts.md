---
layout: post
category: ecology
tags: [pdg-control, decision-theory]
modified: 2012-12-04

---


Straight-forward tasks can sometimes take forever.  In advance of our upcoming conference call for the Pretty Darn Good Control (`pdg-control`) NIMBioS working group, I had a few remaining issues to touch up in Figures 3 and 4.  

Figure 3 shows harvest and stock dynamics under the different functional forms fo the cost.  The goal is to provide a very intuitive, visual sense of how the policies differ under these different functional forms, such as a fixed "transaction fee" (fixed) or a cost that is proportional to the size of the change in policy (L1), or the square of that change (L2), etc.  I had already cobbled together the code for this, but simply had to run over the same set of replicates and pick a window length appropriate to see the differences.  The trick was make sure we were comparing functional forms that had the same overall net impact on the Net Present Value of the stock.  In this way, the differences observed are due only to differences in the form of the cost, and not the total magnitude of the cost.  Figure 2 already provided a way to do this scaling, I simply needed to back out the scaling programmatically.  

Finding these "apples-to-apples" levels is something of a computational brute force excercise, computing the costs along a grid of coefficients for each method.  Otherwise the idea is pretty straight forward.  One trick was being able to use the policies calculated in this step to generate the Figure 3 simulations, rather than recalculating the policy once the right scaling value `c2` is known.  

Figure 4 provides a more quantitative way to look at the comparison.  I had already created a version of this graph that showed how variance and autocorrelation in the policy and state variable dynamics changed as the total magnitude of the cost increased.  Unfortunately this suffered from the apples-to-oranges problem for comparing between functional forms.  The x-axis needed to be calculated in terms of the reduction of the NPV, rather then the coefficients (`c2`, which mean different things in the different forms), for a proper apples-to-apples comparison.  


Okay, straight forward exercise.  47 commits and 19 hours later, I have what I need.  And it is 5am.  Oh well, this post is still going down as "Monday". 


### Figure 3

#### Stock (state variable) dynamics

![](/assets/figures/2012-12-05-72dc8741fb-p1.png) 

#### Harvest (control variable) dynamics

![](/assets/figures/2012-12-05-72dc8741fb-Figure3.png) 


### Figure 4

#### Stock (state variable) dynamics

![](/assets/figures/2012-12-05-72dc8741fb-Figure4S1.png) 

![](/assets/figures/2012-12-05-72dc8741fb-Figure4S2.png) 

##### Harvest (control variable) dynamics

![](/assets/figures/2012-12-05-72dc8741fb-Figure41.png) 

![](/assets/figures/2012-12-05-72dc8741fb-Figure42.png) 



[full knitr file here](https://github.com/cboettig/pdg_control/blob/25e6f1c1a599440be790a7ec047b8b63540255c5/inst/examples/policycosts/writeup.md)

These are calculated with `c0 = 30`.  There's corresponding figures when fishing effort itself is cost-free, `c0 = 0`.  See [costfree.md](https://github.com/cboettig/pdg_control/blob/cccec55a8ac2ef47dea99d45fdb732e5028aec98/inst/examples/policycosts/costfree.md).  Looks like the `c2` range needs to be extended for this run.  

### Figure 2

The apples-to-apples illustration is also generated in this script.  

![](/assets/figures/2012-12-05-72dc8741fb-apples_plot.png) 




### Misc notes

Caching is pretty helpful in fiddling with these slow computations.  Sometimes it helps to copy the cache of the intensive part of a run over from the supercomputer to the local machine, and load the whole cache into an interactive R session.  Loading the whole cache can be done as such:


```r
e <- environment()
files <- gsub(".rdb", "", system('ls *.rdb', intern=TRUE))
sapply(files, lazyLoad, env=e)
```


providied the target chache directory doesn't have caches of different commits.  



