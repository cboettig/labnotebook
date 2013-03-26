---
layout: post
category: ecology
tags: nonparametric-bayes

---


Exploring implementation through `tgp` package MCMC routine and background reading (manual, vignettes, thesis).


Example call:

```r
gp <- bgp(X=X, XX=XX, Z=Z, meanfn="constant", bprior="b0", BTE=c(1000,6000,2), m0r1=TRUE, verb=4, corr="exp", trace=TRUE, s2.p=c(5,10), tau2.p=c(5,10), s2.lam="fixed", tau2.lam="fixed")
```

Verbose return:

```
n=39, d=1, nn=101
BTE=(1000,6000,2), R=1, linburn=0
RNG state RK using rk_seed
preds: data krige
T[alpha,beta,nmin,smin,bmax]=[0,0,10,1,1]
mean function: constant
beta prior: b0 hierarchical
s2[a0,g0]=[5,10]
s2 prior fixed
tau2[a0,g0]=[5,10]
tau2 prior fixed
corr prior: isotropic power
nug[a,b][0,1]=[1,1],[1,1]
nug prior fixed
gamlin=[0,0.2,0.7]
d[a,b][0,1]=[1,20],[10,10]
d prior fixed
```

The parameters in this run are constant across the trace points (because hyperparameters are fixed).  

* `X` is the observed X values (or matrix of appropriate dimension)
* `XX` the desired predicted grid. (will also predict on X)
* `Z` is observed Y values (or matrix of appropriate dimension)
* `m0r1` means scale data to mean zero and unit range
* `bprior` is the prior distribution, defaulting to `bfalt`. `b0` is a Gaussian.  This prior is for the Gaussian process and is not to be confused with the hyperpriors describing the distribution of various parameters.
* `BTE` Burn-in B steps, Terminate after T steps, sample Every E steps. 
* `verb` Very verbose output
* Other options (for adaptive/query learning, etc, igored for now.  Focus on priors).  
* The priors for the hyperparameters are given by `s2.p`, `tau.p` etc (both are Inverse Gammas).  Their parameters can vary hiearchically in general, but we hold them fixed, `s2.lam = 'fixed'`, etc.)




* `s2` is $\sigma^2$ in Gramacy and $\tau$ in Rassmussen and Williams, is the scale of the noise. Comes from an inverse gamma prior.  Set by inverse-gamma parameters `a0` and `g0`.  

* `tau2` Also comes from an inverse gamma prior. It is also set by inverse-gamma parameters `a0` and `g0`.  

$$Z | \beta, \sigma^2, K \sim N_n(\mathbf{F} \beta, \sigma^2 \mathbf{K}) $$
$$ \beta | \sigma^2, \tau^2, \mathbf{W}, \beta_0 ~ N_m(\beta_0, \sigma^2 \tau^2 \mathbf{W} )  $$
$$\beta_0 | N_m(\mathbf{\mu}, \mathbf{B})$$


* We keep the heirachical priors fixed in the `tau.lm`, `s2.lm`, etc. `nug` fixed by default.  Note this results in the the priors from which these are sampled are fixed: e.g. `gp$trace$hier$s2.a0`, `gp$trace$hier$s2.g0`

* `nug.p` This is the "nugget," the measurement error.  Comes from a mixture of gamma prior parameter (initial values) for the nugget parameter `c(a1,g1,a2,g2)` where `g1` and `g2` are scale (`1/rate`) parameters. _Default reduces to simple exponential prior._ Specifying `nug.p = 0` fixes the nugget parameter to the "starting" value in `gd[1]`, i.e., it is excluded from the MCMC


* `index` is the sampling point (from `BTE`, we see we sample starting at step 1000 and ending at step 6000, recording every 2 steps, so there are $(T-B)/E = 2500$ index points).  
* `lambda` possibly a mixing parameter in the importance sampler temperature??
* `beta0` No mention in the manual
* `d` The parameter for priors using the hierachical exponential distribution for the parameters `a1`, `a2`, `g1`, `g2`.  
* `b` ??

* Where are the hyperparameters for the correlation function (e.g. the length-scale for the Gaussian??)  




### Traces 


```r
pars <- melt(gp$trace$XX[[1]], id = "index")
ggplot(pars, aes(index, value)) + geom_line() + facet_wrap(~variable, scales="free_y")
```

![plot of chunk unnamed-chunk-5](/assets/figures/2012-12-04-046b509f8d-unnamed-chunk-5.png) 


It is possible to calculate summary statistics and check out the distribution of these fellows.  


```r
mean(gp$trace$XX[[1]][,"nug"])
```

```
[1] 0.009755
```

```r
ggplot(pars, aes(value)) + geom_histogram() + facet_wrap(~variable, scales="free")
```

![plot of chunk unnamed-chunk-6](/assets/figures/2012-12-04-046b509f8d-unnamed-chunk-6.png) 





## Extracting the estimated process 

(The **MAP**, maximum a posteriori expected mean and variance).

Extract the posterior Gaussian process mean and the $\pm 2$ standard deviations over the predicted grid from the fit:


```r
V <- gp$ZZ.ks2
dat <- data.frame(x   = gp$XX[[1]], 
                 y    = gp$ZZ.km, 
                 ymin = gp$ZZ.km - 1.96 * sqrt(gp$ZZ.ks2), 
                 ymax = gp$ZZ.km + 1.96 * sqrt(gp$ZZ.ks2))
```


Plot the posterior Gaussian Process:


```r
  p1 <- ggplot(dat) +
    geom_ribbon(aes(x=x,y=y, ymin=ymin, ymax=ymax), fill="grey80") + # Var
    geom_line(aes(x=x,y=y), size=1) + #MEAN
    geom_point(data=gp$obs,aes(x=x,y=y)) + 
    labs(title=paste("llik =", prettyNum(gp$llik)))
  if(!is.null(true))
    p1 <- p1 + geom_line(data = true, aes(x, y), col = "red", lty = 2) 
p1 + theme_notebook
```

![plot of chunk gp-plot](/assets/figures/2012-12-04-046b509f8d-gp-plot.png) 




Find the actual optimum policy from the true parametric model


```r
x_grid <- dat$x
h_grid <- x_grid
matrices_true <- f_transition_matrix(f, p, x_grid, h_grid)
opt_true <- find_dp_optim(matrices_true, x_grid, h_grid, 20, 0, profit, delta=.01)
```



Estimate a policy from the Gaussian Process:


```r
rownorm <- function(M) t(apply(M, 1, function(x) x/sum(x)))
matrices_gp <- lapply(h_grid, function(h){
    S <- dat$y - h
    F_ <- t(sapply(1:length(S), function(i){
      if(S[i]>0) {
        out <- dlnorm(x_grid/S[i], 0, V[i])
      } else {
        out <- numeric(length(x_grid))
        out[1] <- 1
        out
      }
    }))
    F_ <- rownorm(F_)
  })
opt_gp <- find_dp_optim(matrices_gp, x_grid, h_grid, 20, 0, profit, delta=.01)
```

and plot 

```r
policies <- melt(data.frame(stock=x_grid, GP = x_grid[opt_gp$D[,1]], Exact = x_grid[opt_true$D[,1]]), id="stock")
policy_plot <- ggplot(policies, aes(stock, stock - value, color=variable)) +
  geom_point() + xlab("stock size") + ylab("escapement") 
policy_plot + theme_notebook
```

![plot of chunk policy_plot](/assets/figures/2012-12-04-046b509f8d-policy_plot.png) 


We can see what happens when we attempt to manage a stock using this:


```r
z_g <- function() rlnorm(1,0, sigma_g)
set.seed(1)
sim_gp <- ForwardSimulate(f, p, x_grid, h_grid, K, opt_gp$D, z_g, profit=profit)
set.seed(1)
sim_true <- ForwardSimulate(f, p, x_grid, h_grid, K, opt_true$D, z_g, profit=profit)
```



```r
df <- data.frame(time = sim_gp$time, stock_gp = sim_gp$fishstock, stock_true = sim_true$fishstock, harvest_gp = sim_gp$harvest, havest_true = sim_true$harvest)
df <- melt(df, id="time")
simplot <- ggplot(df) + geom_line(aes(time,value, color=variable))
simplot + theme_notebook
```

![plot of chunk simplot](/assets/figures/2012-12-04-046b509f8d-simplot.png) 



