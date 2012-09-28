---
comments: true
date: 2012-02-16 19:34:55
layout: post
slug: squiggles
title: Squiggles
redirects: [/wordpress/archives/3863, /archives/3863]
categories:
- ecology
tags:
- warning-signals
---

Variability in the appearance of a trend




```R

nreps <- 64

```







```R

require(populationdynamics)
pars = c(Xo = 730, e = 0.5, a = 100, K = 1000, 
    h = 200, i = 0, Da = 0.09, Dt = 0, p = 2)
time = seq(0, 990, length = 100)
sn <- saddle_node_ibm(pars, time, reps = nreps)

```




We reformat the replicates into long form,




```R

X <- data.frame(time = time, value = sn$x1)
require(reshape)
dat <- melt(X, id = "time")
names(dat)[2] <- "reps"

```







```R

require(plyr)
window <- length(X[["time"]])/2
tmp <- ddply(dat, "reps", function(X) window_autocorr(X$value, 
    windowsize = window))

```




Tidy up the warning signal data




```R

acorr <- melt(t(tmp))
acorr <- acorr[-1, ]
names(acorr) <- c("time", "reps", "value")
acorr$time <- as.numeric(gsub("\\D", "", acorr$time))
class(acorr$value) <- "numeric"

```




and plot the replicate warning signals




```R

require(ggplot2)
ggplot(acorr) + geom_line(aes(time, value)) + 
    facet_wrap(~reps) + opts(title = "Autocorrelation on replicates from a system approaching a crash")

```




![plot of chunk crashautocor](https://github.com/cboettig/earlywarning/wiki/crashautocor.png)



## Stable system



Stable model simulations




```R

pars = c(Xo = 730, e = 0.5, a = 150, K = 1000, 
    h = 200, i = 0, Da = 0, Dt = 0, p = 2)
time = seq(0, 990, length = 100)
sn <- saddle_node_ibm(pars, time, reps = nreps)
X <- data.frame(time = time, value = sn$x1)
stable_dat <- melt(X, id = "time")
names(stable_dat)[2] <- "reps"

```







```R

tmp <- ddply(stable_dat, "reps", function(X) window_autocorr(X$value, 
    windowsize = window))
acorr <- melt(t(tmp))
acorr <- acorr[-1, ]
names(acorr) <- c("time", "reps", "value")
acorr$time <- as.numeric(gsub("\\D", "", acorr$time))
class(acorr$value) <- "numeric"
ggplot(acorr) + geom_line(aes(time, value)) + 
    facet_wrap(~reps) + opts(title = "Autocorrelation on replicates from a stable system")

```




![plot of chunk stableautocor](https://github.com/cboettig/earlywarning/wiki/stableautocor.png)



## Variance pattern





### Replicates approaching a crash






```R

tmp <- ddply(dat, "reps", function(X) window_var(X$value, 
    windowsize = window))
acorr <- melt(t(tmp))
acorr <- acorr[-1, ]
names(acorr) <- c("time", "reps", "value")
acorr$time <- as.numeric(gsub("\\D", "", acorr$time))
class(acorr$value) <- "numeric"
ggplot(acorr) + geom_line(aes(time, value)) + 
    facet_wrap(~reps) + opts(title = "Variance on replicates approaching a crash")

```




![plot of chunk crashvar](https://github.com/cboettig/earlywarning/wiki/crashvar.png)



### Replicates from a stable system






```R

tmp <- ddply(stable_dat, "reps", function(X) window_var(X$value, 
    windowsize = window))
acorr <- melt(t(tmp))
acorr <- acorr[-1, ]
names(acorr) <- c("time", "reps", "value")
acorr$time <- as.numeric(gsub("\\D", "", acorr$time))
class(acorr$value) <- "numeric"
ggplot(acorr) + geom_line(aes(time, value)) + 
    facet_wrap(~reps) + opts(title = "Variance on replicates in a stable system")

```




![plot of chunk stablevar](https://github.com/cboettig/earlywarning/wiki/stablevar.png)

