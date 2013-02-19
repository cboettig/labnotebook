---
comments: true
date: 2011-11-28 09:16:28
layout: post
slug: handling-other-sources-of-noise
title: Handling other sources of noise
redirects: [/wordpress/archives/3398, /archives/3398]
categories:
- ecology
tags:
- pdg-control
---


I'm now computing the optimal solution under three sources of noise (compare with my [earlier examples](http://www.carlboettiger.info/archives/3296) of calculating the optimal solution assuming only growth noise, but simulating dynamics with other noise sources).  See the [statement of problem details](http://www.carlboettiger.info/archives/3313), essentially:


$$ \max_{ \{ q_t \} \leq 0 }  \mathbb{E} \left\{ \sum_0^{\infty} \alpha^t h_t \right\}  $$
s.t. 
Fish population follows: $ x_t = z_t^g f( x_{t-1} - h_{t-1} ) $
and measured stock is given by: $ m_t = z_t^m x_t $
while harvest is: $ h_t = \min (x_t, z_t^i q_t) $
Where $ z^g $ denotes uncertainty in population growth, $ z^m $ denotes uncertainty in measurement for the stock assessment, and $ z^i $ denotes uncertainty in harvest implementation.
$$ m_t = z_t^m z_t^g f\left( x_{t-1} - \min(x_{t-1}, z_{t-1}^i q_{t-1})  \right) $$

 Sethi et al. 2005 (Sethi _et. al._ 2005).  


Properly, this involves integrating over all three probability distributions

$$ \int_x^{x+\Delta} dx \int_0^{\infty}dy \int_0^{\infty} dh\cdot \ln\mathcal{N}(x; \log(f(y,h)) + \mu, \sigma) P_q(h) P_m(y) $$

though as I [noted](http://www.carlboettiger.info/archives/3325), we can ignore integrating over the grid when it is high-resolution, due to the normalization step.  

Still not getting this integral to compute fast enough to do the deterministic calculation of the transition matrix. Meanwhile, I estimate the transition matrix instead by simulating the transition process 999 times.  Not fast, but parallelizes easily. 




##  Comparing variation from noise sources 


Each uses the log-normal distribution with $ \sigma = 0.2$.  Jake points out economists use the uniform distribution to emphasize the impact of noise as a kind of extreme case (since "realistic" modeling of the noise is a fanciful notion anyhow), so I should probably include that as well. Should also allow more analytic work.  



####  Noise in harvest implementation only 



![]( http://farm8.staticflickr.com/7149/6387500545_eb5e518dd4_o.png )




####  Noise in stock assessment only 



![]( http://farm7.staticflickr.com/6232/6387500079_071c824b52_o.png )




#### Noise in population growth only 



![]( http://farm8.staticflickr.com/7013/6387499699_b477b6aa11_o.png )




####  All three sources 



![]( http://farm8.staticflickr.com/7015/6387499095_cf513cf0df_o.png )


## References


- Sethi G, Costello C, Fisher A, Hanemann M and Karp L (2005).
"Fishery Management Under Multiple Uncertainty."
*Journal of Environmental Economics And Management*, **50**.
ISSN 00950696, <a href="http://dx.doi.org/10.1016/j.jeem.2004.11.005">http://dx.doi.org/10.1016/j.jeem.2004.11.005</a>.
