---
layout: post
category: ecology

---


A quick first exploration of [NIMBLE](http://r-nimble.org) and some questions. 


```r
library("nimble")
library("sde")
```


Let's simulate from a simple OU process: $dX = \alpha (\theta - X) dt + \sigma dB_t$


```r
set.seed(123)
d <- expression(0.5 * (10-x))
s <- expression(1) 
data <- as.data.frame(sde.sim(X0=6,drift=d, sigma=s, T=100, N=400))
```

```
## sigma.x not provided, attempting symbolic derivation.
```

i.e. $\alpha = 0.5$, $\theta = 10$, $\sigma=1$, starting at $X_0 = 6$ and running for 100 time units with a dense sampling of 400 points.


Le't now estimate a Ricker model based upon (set aside closed-form solutions to this estimate for the moment, since we're investigating MCMC behavior here).


```r
code <- modelCode({
      K ~ dunif(0.01, 40.0)
      r ~ dunif(0.01, 20.0)
  sigma ~ dunif(1e-6, 100)

  iQ <- 1 / (sigma * sigma)

  x[1] ~ dunif(0, 10)

  for(t in 1:(N-1)){
    mu[t] <- log(x[t]) + r * (1 - x[t]/K) 
    x[t+1] ~ dlnorm(mu[t], iQ) 
  }
})

constants <- list(N = length(data$x))
inits <- list(K = 6, r = 1, sigma = 1)

Rmodel <- nimbleModel(code=code, constants=constants, data=data, inits=inits)
```


NIMBLE certainly makes for a nice syntax so far.  Here we go now: create MCMC specification and algorithm


```r
mcmcspec <- MCMCspec(Rmodel)
Rmcmc <- buildMCMC(mcmcspec)
```
Note that we can also query some details regarding our specification (set by default)


```r
mcmcspec$getSamplers()
```

```
## [1] RW sampler;   targetNode: K,  adaptive: TRUE,  adaptInterval: 200,  scale: 1
## [2] RW sampler;   targetNode: r,  adaptive: TRUE,  adaptInterval: 200,  scale: 1
## [3] RW sampler;   targetNode: sigma,  adaptive: TRUE,  adaptInterval: 200,  scale: 1
```

```r
mcmcspec$getMonitors()
```

```
## thin = 1: K, r, sigma, x
```


Now we're ready to compile model and MCMC algorithm


```r
Cmodel <- compileNimble(Rmodel)
Cmcmc <- compileNimble(Rmcmc, project = Cmodel)
```

Note we could have specified the `Rmodel` as the "project" (as shown in the example from the Nimble website), but this is more explicit.  Rather convenient way to add to an existing model in this manner.

And Now we can execute the MCMC algorithm in blazing fast C++ and then extract the samples


```r
Cmcmc(10000)
```

```
## NULL
```

```r
samples <- as.data.frame(as.matrix(nfVar(Cmcmc, 'mvSamples')))
```


How do these estimates compare to theory:


```r
mean(samples$K)
```

```
## [1] 10.05681
```

```r
mean(samples$r)
```

```
## [1] 0.180207
```


----------

Some quick impressions: 

- Strange that `Rmodel` call has to be repeated before we can set up a custom MCMC ([nimble docs](http://r-nimble.org/examples)).  How/when was this object altered since it was defined in the above code?  Seems like this could be problematic for interpreting / reproducing results?

- What's going on with `getSamplers()` and `getMonitors()`? Guessing these are in there just to show us what the defaults will be for our model?

- why do we assign `Cmodel` if it seems we don't use it? (the compilation needs to be done but isn't explicitly passed to the next step).  Seems we can use `Cmodel` instead of `Rmodel` in the `Cmcmc <- compileNimble(Rmcmc, project = Cmodel)`, which makes the dependency more explicit, at least that notation is more explicit.  Seems like it should be possiple to omit the first `compileNimble()` and have the second call the `compileNimble` automatically if it gets an object whose class is that of `Rmodel` instead?

- Repeated calls to `Cmcmc` seem not to give the same results.  Are we adding additional mcmc steps by doing this?

- Thinking an `as.data.frame` would be nicer than `as.matrix` in the `nfVar` `mvSamples` coercion.  

- Don't understand what `simulate` does (or why it always returns NULL?). 

