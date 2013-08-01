---
published: false
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

Initialize runs for sensitivity, looping over parameters and data.  

- sensitivity.md
- sensitivity-allen.md




- Run data backup to local disk
- NSF expense accounting
- calendar updates 
- software paper policies email
- Luke Arbor reply
- looking at quick way to check out solutions to sums of Fisher wave equation over different diffusion coefficients (heterogenous dispersal rates), e.g. [in C] (http://www.os-scientific.org/physics/react/index.html#fisher_kolgomorov_doc)
- Reply to Alex about wave + diffusion type solution pattern.  






```r
f1 <- function(t, y = 4, r = 2, s = 1) (r * dnorm(y, 0, 2 * r * sqrt(t)) + s * 
    dnorm(y, 0, 2 * s * sqrt(t)))/(dnorm(y, 0, 2 * r * sqrt(t)) + dnorm(y, 0, 
    2 * s * sqrt(t)))
curve(f1, 0.01, 8, xlab = "time", ylab = "mean dispersal")
```

![mean dispersal rate declines as slow population arrives](http://farm4.staticflickr.com/3704/9387637650_939dd70f9c_o.png) 


