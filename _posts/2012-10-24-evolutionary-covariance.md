---
layout: post
category: evolution

---


*Thinking through disparity measures while writing my thoughts in R...*

Load some sample data

```r
library(geiger)
data(geospiza)
dat <- treedata(geospiza$geospiza.tree, geospiza$geospiza.data$wingL)
```

To find the disparity relative to a particular model, we must compute the variance-covariance matrix for that model

```r
X <- dat$data
V_bm <- vcv(dat$phy)
mean_X <- geiger:::phylogMean(V_bm, X)
bm_disparity <- t(X-mean_X) %*% V_bm %*% (X-mean_X)
```

I believe this needs to be scaled by the Brownian rate parameter of the trait, e.g.

```r
bm <- fitContinuous(dat$phy, dat$data)
bm_disparity <- bm[[1]]$beta * bm_disparity
OU would be similar, but transform the tree
```

```r
ou <- fitContinuous(dat$phy, dat$data, model="OU")
alpha <-  ou[[1]]$alpha
V_ou <- vcv(ouTree(dat$phy, alpha))
ou_var <- ou[[1]]$beta/(2*alpha)
X_mean <- phylogMean(V_ou, X)
ou_disparity <- t(X-X_mean) %*% V_ou %*% (X-X_mean) * ou_var
```

There's a few things I'm unsure about off the top of my head in this. I should double-check that `beta` in geiger is the same as $\sigma^2$, and I should double check the ou variance-covariance formula (e.g. compare to the un-numbered equation after equation 5 in Butler & King). I also not sure I quite have the right `X_mean` in the OU case.

