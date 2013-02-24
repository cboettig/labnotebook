---
layout: post
tags: [pmc, Labrids, code-tricks]
categories: evolution
title: Parallel R
---






 








-   Parallelized LR\_bootstrap\_all() and model\_bootstrap\_all()
    bootstrapping functions. Lets the bootstrapping of different models
    (or LRs between models) to be performed on different machines.
-   Using the *snowfall* package in R for easy parallel computing. The
    parallel loop is done through the sfLapply() function.
-   Had to get libraries and functions exported to all loops using
    sfLibrary() and sfExportAll(). R-sig-hpc mailing list was very
    helpful at getting this up and running at 4am.

#### References for parallel R

-   [Taskview on Parallel on HPC
    R](http://cran.r-project.org/web/views/HighPerformanceComputing.html "http://cran.r-project.org/web/views/HighPerformanceComputing.html")
-   [Snowfall Tutorial
    (vignette)](http://cran.r-project.org/web/packages/snowfall/vignettes/snowfall.pdf "http://cran.r-project.org/web/packages/snowfall/vignettes/snowfall.pdf")
-   [R-sig-hpc mailing
    list](https://stat.ethz.ch/mailman/listinfo/r-sig-hpc "https://stat.ethz.ch/mailman/listinfo/r-sig-hpc")

\

Research
--------

-   Still exploring model comparisons. Trying labrid data with up to 5
    partitions.
-   Attempted partitioning on the Anoles data, but for some reason the
    ape ace() fn for discrete ancestral state reconstruction fails on
    this data (seems to get stuck in an infinite loop). Not obvious why
    this should occur; geiger's fitDiscrete() works fine on the
    partitioned data. Well, was planning on rewriting the ancestral
    state reconstruction in simmap style anyway...

#### Anoles

![image](http://openwetware.org/images/thumb/a/aa/Anoles_lik.png/400px-Anoles_lik.png)
![image](http://openwetware.org/images/thumb/4/47/Anoles_LR.png/400px-Anoles_LR.png)

#### Labrids

![image](http://openwetware.org/images/thumb/1/1b/Labrid_lik.png/400px-Labrid_lik.png)
![image](http://openwetware.org/images/thumb/f/fc/Labrid_LR.png/400px-Labrid_LR.png)

\

-   Seems like the more complicated models continually perform better.
    However, the observed likelihood ratios become less and less likely
    themselves, even against simple models.

-   Recall I simulate the dataset under the model labeled "true" and
    then evaluate the likelihood ratio of that model vs the test model.
    So along a row data is produced by simulation of the same model. The
    pattern is basically that the upper triangle of the matrix (simulate
    simple, compare to complex) always has negative LR for the true data
    but a very positive distribution of LRs. It's still a bit surprising
    to me that when data simulated under the simpler model that the
    simple model should always drastically outperform the complex one in
    LR, but it does.

Misc Notes
----------

Listened to some talks while coding yesterday. Listing here in case I
want to return to them.

-   [Richard
    Florida](http://www.youtube.com/watch?v=khQ9BaXZAjM "http://www.youtube.com/watch?v=khQ9BaXZAjM")
    What's your city? (excellent)
-   [Tony
    Schwartz](http://www.youtube.com/watch?v=tke6X2eME3c "http://www.youtube.com/watch?v=tke6X2eME3c")
    Managing your time managing your energy
-   [David
    Weinberger](http://www.youtube.com/watch?v=43DZEy_J694 "http://www.youtube.com/watch?v=43DZEy_J694")
    Everything is Miscellaneous

\

