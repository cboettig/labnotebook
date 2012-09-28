---
comments: true
date: 2012-02-15 19:40:26
layout: post
slug: getting-signal-from-autocorrelation
title: getting signal from autocorrelation
redirects: [/wordpress/archives/3885, /archives/3885]
categories:
- ecology
tags:
- warning-signals
---

This example goes through the steps to demonstrate that in a sufficiently-frequently sampled timeseries, autocorrelation does contain **some** signal of early warning.  ((Post markdown generated automatically from knitr.))

Run the individual based simulation




```R

require(populationdynamics)

```






[code]
Loading required package: populationdynamics

```







```R

pars = c(Xo = 730, e = 0.5, a = 100, K = 1000, 
    h = 200, i = 0, Da = 0.09, Dt = 0, p = 2)
time = seq(0, 500, length = 500)
sn <- saddle_node_ibm(pars, time)
X <- data.frame(time = time, value = sn$x1)

```




compute the observed value:




```R

require(earlywarning)

```






[code]
Loading required package: earlywarning

```







```R

observed <- warningtrend(X, window_autocorr)

```




fit the models

$ dX = \alpha(\theta - X) dt + \sigma dB_t $

$ dX = \gamma_t (\theta - X) dt + \sigma\sqrt(\gamma_t+\theta) dB_t $




```R

A <- stability_model(X, "OU")
B <- stability_model(X, "LSN")

```




simulate some replicates




```R

reps <- 100
Asim <- simulate(A, reps)
Bsim <- simulate(B, reps)

```




tidy up the data a bit




```R

require(reshape2)

```







```R

Asim <- melt(Asim, id = "time")
Bsim <- melt(Bsim, id = "time")
names(Asim)[2] <- "rep"
names(Bsim)[2] <- "rep"

```




Apply the `warningtrend` `window_autocorr` to each replicate




```R

require(plyr)

```







```R

wsA <- ddply(Asim, "rep", warningtrend, window_autocorr)
wsB <- ddply(Bsim, "rep", warningtrend, window_autocorr)

```




And gather and plot the results




```R

tidy <- melt(data.frame(null = wsA$tau, test = wsB$tau))

```







```R

names(tidy) <- c("simulation", "value")
require(beanplot)

```







```R

beanplot(value ~ simulation, tidy, what = c(0, 
    1, 0, 0))
abline(h = observed, lty = 2)

```




![plot of chunk plot](https://github.com/cboettig/earlywarning/wiki/plot.png)




```R

require(ggplot2)

```







```R

roc <- roc_data(tidy)

```






[code]
Area Under Curve =  0.819680311103255
True positive rate =  0.33 at false positive rate of 0.05

```







```R

ggplot(roc) + geom_line(aes(False.positives, True.positives), 
    lwd = 1)

```




![plot of chunk roc](https://github.com/cboettig/earlywarning/wiki/roc.png)



## Parallelization



Parallel code for the `plyr` command is straight-forward for multicore use,




```R

require(doMC)

```







```R

registerDoMC()
wsA <- ddply(Asim, "rep", warningtrend, window_autocorr, 
    .parallel = TRUE)
wsB <- ddply(Bsim, "rep", warningtrend, window_autocorr, 
    .parallel = TRUE)

```




Which works nicely (other than the progress indicator finishing early).



In principle, this can be [parallelized over MPI](http://stackoverflow.com/questions/5559287/how-do-i-make-dosmp-play-nicely-with-plyr) using 
[an additional function](http://www.numbertheory.nl/2011/11/14/parallelization-using-plyr-loading-objects-and-packages-into-worker-nodes/), seems to work:






```R

library(snow)
library(doSNOW)
source("../createCluster.R")
cl <- createCluster(4, export = ls(), lib = list("earlywarning"))
ws <- ddply(Asim, "rep", warningtrend, window_autocorr, 
    .parallel = TRUE)
stopCluster(cl)
head(ws)

```






[code]
  rep     tau
1  X1  0.7886
2  X2  0.6966
3  X3  0.6543
4  X4  0.5251
5  X5 -0.2859
6  X6 -0.3889

```




