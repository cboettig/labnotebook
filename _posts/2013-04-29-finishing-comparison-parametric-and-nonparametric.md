---
layout: post
category: ecology
tags:
- nonparametric-bayes

---


Implemented in [BUGS/allen.md](https://github.com/cboettig/nonparametric-bayes/blob/75df9413c016480f935867d88345ddaa36d07a82/inst/examples/BUGS/allen.md)

* [x] Inverse gamma priors on variances [36888da](https://github.com/cboettig/nonparametric-bayes/commit/36888da01d7e36e58fc15c671e858be6fcf8a02d)
* [x] Uniform prior on standard deviations [75df941](https://github.com/cboettig/nonparametric-bayes/commit/75df9413c016480f935867d88345ddaa36d07a82)
* [x] Mean plot for parametric fit [75df941](https://github.com/cboettig/nonparametric-bayes/commit/75df9413c016480f935867d88345ddaa36d07a82)
* [x] Convergence diagnostics for both parametric and nonparametric MCMC, using similar visual layout [75df941](https://github.com/cboettig/nonparametric-bayes/commit/75df9413c016480f935867d88345ddaa36d07a82)


* Oh, Jeromy Anglim has a rather nice collection of [jags links](http://jeromyanglim.blogspot.com/2012/04/getting-started-with-jags-rjags-and.html)

## On Variance Priors for the Parametric MCMC 

* Gelman recommends uniform priors on standard deviations for the noise terms: in the `.bugs` file we have

```
stdQ ~ dunif(0,100)
stdR ~ dunif(0,100)
# as "precision" tau instead of stdev sigma
iQ <- 1/(stdQ*stdQ);
iR <- 1/(stdR*stdR);
```

Where these enter the model as


```
for(t in 1:(N-1)){
    mu[t] <- x[t] + exp(r0 * (1 - x[t]/K)* (x[t] - theta) )
      x[t+1] ~ dnorm(mu[t],iQ)
}


for(t in 1:(N)){
    y[t] ~ dnorm(x[t],iR)
}
```

Note that `dnorm` in JAGS notation is defined in terms of the mean and the precision (reciprocal of the variance), rather than standard deviation (e.g. in R's `dnorm` function), see the [JAGS manual](http://ftp.iinet.net.au/pub/FreeBSD/distfiles/mcmc-jags/jags_user_manual.pdf), particularly Table 6.1 pg 29, below.  Note that the standard deviation has the uniform prior, not the precision.   

* Also try inverse gamma priors, 

```
iQ ~ dgamma(0.0001,0.0001)
iR ~ dgamma(0.0001,0.0001)
```

(Precision is Gamma distributed when the variances are inverse-gamma distributed.  


* Both are quite uniformative, results appear quite comparable. 


![](http://farm9.staticflickr.com/8119/8692697741_fa2dfb83b1_o.png)

## Markov Chain Monte Carlo Convergence Analysis

* Add for both parametric and non-parametric cases
* Extra long runs before finalizing analysis
* Some [examples](http://www.people.fas.harvard.edu/~plam/teaching/methods/convergence/convergence_print.pdf) with R code 

A variety of tools from `coda` package.  Of course these methods are designed from toy problems and cannot guarentee convergence.  

1. Traceplots, density plots
1. Running mean, autocorrelation plots `autocorr.plot`
1. Metropolis acceptance/rejection rate `rejectionRate` 
1. Multiple chain diagonostics: Gelman-Rubin `gelman.diag`, `gelman.plot`
1. Geweke (compare means between different sections) `geweke.diag`
1. Raferty-Lewis `raferty.diag`
1. Heidelberg and Welch `heidel.diag`

