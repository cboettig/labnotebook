---
layout: post

categories: evolution
title: Generalizing the multi-type OU process- continued
---






 








Efficiency updates:

-   As expected, calculating the last common ancestor on the fly was
    responsible for a significant (\>50%) fraction of the computational
    effort, so it's worth calculating this once for the tree and storing
    the information.
-   Current profiling table:

<!-- -->

     %   cumulative   self              self     total           
    time   seconds   seconds    calls  us/call  us/call  name    
    57.14      0.08     0.08  1604986     0.05     0.05  calc_gamma
    35.71      0.13     0.05   802493     0.06     0.16  calc_var
     7.14      0.14     0.01     1517     6.59     6.59  alloc_tips
     0.00      0.14     0.00   837384     0.00     0.00  node_age
     0.00      0.14     0.00    34891     0.00     0.00  calc_mean
     0.00      0.14     0.00     2025     0.00     0.00  get_lca
     0.00      0.14     0.00     1517     0.00    92.29  calc_lik
     0.00      0.14     0.00     1517     0.00     0.00  log_normal_lik
     0.00      0.14     0.00        1     0.00     0.00  fit_model
     0.00      0.14     0.00        1     0.00     0.00  multimin

-   calc\_gamma doesn't need to be called the *n*^2^ times in calc\_var,
    but could be stored from the calc\_mean computation, so it would be
    called no more than calc\_mean is. This would probably speed up
    calc\_var, since it's a significant fraction of that time, and leave
    alloc\_tips as the most intensive function. Like get\_lca,
    alloc\_tips could be performed once for the entire tree and stored
    in the tree structure. Several other optimizations are quite natural
    but should wait until these primary inefficiencies are dealt with.
    Likewise any parallelization will be best applied at higher level
    (bootstrapping, maybe MCMC steps).

-   Note that we're getting 1517 calls to the likelihood function in
    0.14 seconds; better than 10,000 likelihood calculations a second.

\

\

