---
layout: post
category: ecology
tags: 
- nonparametric-bayes
- code-tricks
---


Remote RStudio configuration (keep forgetting options and ports).  

```bash
ssh -o "ExitOnForwardFailure yes" -f -N -L 1234:localhost:8787 one
```

Initialize runs for sensitivity, looping over parameters and data. See: 

- [sensitivity.md](https://github.com/cboettig/nonparametric-bayes/blob/fd3585230a01afa525f456d13f5f958df4606006/inst/examples/sensitivity.md) (Myers)
- [sensitivity-allen.md](https://github.com/cboettig/nonparametric-bayes/blob/fd3585230a01afa525f456d13f5f958df4606006/inst/examples/sensitivity-allen.md)


Overall: 

```r
ggplot(yields_dat) + geom_density(aes(value)) 
```

![plot of chunk unnamed-chunk-5](http://farm6.staticflickr.com/5455/9387766618_9772fca7e1_o.png) 



Compare over 12 simulation configurations with different parameters and different training data, the GP does consistently well.  Only one case has relatively poor outcomes.  

```r
ggplot(yields_dat) + geom_density(aes(value, color=as.factor(simulation), fill=as.factor(simulation)), alpha=.5)
```

![plot of chunk unnamed-chunk-6](http://farm4.staticflickr.com/3834/9385132341_ea3cffbb8d_o.png) 




- Run data backup to local disk
- NSF expense accounting
- calendar updates 
- software paper policies email
- Luke Arbor reply
- looking at quick way to check out solutions to sums of Fisher wave equation over different diffusion coefficients (heterogenous dispersal rates), e.g. [in C](http://www.os-scientific.org/physics/react/index.html#fisher_kolgomorov_doc)
- Reply to Alex about wave + diffusion type solution pattern.  



```r
f1 <- function(t, y = 4, r = 2, s = 1) (r * dnorm(y, 0, 2 * r * sqrt(t)) + s * 
    dnorm(y, 0, 2 * s * sqrt(t)))/(dnorm(y, 0, 2 * r * sqrt(t)) + dnorm(y, 0, 
    2 * s * sqrt(t)))
curve(f1, 0.01, 8, xlab = "time", ylab = "mean dispersal")
```

![mean dispersal rate declines as slow population arrives](http://farm4.staticflickr.com/3704/9387637650_939dd70f9c_o.png) 


