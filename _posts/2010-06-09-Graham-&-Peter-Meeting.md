---
layout: post
tags: [conference]
categories: evolution
title: Graham & Peter Meeting
---






 








Fantastic meeting with Graham and Peter today, covered a lot of ground.

#### MNV

I briefly sketched the multivariate normal solution for joint
probability across the tree under the regimes model. The original
regimes approach did not take advantage of the fact that the solution to
the joint probability across the tree is multivariate normal given the
painting. This allows the calculation to be partitioned as outlined in
Saturday's entry:

![ P(X | \\vec \\theta, \\mathbb{Q} ) = P(X | C) P(C | \\mathbb{Q} )
](http://openwetware.org/images/math/b/7/d/b7d74172c4b6e8084dc7907ec3dd6300.png)

\

#### Importance Sampling

-   The method I had outlined by reusing the tree library and weighting
    by the probability that the Q matrix generated that tree goes by the
    name *Importance Sampling*, though it ought to have been re-weighted
    by the probability it was produced from the original Q matrix used
    to generate it (Q'), and then averaged. (In my examples (github) I
    generate from the same distribution as a weight from and these
    agree). A brief summary excerpted from Wikipedia:

\

![ \\begin{align} p\_t & {} = {E} [1(X \\ge t)] \\\\ & {} = \\int 1(x
\\ge t) \\frac{f(x)}{f\_\*(x)} f\_\*(x) \\,dx \\\\ & {} = {E\_\*} [1(X
\\ge t) W(X)] \\end{align}
](http://openwetware.org/images/math/3/7/3/373dde81b17f8f8f1d2b77732bbd9ada.png)

where

![W(\\cdot) \\equiv \\frac{f(\\cdot)}{f\_\*(\\cdot)}
](http://openwetware.org/images/math/2/4/0/2406dfcf6682ef40f4c5142f0fceb5b6.png)

is a likelihood ratio and is referred to as the weighting function. The
last equality in the above equation motivates the estimator

![ \\hat p\_t = \\frac{1}{K}\\,\\sum\_{i=1}\^K 1(X\_i \\ge t)
W(X\_i),\\,\\quad \\quad X\_i \\sim
f\_\*](http://openwetware.org/images/math/a/9/d/a9d937b80a14419bcbcd9e73159727ea.png)

This is the importance sampling estimator of
![p\_t\\,](http://openwetware.org/images/math/1/e/4/1e48d42b7f9d92edeb2212f749b47b4a.png)
and is unbiased. That is, the estimation procedure is to generate i.i.d.
samples from
![f\_\*\\,](http://openwetware.org/images/math/4/e/9/4e91b5d2c89ec590d25607953484706c.png)
and for each sample which exceeds
![t\\,](http://openwetware.org/images/math/0/c/6/0c68620ee2ea4f1286fcd672a47ea080.png),
the estimate is incremented by the weight
![W\\,](http://openwetware.org/images/math/2/f/1/2f1e8d5af98f2c9643b0334c73ccc25b.png)
evaluated at the sample value. The results are averaged over
![K\\,](http://openwetware.org/images/math/d/0/e/d0e1b8571128845c03a4cfac00d43b66.png)
trials.

\

-   Unfortunately having to know the ![f\_\*(\\cdot)
    ](http://openwetware.org/images/math/d/5/d/d5dd2924b7a98d52bb15c85b966071e6.png)
    term means that I cannot produce the painting library arbitrarily,
    but will be stuck finding the right painting only with the
    probability that I can simulate it from the prior.

#### MCMC

Partitioning the problem

![ P(X | \\vec \\theta, \\mathbb{Q} ) = P(X | C) P(C | \\mathbb{Q} ) P(
\\mathbb{Q} ) P( \\vec \\theta)
](http://openwetware.org/images/math/f/d/6/fd6dcd9d7346f612450994c84b39a7f5.png)

and proposing paintings directly, we can MCMC over the space of possible
paintings *C*, OU parameters ![ \\vec \\theta
](http://openwetware.org/images/math/1/c/8/1c876a2b07f33c4f32b5f73a9d790a18.png)
and transition matrices ![ \\mathbb{Q}
](http://openwetware.org/images/math/d/4/5/d45a4aa156a8ac07ab80e7d9cf5fa79f.png).
Still, as this problem is hard in the discrete case over
![\\mathbb{Q}](http://openwetware.org/images/math/d/4/5/d45a4aa156a8ac07ab80e7d9cf5fa79f.png)
(BayesTraits), optimizing the MCMC will still be interesting...

-   Discussion of Hastings ratio
-   Discussion of reversible jump

Wainwright Lab Meeting, 4-6pm
-----------------------------

Presented three potential questions to focus on for the Evolution talk:

1.  Defining clusters from raw data, with example in Labrids
2.  Inferring paintings and transition rates directly from data via MCMC
3.  Risks in AIC-based model choice

The group clearly indicated that I should focus on the third, AIC topic,
as it is the furthest along and the most immediate impact to the
audience. Surprising to me as it is also the least biologically driven.
Back to the drawing board now to figure out how to tell this story
clearly and succinctly.

\

