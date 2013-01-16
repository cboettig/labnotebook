---
layout: post
tags: [model-choice]
categories: evolution
---





 





Likelihood Ratio Paper: Power in Trees
--------------------------------------

\

### Power in Trees tests (Results from single OU simulation per alpha, run yesterday)

2000 replicates gives a cleaner picture of the critical alpha, though
with low alpha values the estimates of p are quite variable. Also more
variable on the smaller trees. Even arbitrarily large alpha aren't
significant on the 5-taxa primate tree. On the small geospiza tree (13
taxa) from the geiger package we find:

~~~~ {.de1}
0.5735   0.29  0.704 0.6465  0.993  0.838 0.8605 0.9355  0.782  0.845   0.93 
 "0.1"  "0.2"  "0.3"  "0.4"  "0.5"  "0.6"  "0.7"  "0.8"  "0.9"    "1"    "2" 
 0.945 0.9985  0.958 0.7725 0.9995  0.982  0.949  0.992      1   0.99  0.999 
   "3"    "4"    "5"    "6"    "7"    "8"    "9"   "10"   "20"   "30"   "40" 
0.9895 
  "50"
~~~~

P values on top row, alpha values in quotes below the p value. Notice 9
fails to be significant at 0.95% confidence level, though might as
easily be somewhere around 6. For the Labrid tree with 114 taxa the
pattern is clearer though not perfect:

~~~~ {.de1}
 0.621  0.502 0.9735   0.66 0.5185 0.8075 0.9975 0.9665  0.907  0.997 0.9945 
 "0.1"  "0.2"  "0.3"  "0.4"  "0.5"  "0.6"  "0.7"  "0.8"  "0.9"    "1"    "2" 
     1      1      1      1      1      1      1      1      1      1      1 
   "3"    "4"    "5"    "6"    "7"    "8"    "9"   "10"   "20"   "30"   "40" 
     1 
  "50"
~~~~

Significance clearly sets in between alpha of 0.9 and 1.

Summary:

~~~~ {.de1}
> birds$min_alpha
[1] 10
13 taxa
> primates$min_alpha
[1] 1000
(5 taxa)
> carnivora$min_alpha
[1] 1
260 taxa
> labrids$min_alpha
[1] 1
114 taxa
> carex$min_alpha
[1] 2
53 taxa
>
~~~~

#### reducing the noise in the power estimation

I've just implemented the power test for the smallest alpha that can be
detected at the 95% level using the (whatarewecallingitnow) likelihood
ratio monte carlo approach on a given tree. I try simulating under
successively higher alpha values and then see if the resulting dataset
can be distinguished. In my first implementation, this involves only one
simulation from the OU model at a given alpha, and then the N bootstrap
simulations from the null brownian model per alpha.

Obviously I want more than one simulation from the OU process. It seems
I could (1) simulate under the OU model of a given alpha, (2) fit the BM
model to the resulting data, (3) simulate under that BM model to get the
"bootstrap" data, for which (4) I refit the BM and OU models and compare
the likelihood ratio of these refit models. That sounds pretty
convoluted when I describe it that way, but I think this is the
"natural" thing to do? i.e. steps 2-4 are the bootstrap process which I
normally repeat N times for a single dataset, now instead of using a
single dataset I draw a dataset from the distribution....

\

New approach: multiple simulations from alpha
---------------------------------------------

#### Plots show decreasing power with decreasing alpha

![](http://openwetware.org/images/thumb/e/ec/Power_alpha5.png/180px-Power_alpha5.png)


Anoles data at alpha=25. Red curve is the LR distribution when
simulations come from OU with alpha=25, blue line is LR distribution
when simulations come from BM models fit to those OU-generated data

![](http://openwetware.org/images/thumb/9/9a/Power_alpha1.png/180px-Power_alpha1.png)


Anoles data at alpha=1.

![](http://openwetware.org/images/thumb/7/79/Power_alpha.png/180px-Power_alpha.png)


Anoles data at alpha=0.25.

\
 New procedure:

~~~~ {.de1}
   ## Draw a data sample from the distribution produced by test
    data <- simulate(test, n=nboot)
 
    ## fit the null models to these data -- so we simulate from the appropriate null
    nulls <- lapply(1:nboot, function(i){
            update(null, data[[i]])
    })
    tests <- lapply(1:nboot, function(i){
            update(test, data[[i]])
    })
    t0_dist <- sapply(1:nboot, function(i){
        if(is(tests[[i]], "hansentree")){ t0 <- -2*(nulls[[i]]@loglik - tests[[i]]@loglik) }
        else { t0 <- -2*(nulls[[i]]@loglik - tests[[i]]$loglik) }
    })
 
 
    ## Data come from a distribution of nulls, 
    X <- sapply(1:nboot, function(i){
        simulate(nulls[[i]])
    })
 
    t <- sapply(1:nboot, function(i){
        refit_null <- update(null, X[[i]])
        refit_test <- update(test, X[[i]])
        if(is(refit_test, "hansentree")){ out <- -2*(refit_null@loglik - refit_test@loglik) }
        else { out <- -2*(refit_null@loglik - refit_test$loglik) }
        out
    })
 
 plot(density(out$t), col='blue', lwd=3,xlim=range(c(out$t0_dist,out$t)) )
 lines(density(out$t0_dist), col='red', lwd=3)
~~~~

![](http://openwetware.org/images/thumb/4/4b/Null_LR.png/180px-Null_LR.png)


Null distributions of the LR all lie on top of eachother regardless of
sigma

From these it is possible to estimate the power (see [powertest.R
code](http://github.com/cboettig/Comparative-Phylogenetics/blob/6f6c8d70d342761e508e949f710aced716ddf472/R/powertest.R "http://github.com/cboettig/Comparative-Phylogenetics/blob/6f6c8d70d342761e508e949f710aced716ddf472/R/powertest.R"))

\
 Note that the null distribution (the blue curve) doesn't actually
differ and so doesn't need to be re-simulated with different values.

\

![](http://openwetware.org/images/thumb/c/c1/Anoles_power.png/180px-Anoles_power.png)

anoles power

Meanwhile
---------

-   Finishing the story on model choice in the Anoles dataset.
    Resimulating with extra replicates and including all 5 original
    models.
-   Good news is that 2000 bootstraps on all 6 models against each other
    is quite fast on the 16-processor *zero*, an hour or so. Bad news is
    the ou2 funny painted model isn't bootstrapping the LR correctly,
    though all the other pairs are.
-   Other sorta bad news is that OU\_LP does a handy job at beating all
    other models under Monte Carlo Likelihood Ratio test, so the final
    conclusion doesn't have the punchiness a contradiction would. At
    least the contrived OU2 contradicts this. Should also add the "all
    different" painting to the mix to demonstrate. --Carl Boettiger
    01:24, 27 August 2010 (EDT) Fixed, order of nodes conflicted.



Code updates
------------

--Carl Boettiger 03:26, 27 August 2010 (EDT)

-   Just implemented the fast version of the power test, which avoids
    re-simulating from the Brownian motion null, and handles the
    parallelization with more finesse, and as a single function. Set to
    run examples overnight.

-   Removed the traitmodels support from the power test for the moment,
    until the convergence issues are dealt with. The s3/s4 class
    differences to access elements make this annoying as method
    dependency must be handled explicitly by if statements not
    automatically by class generics. (guess could access by index? --
    Nope, S4 classes aren't subsettable)

#### Updated power curves for trees

Using the faster approach avoiding re-sampling the null distribution for
each alpha, I generate power curves for trees of different sizes and
complexity. The larger, richer trees show more power.

-   [Code for
    method](http://github.com/cboettig/Comparative-Phylogenetics/blob/916ec3622b5b51578c2fe871584f1846b1bddf1f/R/powertest.R "http://github.com/cboettig/Comparative-Phylogenetics/blob/916ec3622b5b51578c2fe871584f1846b1bddf1f/R/powertest.R")
-   [Code for
    example](http://github.com/cboettig/Comparative-Phylogenetics/blob/83e0ecf41603d4f6280f9e497be89c152e661107/demos/power_examples.R "http://github.com/cboettig/Comparative-Phylogenetics/blob/83e0ecf41603d4f6280f9e497be89c152e661107/demos/power_examples.R")

![](data:image/png;base64,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)

\

