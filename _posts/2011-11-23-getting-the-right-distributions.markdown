---
comments: true
date: 2011-11-23 15:43:27
layout: post
slug: getting-the-right-distributions
title: Getting the right distributions
redirects: [/wordpress/archives/3325, /archives/3325]
categories:
- ecology
tags:
- pdg-control
---

Determining the stochastic transition matrix is the essential computational step of SDP solution.  If stochasticity enters only in the growth process: 

$$x_{t+1} = z_t f(x_t) $$

where $z_t$ is a draw from a log-normal density distribution function $ \log \mathcal{N} (x; \mu, \sigma) $, then the probability that $x_{t+1}$ falls within a bin $ [x_i-\Delta,x_i+\Delta] $ given that at it is currently at $x_t = y$ is

$$ P([x_i-\Delta,x_i+\Delta] |y) = \int_{x-\Delta}^{x+\Delta} \log \mathcal{N}(x; \log(f(y)) + \mu, \sigma) dx$$

Note that we are discritizing the transition matrix to a grid of values $ x_i $ at time $t$ to $ x_j$ at time $t+1$, hence the binning question, where $ \Delta $ is half the grid bin width.  

Another note: Let us assume z_t is mean unity; only logical for the growth equation.  In the case of the log-normal, the parameter $ \mu $ is the log mean, thus:  $ z_t =  \ln \mathcal{N} (x; \log(1) - \sigma^2/2, \sigma) $.   



###  Computational implementation / comparison 



 On a fine grid, this seems to be the same as just evaluating the density at the midpoint and normalizing. 

For instance, we could integrate following the definition above: 

```R

bw <- (x_grid[2] - x_grid[1]) / 2 # we'll go from the midpoint
F <- function(x) dlnorm(x, log(f(y,h,p)) - sigma_g ^ 2 / 2, sigma_g)
Prob <- sapply(x_grid, function(x) integrate(F, x - bw, x + bw)[[1]] )
Prob/sum(Prob)

```


which seems to get us the same thing as evaluating the density directly at the midpoint:


```R

Prob <- sapply(x_grid, dlnorm(x, log(f(y)) - sigma^2/2, sigma))
Prob/sum(Prob)

```

Note also that because we're normalizing, we could just as easily rescaled the state by the mean, 

```R

dlnorm(x/f(y), log(1) - sigma^2/2, sigma)

```


See [this example code](https://github.com/cboettig/pdg_control/blob/43cb4839d91f6ea310678289dbf6368739f131e3/R/SDP/unit_tests.R) (requires my[ stochastic_dynamic_programming.R ](https://github.com/cboettig/pdg_control/blob/ae2bb58ca29339d81e815e032bdffa9f17391b3f/R/SDP/stochastic_dynamic_programming.R)functions), distributions agree pretty exactly (red and blue distributions overlap exactly to look purple):

![]( http://farm8.staticflickr.com/7002/6391815985_360cf7c40f_o.png )




###  Adding additional sources of uncertainty 



In the above, next year's population is uncertain but this year's is known perfectly.  Imagine the current value of the stock $x_t $, is a random deviate from the value we measured $m_t$, given by the probability density $ P_m(x_t) $, and the harvest level will be a random variate around whatever level we set for the quota, given from the distribution P_q(h).  Both of these introduce uncertainty into the expected value of stock next year, $f(x_t,h_t)$:

$$ P([x_i,x_i+\Delta] |m_t, q_t) = $$
$$  \int_x^{x+\Delta} dx  \int_0^{\infty}dy \int_0^{\infty} dh\cdot \ln\mathcal{N}(x; \log(f(y,h)) + \mu, \sigma) P_q(h) P_m(y) $$


Looks like this is gonna be un-pretty.  Cubature R package is supposed to handle these higher-dimensional integrals quickly, but no luck.  Computation for even a single integral is very slow:


```R

require(cubature)
pdf_zg <- function(x, expected) dlnorm(x, log(expected)-sigma_g^2/2, sigma_g)
pdf_zm <- function(x) dlnorm(x, log(1)-sigma_m^2/2, sigma_m)
pdf_zi <- function(x,q) dlnorm(x, log(q)-sigma_i^2/2, sigma_i)
F <- function(x) pdf_zg(x[1], f(x[2],x[3],p))*pdf_zm(x[2])*pdf_zi(x[3], q)
adaptIntegrate(F, c(x_grid[i]-bw,0,0), c(x_grid[i]+bw, x_grid[gridsize], h_grid[gridsize]))

```


(See full example as [unit_test2](https://github.com/cboettig/pdg_control/blob/c6d77e639b9fe4dd575e0b276568815b9b4767ee/R/SDP/unit_test2.R))
