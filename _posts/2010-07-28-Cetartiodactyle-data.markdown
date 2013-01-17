---
layout: post

categories: evolution
title: Cetartiodactyle data
---






 








-   Exploring the cetartiodactyle data (unreleased)
-   Nelder-Mead fails to converge or improve upon the hansen model.
    Likelihood scores differ little:

~~~~ {.de1}
> bm@loglik
[1] -362.6228
> ou1@loglik
[1] -364.9039
> ws1$loglik
[1] -362.7616
> ou2@loglik
[1] -361.6976
> ws2$loglik
[1] -361.2542
~~~~

See [Cetaceans
code](http://github.com/cboettig/wrightscape/blob/8989487c30adbafb6e43ce8b6231722e278f58a5/demos/cetaceans.R "http://github.com/cboettig/wrightscape/blob/8989487c30adbafb6e43ce8b6231722e278f58a5/demos/cetaceans.R").

\

![Fig. 1 The Brownian Motion model is preferred to the OU.1 model
(left). Two separate optima are supported over a single optima
(right).](http://openwetware.org/images/thumb/4/4e/CetaceanModels.png/600px-CetaceanModels.png)

![image](/skins/common/images/magnify-clip.png)

**Fig. 1** The Brownian Motion model is preferred to the OU.1 model
(left). Two separate optima are supported over a single optima (right).

This shows the complementary conclusion to the Labrid data-set -- While
there is support for separate regimes between the cetaceans and
artiodactyles, the differences in likelihood are adequately explained by
differences in the selective optimum location for each regime, and do
not support different strengths of selection (alpha) or different rates
of evolution (sigma). This comparison isn't directly shown through
bootstrap likelihood ratio as it is already clear since the likelihood
score of the two-peak model matches the nested, simpler ou2 model from
ouch/hansen method that only lets optima positions differ.

It is possible this is due to a likelihood ridge frustrating the
algorithm, as the full wrightscape model is seeded using the values from
ou2 for alpha and sigma, though some further exploration with initial
conditions does not seem to bear this out.

Code & algorithm
----------------

-   Nelder-Mead set to 20000 iterations is a bit ambitious, usually
    converges in under 500 or never converges.

\

\

