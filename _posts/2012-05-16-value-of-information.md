---
layout: post
title: Value of information, cost of bias
tags: decision-theory  
---


## Value of information

I've considered four scenarios so far, (links to results)

- ["Value of information" (VI)](https://github.com/cboettig/pdg_control/blob/e501e219ddae177804751f289355510a8c5fc88a/inst/examples/value_of_information.md)
- ["Value of stochasticity" (VS)](https://github.com/cboettig/pdg_control/blob/e501e219ddae177804751f289355510a8c5fc88a/inst/examples/value_of_stochasticity.md)
- ["Cost of underestimating" (CU)](https://github.com/cboettig/pdg_control/blob/e501e219ddae177804751f289355510a8c5fc88a/inst/examples/cost_of_underestimating.md)
- ["Reckless driver" (RD)](https://github.com/cboettig/pdg_control/blob/cfe87046bb29122b4e624459b63e4df5db34118d/inst/examples/reckless_driver.Rmd)

Easiest to compare by putting these on a grid of manager uncertainty (across) vs true stochasticity (down):

                  | none       | growth   | g+measure   | g+m+implement
-----------       | ---------- | -------- | ----------- | -------------
**none**          |  VS,VI,RD  |   VI     |    VI       | VI
**growth**        |   RD       |   VS     |             | 
**g+measure**     |   RD       |          |    VS       | 
**g+m+implement** |  CU, RD    |   CU     |    CU       | CU, VS



## Cost of bias notes:

Notes pasted in from the knitr output file on github, [Cost of Bias](https://github.com/cboettig/pdg_control/blob/993b05ed46639e6fbd24adf2a5ef18d45397f7fc/inst/examples/cost_of_bias.md), in order that equations display. Code printing supressed to focus on figures, see the knitr source file for the code. Seeing if this makes for more readable notes. This example doesn't match perfectly to the grid.

- Should also  compare deterministic case, growth only noise


- Thought that the deterministic case was giving trouble, but seems to work just fine in the example below.  Examples above had introduced some negligible noise.  


# Calculating the cost of bias  
 * author Carl Boettiger, <cboettig@gmail.com>
 * license: CC0


 * knitr-formatted [source code](https://github.com/cboettig/pdg_control/blob/master/inst/examples/cost_of_bias.Rmd)
 * [Cached data](http://two.ucdavis.edu/cboettig/data/cost_of_bias/)

Implements a numerical version of the SDP described in (Sethi _et. al._ 2005).  Then compute the optimal solution under different forms of uncertainty and compare the results. 





## Model setup 

We will assume a Beverton-Holt state equation / population dynamics function, <div> \\[ f(x,h) = \frac{A x}{1 + B x} \\]</div>



with parameters A = `1.5` and B = `0.05`.  The positive stationary root of the (unharvested) model is given by 
<div>\\[K = \frac{A-1}{B} \\]</div>, 
in this case, K = `10`. 




We also assume a profit function of the form 

<div>\\[ \Pi = p h - \left( c_0  + c_1 \frac{h}{x} \right) \frac{h}{x} \\]</div>,

conditioned on \\( h > x \\) and \\(x > 0 \\), with price p = `1`, c0 = `0.01`, and c1 = `0`.  

We solve the problem on a discrete grid of `100` for stock size and range `0`, `20`.  We use the same set of gridpoints for the possible harvest levels. 


## Scenarios 

We calculate the stochastic transition matrix for the probability of going from any state \\(x_t \\) to any other state <span>\\(x_{t+1}\\)</span> the following year, for each possible choice of harvest \\( h_t \\).  This provides a look-up table for the dynamic programming calculations. In the Sethi case, computing the distribution over multiple sources of noise is actually quite difficult.  Simulation turns out to be more efficient than numerically integrating over each distribution.  We use this matrix to compute the optimum strategy for all possible states of the world by dynamic programming, and then simulate replicates while applying this rule.   


### No Uncertainty 

The first scenario considers the completely deterministic case.  










We simulate 100 replicates of this system.  We will used a fixed seed so that we can compare these replicates to simulations under different conditions.  (Of course the seed is irrelevant at this stage since this is actually deterministic).  



### Growth uncertainty 




The next scenario introduces growth uncertainty into the model, <div> \\[ x_{t+1} = z_g f(x_t) \\] </div>, where `z_g` is lognormal with logmean 0 and logsd of `0.15`.  








As before, we simulate 100 replicates using the same random number sequence, now under this case where the noise in growth is intrinsic and is being accounted for by the management.  




### Growth uncertainty & bias  





This time we consider the same optimization under uncertainty as before, but the simulations introduce bias through a random estimate of the growth rate parameter A, drawn from a normal with mean equal to the true value `1.5` and variance `0.1`.   Since A is a constant multiplier in the growth dynamics, this is equivalent to a random estimate of mean of the noise process `z_g`.  Our estimate of the parameter is drawn from the distribution and then held fixed for that replicate.  Each replicate draws its own value, so average parameter estimate across the replicates should be close to the true value.  _Isn't this equivalent to the standard parameter uncertainty?_





### Unbiased error in growth estimate




We will compare this result to the situation of underestimating the uncertainty in the growth rate, but knowning the parameter exactly.  We use the deterministic optimum solution under a reality that has log-normal growth noise equal to the sum of the variances in the previous example, \\( \sigma_g = \\)  `0.1803`.  







## Summarize and plot the results                                                   





### Plots 

Let's begin by looking at the dynamics of a single replicate. The line shows Reed's S, the level above which the stock should be harvested (where catch should be the difference between stock and S). 

![plot of chunk onerep](http://farm8.staticflickr.com/7225/7212202628_7bb3dd53f8_o.png) 



This plot summarizes the stock dynamics by visualizing the replicates. Reed's S shown again.

![the induced dynamics in the stock size over time, for all replicates, by scenario](http://farm8.staticflickr.com/7212/7212203002_18118a7ae0_o.png) 



![The profits made in each time interval of a single replicate, by scenario](http://farm8.staticflickr.com/7211/7212203360_0aa32ff0ea_o.png) 



![the distribution of profits by scenario](http://farm8.staticflickr.com/7237/7212203732_d1d414beaf_o.png) 


Summary statistics tell the final story:



```
       uncertainty    V1
[1,]         known 33.06
[2,]        Growth 34.34
[3,]          Bias 35.38
[4,] Underestimate 34.92
```



```
       uncertainty    V1
[1,]         known 0.000
[2,]        Growth 3.963
[3,]          Bias 8.680
[4,] Underestimate 4.912
```






# References

Sethi G, Costello C, Fisher A, Hanemann M and Karp L (2005).
"Fishery management under multiple uncertainty." _Journal of
Environmental Economics and Management_, *50*. ISSN 00950696,
<URL: http://dx.doi.org/10.1016/j.jeem.2004.11.005>.




