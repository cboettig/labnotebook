---
layout: post
tags: [tribolium, code-tricks]
categories: [ecology]
title: Summary of Structured Population noise so far
---






 








![Fig 1 Code b=5, ue= 0, ul = 0.001, up = 0, ua = 0.01, ae = .13\*k, al
= .01\*k, ap = .15\*k, cle = .2, cap = .1, cae = 5,
V=volume](http://openwetware.org/images/thumb/e/eb/Oscillate_noise2.png/180px-Oscillate_noise2.png)

![image](/skins/common/images/magnify-clip.png)

**Fig 1**
[Code](http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R "http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R")
b=5, ue= 0, ul = 0.001, up = 0, ua = 0.01, ae = .13\*k, al = .01\*k, ap
= .15\*k, cle = .2, cap = .1, cae = 5, V=volume

![Fig 2 b=5, ue= 0, ul = 0.001, up = 0, ua = .001, ae = .1\*k, al =
.01\*k, ap = .1\*k, cle = 1, cap = .4, cae = 1,
V=volume](http://openwetware.org/images/thumb/6/62/Poisson_noise.png/180px-Poisson_noise.png)

![image](/skins/common/images/magnify-clip.png)

**Fig 2** b=5, ue= 0, ul = 0.001, up = 0, ua = .001, ae = .1\*k, al =
.01\*k, ap = .1\*k, cle = 1, cap = .4, cae = 1, V=volume

\

### System Size Expansion

-   Analytic calculation captures the noise propagation through the age
    structure correctly. This can lead to much larger estimates of the
    impact of demographic stochastically than previously believed.

-   This covariance mechanism requires coupling through the nonlinear
    terms, otherwise it can simply cancel out. The asymmetric, nonlinear
    term such as in the generalized crowley model seems to be the
    simplest way to produce a large demographic noise effect:

![ \\partial\_i f\_i \\ll \\partial\_i f\_j
](http://openwetware.org/images/math/e/5/c/e5cdffa3fd231edfaed2a137abdc4797.png)

-   Earlier descriptions have failed to include the connections in the
    noise structure, i.e. from [Dennis et al
    2001](http://www.jstor.org/stable/2657219 "http://www.jstor.org/stable/2657219")
    "that the noise variables are uncorrelated with each other within a
    time unit (off-diagonal elements of the matrix are zero)."

-   Two interesting side-questions have emerged -- the influence of the
    two-step vs one-step transitions and the connections of multiple
    stages.

\

### Status of Noise in LPA Model

-   Macroscopic dynamics

![ \\begin{align} \\dot E &= f\_E(E,L,A) = -\\mu\_e E - c\_{le} E L -
c\_{ae} E A - a\_e E + b A \\\\ \\dot L &= f\_L(E, L) = -\\mu\_L L +
a\_e E - a\_L L \\\\ \\dot P &= f\_P(L,P) = -\\mu\_P P - a\_p P + a\_L
L\\\\ \\dot A &= f\_A(P,A) = -\\mu\_A A + a\_p P \\end{align}
](http://openwetware.org/images/math/1/c/2/1c26a2c6740e377965fa6e85d41e3f33.png)

\

-   A noisy larval population with stable adult population could be
    driven in the LPA model by weak damping in the larval class ![
    \\partial\_L f\_L \\approx 0
    ](http://openwetware.org/images/math/f/8/5/f85e13222f810483cb55eebefa911dc4.png)
    relative to a strong covariance term amplifying fluctuations from
    another class, ![ \\partial\_j f\_L \\gg \\partial\_j f\_j
    ](http://openwetware.org/images/math/a/6/3/a6381f2e34a7d68d6de0c6c63fcd9de9.png).
    As larval dynamics are connected only to egg dynamics and only
    through a\_e, this makes the oscillations relatively small.

\

-   The stable adult noise can be driven by strong damping or weak
    coupling ![ \\partial\_A f\_A(\\hat X) \\ll 0
    ](http://openwetware.org/images/math/9/1/2/9124e1d69db343ffcfdfab9aaac349ae.png)

### Comparison to Dennis et al model

which assumes

![ d \\vec X = f(\\vec X) d\\vec X + \\sqrt{f(\\vec X)} d\\mathbb{B}\_t
](http://openwetware.org/images/math/e/0/b/e0b78e071f7a2db61e77e3721e3dabab.png)

Which underestimates the noise twice over, with no covariance and a
noise based on a pure birth process (difference instead of sum of
rates).

Continuing Beetles Research
---------------------------

-   Sustained oscillations seem to be yielding divergent noise dynamics.
    Fig 1.
-   Identical model in a different parameter regime, noise is
    essentially Poisson, with variances matching means within each
    stage, and no suggestion of the instability seen in the oscillating
    case. Fig 2.
-   Extensions (two-step, phases) and break-downs of the approximation
    (see/discuss with Michael Samoilov and Adam Arkin)

\

Misc
----

embed any webpage in an oww page:

~~~~ {.de1}
<html><iframe height="500px" width="1000px" src="http://two.ucdavis.edu/~cboettig"></iframe></html>
~~~~

\

