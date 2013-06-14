---
comments: true
date: 2010-11-30 22:56:03
layout: post
slug: tues-fitting-the-limiting-ou-models-to-each-bifurcation
title: 'Tues: Fitting the limiting OU models to each bifurcation'
redirects: [/wordpress/archives/490, /archives/490]
categories:
- ecology
tags:
- derivation
- warning-signals
---

Yesterday I derived the linearized SDEs for the saddle node bifurcation :

$$ dX = 2\sqrt{r(t)} (\sqrt{r(t)} + \theta -X) dt + \sigma \sqrt{\sqrt{r(t)}+\theta} dB_t $$

and the transcritical bifurcation

$$ dX = r(t) (K - X) dt + \sqrt{K} dB_t $$

Now to implement them for fitting by likelihood using generic $ r(t) $.  I go back to the warning() model implemented in sde_likelihood.R code.  We can just solve the odes directly:

```r

	moments <- function(t,y,p){ 
		sqrtR <- sqrt(R(t,pars)) 
		yd1 <- 2*sqrtR*(sqrtR+pars['theta'] - y[1]) 
		yd2 <- -2*sqrtR*y[2] + p["sigma"]^2*(sqrtR+pars['theta'])
		list(c(yd1=yd1, yd2=yd2))
	}

```

See full code in likelihood_bifur_models.R, note the somewhat verbose apply calls simply handle a vector of initial conditions so the likelihood of the whole timeseries can be evaluated in a single function call.  

Of course we can numerically integrate first, for the easier LTC mean:
$$
x\left( t\right) ={e}^{-\int \alpha\left( t\right) dt}\,\left( {e}^{\int \alpha\left( t\right) dt}\,\theta+c\right)
$$

and variance:
$$
x\left( t\right) ={e}^{-\int \alpha\left( t\right) dt}\,\left( {\sigma}^{2}\,\int {e}^{\int \alpha\left( t\right) dt}dt+c\right)
$$

and just finish off the generic integral numerically, though it is unclear whether that will actually be faster than the numerical ode.  For now I'll start with the ode solve approach.



### Writing up Class constructs for these Linearized models


All right, back from a few hours of coding and now have a nice lil [library for Gaussian Processes](https://github.com/cboettig/structured-populations/commit/91619e47e1cbdd65d5a1a5ae44bbaa7dcdc4ea0e#diff-0).  This should be much more efficient then writing out nearly identical functions for probability density, random sampling, likelihood and mle estimation.  Just specify the Gaussian process such as either of the above ([see code](https://github.com/cboettig/structured-populations/commit/91619e47e1cbdd65d5a1a5ae44bbaa7dcdc4ea0e#diff-1)), and voila:



####  Linearized Transcritical Bifurcation example 



```r

> source("../R/likelihood_bifur_models.R")
> source("../R/gaussian_process.R")
> 
> gaussmodel <- setLTC
> 
> pars <- c(Ro=1, m=0, theta=1, sigma=1)
> X <- simulate.gauss(gaussmodel, pars, N=500, T=10)
> start <- c(Ro=.5, m=0, theta=.1, sigma=.1)
> M <- update.gauss(gaussmodel, start, X)
> M$par
       Ro         m     theta     sigma 
 2.788049 -0.280440  1.296090  1.002597 


```

Which returns a nice convergence.  



####  Linearized Saddle Node Bifurcation example 


This model has more trouble with the default maxit, needs more to converge.  Also needs to avoid negative R values since it takes the square root (these produce the warnings).  

```r

> source("../R/likelihood_bifur_models.R")
> source("../R/gaussian_process.R")
> 
> #gaussmodel <- setLTC
> gaussmodel <- setLSN
> 
> pars <- c(Ro=1, m=0, theta=1, sigma=1)
> X <- simulate.gauss(gaussmodel, pars, N=500, T=10)
> start <- c(Ro=.5, m=0, theta=.1, sigma=.1)
>  M <- update.gauss(gaussmodel, start, X, control=list(maxit=1000))
> M$optim_output
$par
        Ro          m      theta      sigma 
2.04075853 0.01060771 0.57580070 1.02352678 

$value
[1] -86.25758

$counts
function gradient 
     641       NA 

$convergence
[1] 0

$message
NULL

```

[Full example code.](https://github.com/cboettig/structured-populations/commit/91619e47e1cbdd65d5a1a5ae44bbaa7dcdc4ea0e#diff-2)



###  "Real" time-series and proper model-choice 


With this machinery in place, can now test against some real timeseries (simulated from the ecological birth-death models, not directly from the linearized SDE), and also do model choice on the changing parameter.  

For speed and efficiency the likelihood function will probably need to moved into C, takes a few minutes for a single maximum-likelihood fit.  


