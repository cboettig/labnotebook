---
layout: post
tags: [pmc]
categories: evolution
title: Power in trees
---






 








-   Back to Phylogenetics after a week with only population dynamics.

### Exploration

-   data created by brown simulation on the star tree in ouch matches
    the expected variance, σ^2^*t*. This variance is slightly reduced
    when simulated on the Felsenstein tree, as might be intuitively
    expected due to the increased correlations. The degree of decrease
    should be analytically attainable, but isn't obvious to me at the
    moment. Example using functions in felsenstein\_tree.R, revision
    210:

~~~~ {.de1}
> bm <- init_brown_model(star_tree, 5)
> E_trait_var(bm)
[1] 24.52429 
> bm <- init_brown_model(fels_tree, 5)
> E_trait_var(bm)
[1] 17.47615 
> E_trait_var(bm, reps=1000)
[1]  18.65548
~~~~

E\_trait\_var simulates reps replicates under the given model and
computes the variance across the tips of each dataset generated, and
averages this variance across the replicates.

-   Meanwhile, data created by the hansen simulation on the star tree
    falls significantly short of σ^2^ / 2α even when rates are certainly
    high enough to have reached the stationary distribution.

~~~~ {.de1}
> ou <- init_hansen_model(star_tree, alpha=50, sigma=20)
> E_trait_var(ou)
[1] 0.0779675277 
> E_trait_var(ou, 1000)
[1] 0.0800359241 
> # whereas theory would predict
> 20^2/(2*50)
[1] 4
~~~~

not sure why this is. The simulations seems to think the steadystate
variances is σ^2^ / 2α^2^ instead. Using the deprecated function
hansen.dev, I seem to recover the expected variance (averaging variance
over 100 replicates):

~~~~ {.de1}
> deviates <- as.data.frame(hansen.dev(100, star_tree@nodes, star_tree@ancestors, star_tree@times, regimes= NULL, alpha=5,sigma=3, theta=0))
Warning messages:
1: 'hansen.dev' is deprecated.
Use 'simulate' instead.
See help("Deprecated") and help("ouch-deprecated"). 
2: 'is.valid.ouch.tree' is deprecated.
Use 'ouchtree' instead.
See help("Deprecated") and help("ouch-deprecated"). 
> out = sapply(1:100, function(i){var(deviates[i], na.rm=T)} )
> mean(out)
[1] 0.905187
> #which agrees with theory; 3^2/(2*5)
~~~~

\

-   ouch has a convenient function to bootstrap a model

-   ouch hansen trees give false impressions of accuracy around star
    (and hence nearly star) trees, where result is actually very
    sensitive to the original initialized search parameters for alpha
    and sigma.

### Brainstorming

-   Current methods don't permit divergent selection models, for
    instance of parts of the tree. Again probably an information-limited
    arena, but interesting to think what one would do or do differently
    if you had geographic information or range overlaps along the tree
    (or at least for the tips).

