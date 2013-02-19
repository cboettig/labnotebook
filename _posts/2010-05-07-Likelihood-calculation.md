---
layout: post
tags: [tribolium]
categories: [ecology]
title: Likelihood calculation
---






 








-   Implemented the likelihood calculation in [simulate.R
    code](http://github.com/cboettig/structured-populations/blob/master/R/simulate.R "http://github.com/cboettig/structured-populations/blob/master/R/simulate.R").
-   See [today's revision
    changes](http://github.com/cboettig/structured-populations/commit/786d5bc1fe419c036428e4502cdbe1ea33010e9b "http://github.com/cboettig/structured-populations/commit/786d5bc1fe419c036428e4502cdbe1ea33010e9b")
    via github
-   beetle\_sim() updated to return the full simulation to R.
-   likelihood calculation by simulation done in parallel

~~~~ {.de1}
library(beetles)
sim <- beetle_sim()
L <- likelihood(par=sim$par, X=sim$state[,2:6], Dt = sim$state[2,1]-sim$state[1,1] )
-sum(log(L))
~~~~

Decent estimates of likelihood may be challenging: Modifying default
settings for longer tome series:

~~~~ {.de1}
> sim <- beetle_sim(dt = 7, T = 500)
> L <- likelihood(par=sim$par, X=sim$state[,2:6], dt = sim$state[2,1]-sim$state[1,1], reps=100 )
> L2 <- likelihood(par=sim$par, X=sim$state[,2:6], dt = sim$state[2,1]-sim$state[1,1], reps=100 )
> -sum(log(L2))
[1] 2132.963
> -sum(log(L))
[1] 2033.309
~~~~

... Likelihood estimates differ significantly on same data. Compute
times for the above runs on dual core are \~ minute, on our 8 core
server \~ 10 seconds.

~~~~ {.de1}
> system.time(L <- likelihood(par=sim$par, X=sim$state[,2:6], dt = sim$state[2,1]-sim$state[1,1], reps=100, cpu=8 ))
Explicit sfStop() is missing: stop now.
 
Stopping cluster
 
snowfall 1.83 initialized (using snow 0.3-3): parallel execution on 8 CPUs.
 
Library beetles loaded.
Library beetles loaded in cluster.
 
   user  system elapsed 
  0.020   0.040  10.463
~~~~

\

### Challenges

-   **Initializing simulation:** State-space of the individual based
    model doesn't really reduce to the five-dimensional stages. State is
    actually specified by the continuously valued age of every
    individual, so state space varies as population size fluctuates and
    is quite much larger. Though the age class groupings are intended as
    an approximation to this, there are several possible ways to
    initialize the simulation during each time interval for the
    likelihood calculation. Currently starting all individuals of a
    given age class at the *beginning* of the age class, but might make
    a significant difference if the ages are or aren't synchronized.
-   Still haven't added heterogeneity in age maturity or in cannibalism
    rates.
-   **Non-independence of states**: State-space for the likelihood
    calculation is essentially five-dimensional: at each point in time
    have the population abundance in each of the five age classes (egg,
    immature larva, asymptotic-sized larva, pupae, adults). Of course
    probability of occupancy in each class isn't independent of the
    other classes, so likelihood of the entire distribution of states
    can't be computed directly.
-   **Comparison to LPA model** will have to collapse larval class and
    ignore egg class?

### Code Notes

-   Consider returning log likelihoods directly from kernel density
    estimator for greater speed.

-   Answered a question on
    [gsl-help](http://www.mail-archive.com/help-gsl@gnu.org/msg03168.html "http://www.mail-archive.com/help-gsl@gnu.org/msg03168.html")
    regarding kernel density estimation. Should expand these functions
    to allow for other bandwidth methods, etc.

-   Code needs doxygen documentation.

-   kde library needs .cpp extension, seems that R gets confused mixing
    C and C++ code? Compiles fine by makefile but not by R when
    extensions don't match.

\

