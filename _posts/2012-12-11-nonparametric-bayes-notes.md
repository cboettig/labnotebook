---
layout: post
tags: nonparametric-bayes
categories: ecology

---

* Code `gp_transition_matrix` for generic multi-dimensional case


## Understanding Gaussian Process performance 

If the estimated recruitment dynamics correspond to population dynamics that are non-persistent (might call this non self-sustaining, but in a rather stricter sense than when Reed (1979) introduced that term), and if no reward is offered at the terminal time point for a standing stock (zero scrap value), the GP dictates the rather counter-intuitive practice of simply removing the stock entirely. 

Exploring this by comparing evolution of the probability density for the population size under the transition function. Consider this example from a May1979 model (full run in [may1979-example.md]()): The Gaussian process infers a rather pessemistic evolution of the probabilty density (grey distribution becomes black distribution when unharvested, 20 years (OptTime)): 

#### GP transition function

![plot of chunk gp-F-sim](/assets/figures/2012-12-15-a3aad15b15-gp-F-sim.png) 


Whereas the actual transition function moves the stock to a tight window around the high carrying capacity:

#### true transition function

![plot of chunk par-F-sim](/assets/figures/2012-12-15-a3aad15b15-par-F-sim.png) 


Often this results in a policy function that harvests all the fish, since they won't persist.  Exploring approaches to avoid such solutions, such as adding a reward for leaving some standing stock at the boundary time (issue [#10](https://github.com/cboettig/nonparametric-bayes/issues/10)).

## Multi-species examples (issue [#7](https://github.com/cboettig/nonparametric-bayes/issues/7))

[multidimensional.md](https://github.com/cboettig/nonparametric-bayes/blob/b5b1d3300497399fb364a40c9f4523203944702d/inst/examples/multidimensional.md)


## Fragility of parametric rigidity examples

* infer under BH and simulate under allee
* Infer ricker, simulate under BH
* Other examples?


## MCMC

Examples of controlling priors, resulting posteriors. [See yesterday's notes for details](http://www.carlboettiger.info/2012/12/10/prior-distributions-for-tgp-mcmc.html)


## additional R software support

Have been focusing recently on the MCMC implementation for treed Gaussian Processes, provided in the [`tgp`](http://cran.r-project.org/web/packages/tgp) package. 


Lots of various implementations of Gaussian Proccesses in R in [geospatial stats packages](http://cran.r-project.org/web/views/Spatial.html) (e.g. Kriging implementations) including some the offer fully heirachical Bayesian approaches with a variety of twists:



* [`psgp`](http://cran.r-project.org/web/packages/psgp/index.html) Projected Spatial Gaussian Process (psgp) methods, Implements projected sparse Gaussian process kriging for the intamap package
* [`gstat`](http://cran.r-project.org/web/packages/gstat/)
* [`geoR`](http://cran.r-project.org/web/packages/geoR/) 
* [`spBayes`](http://cran.r-project.org/web/packages/spBayes/index.html) spBayes fits univariate and multivariate spatial models with Markov chain Monte Carlo (MCMC).
* [`ramps`](http://cran.r-project.org/web/packages/ramps/index.html) Bayesian geostatistical modeling of Gaussian processes using a reparameterized and marginalized posterior sampling (RAMPS) algorithm designed to lower autocorrelation in MCMC samples. Package performance is tuned for large spatial datasets.


## From the commit log...

- another example (includes some data in the higher range) #7 [06:49 pm 2012/12/11](https://github.com/cboettig/nonparametric-bayes/commit/b5b1d3300497399fb364a40c9f4523203944702d)
- a simple multi-demensional example (no policy function yet) #7 [06:43 pm 2012/12/11](https://github.com/cboettig/nonparametric-bayes/commit/b74ccc45667d4e20790acca3c5947d9a23fc5e95)
- updated notes on mcmc approach #6 [03:51 pm 2012/12/11](https://github.com/cboettig/nonparametric-bayes/commit/19bbd1028b702ab9243cb525e3a8b441324408c7)
- transition matrix method for GP takes Ef, Cf explicitly now. [03:50 pm 2012/12/11](https://github.com/cboettig/nonparametric-bayes/commit/49cea150618907f48b058e45bbbc01a43c44f8c5)
- GP that results in scorched earth fishing strategy [02:19 pm 2012/12/11](https://github.com/cboettig/nonparametric-bayes/commit/6fc937211b6c5381b46dc0e8ffff6092545d7519)




