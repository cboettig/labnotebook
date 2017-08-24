---
comments: true
date: 2011-02-28 12:08:03
layout: post
slug: warning-signals-on-real-data-continued
title: Warning Signals on Real data continued
redirects: [/wordpress/archives/1135, /archives/1135]
categories:
- ecology
tags:
- warning-signals
---

Continuing my tweaks to code to apply warning signals to the climate data used in (Dakos _et. al._ 2008).  After adjusting my code to deal with variably spaced sampling intervals, I reread the [supplement](http://www.pnas.org/cgi/data/0802430105/DCSupplemental/Supplemental_PDF#nameddest=STXT) -- I had forgotten that they don't actually consider data with variable time-scales, but instead interpolate the curves to have equally spaced sampling intervals.

Obviously this is not ideal.  It is true that the autocorrelation would be impacted by non-equally spaced data, while there is no reason to do so for the variance indicator.  Interpolation will decrease the observed variance (clearly), and increase the autocorrelation.

They also "detrend" the data, which unfortunately must also be somewhat arbitrary and could bias the results.  Certainly for the simulated data there is no reason to detrend the data, since there are no external trends represented (of course this does provide a consistency with the original arbitrary procedure).


> We chose a bandwidth in such a way that we do not overfit while still removing the long-term trends visible in the records.


For the purposes of comparison I'll have to add some code to include this detrending option.


## Code Status: Variable Timescales


Basic code checks for the time-series data seem to imply that everything is working (modulo checking the handling of the negative time values, discussed below). Still troubleshooting the handling of non-ts objects:

This works fine:

    
    
    > const_pars <- c(Ro=5.0, theta=mean(X[,2]), sigma=sd(X[,2]))
    > const_pars
            Ro      theta      sigma 
      5.000000 100.000000   6.591166 
    > Y <- simulateGauss(const_LTC, const_pars, times=seq(1,10,length=200))
    > const <- updateGauss(const_LTC, const_pars, Y, control=list(maxit=1000))
    



as does this:

    
    
    Y <- simulateGauss(const_LTC, const_pars, times=seq(1,40,length=200))
    const <- updateGauss(const_LTC, const_pars, Y, control=list(maxit=100))
    



But this creates warnings but still works: NAs:

    
    
    Y <- simulateGauss(const_LTC, const_pars, times=seq(1,10,length=50))
    const <- updateGauss(const_LTC, const_pars, Y, control=list(maxit=1000))
    warnings()
    Warning Messages: 
    1: In rnorm(n, mean = P$Ex, sd = sqrt(P$Vx)) : NAs produced
    



And this with the real data, errors:


    
    
    > caco3 <- read.table("caco3.txt")
    > caco3 <- data.frame("MYYrs"=-caco3$V1, "CaCO3"=caco3$V2)
    > g_ca <- caco3$MYYrs > -39 & caco3$MYYrs < -32  # Data with collapse (for plot)
    > p_ca <- caco3$MYYrs > -39 & caco3$MYYrs < -34  # Data used in warning signal
    > 
    > X <- data.frame("time"=caco3$MYYrs[p_ca], "data"=caco3$CaCO3[p_ca])
    > 
    > # Rather annoying to have time backwards and negative, lets reverse this.
    > X <- data.frame("time"=rev(X[,1] - min(X[,1])), "data"=rev(X[,2]))
    > 
    > pars <- c(Ro=5.0, m= -.04, theta=mean(X[,2]), sigma=sd(X[,2]))
    > const_pars <- c(Ro=5.0, theta=mean(X[,2]), sigma=sd(X[,2]))
    > const <- updateGauss(const_LTC, const_pars, X, control=list(maxit=1000))
    Error in optim(pars, likfn, method = method, ...) : 
      function cannot be evaluated at initial parameters
    
    Enter a frame number, or 0 to exit   
    
    1: updateGauss(const_LTC, const_pars, X, control = list(maxit = 1000))
    2: gaussian_process.R#79: optim(pars, likfn, method = method, ...)
    




Ah ah!  Real data contains replicate time samples (or unresolved time intervals at least).  These produce -Inf in the call to dc.gauss, so log-likelihood sums to NaN.  

Replicate samples should be averaged out or removed from data-set first.  As usual there's already a [clever little R function](http://stuff.mit.edu/afs/athena.mit.edu/software/r_v2.11.1/lib/R/library/limma/html/avereps.html) in some[ obscure package](http://www.bioconductor.org/packages/2.6/bioc/html/limma.html) to do this:


    
    
    require(limma)
    X <-avereps(X, ID=X[,1])
    



So looks like the entire code will run (data proccessing, formatting, etc).  Now to check convergence:

    
    
    caco3 <- read.table("caco3.txt")
    caco3 <- data.frame("MYYrs"=-caco3$V1, "CaCO3"=caco3$V2)
    g_ca <- caco3$MYYrs > -39 & caco3$MYYrs < -32  # Data with collapse (for plot)
    p_ca <- caco3$MYYrs > -39 & caco3$MYYrs < -34  # Data used in warning signal
    X <- data.frame("time"=caco3$MYYrs[p_ca], "data"=caco3$CaCO3[p_ca])
    # Rather annoying to have time backwards and negative, lets reverse this.
    X <- data.frame("time"=rev(X[,1] - min(X[,1])), "data"=rev(X[,2]))
    ## Also really annoying that there are replicate values, luckily a quick averaging call will remove them. 
    require(limma)
    X <-avereps(X, ID=X[,1])
    pars <- c(Ro=5.0, m= -.04, theta=mean(X[,2]), sigma=sd(X[,2])*5*2)
    const_pars <- c(Ro=5.0, theta=mean(X[,2]), sigma=sd(X[,2])*5*2)
    const <- updateGauss(const_LTC, const_pars, X, control=list(maxit=1000))
    timedep <- updateGauss(timedep_LTC, pars, X, control=list(maxit=1000))
    llik_warning <- 2*(loglik(timedep)-loglik(const))
    




I would also like to add an error-handler for this in setmodel, but as it takes the whole timeseries at once rather than entry by entry the check requires more effort (and seems silly to check the whole series for replicate time entries on each call).  

[Code](https://github.com/cboettig/structured-populations/commit/e3c83d5a3387a7e0b37be75557b220184f0ecd47) also updated to make intelligent estimates of initial parameters for optim() routine (i.e. theta set to data mean, etc).

Results should appear when complete in the gallery below:

[flickr-gallery mode="search" tags="CaCO3" min_upload_date="2011-02-28 00:00:00" max_upload_date="2011-03-02 23:59:59"]




## Data Status


I realized the interpolation problem when breaking the data into the four glaciation periods specified in Table S1 and not having the same number of points as specified.

Times on the data are given as time-before-present, which is actually a bit annoying (would reverse the end and initial conditions, fine for a stationary process, not so much for the warning signal fit!)  Making the quantities negative at least restores the correct ordering of the data.

Some handling of this can be seen in the code above.  


and back to writing...




## References


- Dakos V, Scheffer M, van Nes E, Brovkin V, Petoukhov V and Held H (2008).
"Slowing Down as an Early Warning Signal For Abrupt Climate Change."
*Proceedings of The National Academy of Sciences*, **105**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0802430105">http://dx.doi.org/10.1073/pnas.0802430105</a>.
