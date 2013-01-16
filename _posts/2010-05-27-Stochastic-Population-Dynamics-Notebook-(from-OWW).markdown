---
layout: post
tags: [tribolium, code-tricks]
categories: [ecology]
---





 





Summary of Structured Population noise so far
---------------------------------------------

![](http://openwetware.org/images/thumb/e/eb/Oscillate_noise2.png/180px-Oscillate_noise2.png)

**Fig 1**
[Code](http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R "http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R")
b=5, ue= 0, ul = 0.001, up = 0, ua = 0.01, ae = .13\*k, al = .01\*k, ap
= .15\*k, cle = .2, cap = .1, cae = 5, V=volume

![](http://openwetware.org/images/thumb/6/62/Poisson_noise.png/180px-Poisson_noise.png)

**Fig 2** b=5, ue= 0, ul = 0.001, up = 0, ua = .001, ae = .1\*k, al =
.01\*k, ap = .1\*k, cle = 1, cap = .4, cae = 1, V=volume

### System Size Expansion

-   Analytic calculation captures the noise propagation through the age
    structure correctly. This can lead to much larger estimates of the
    impact of demographic stochastically than previously believed.

-   This covariance mechanism requires coupling through the nonlinear
    terms, otherwise it can simply cancel out. The asymmetric, nonlinear
    term such as in the generalized crowley model seems to be the
    simplest way to produce a large demographic noise effect:

$\partial_i f_i \ll \partial_i f_j$

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
$$ \begin{align} \dot E &= f_E(E,L,A) = -\mu_e E - c_{le} E L -
c_{ae} E A - a_e E + b A \\ \dot L &= f_L(E, L) = -\mu_L L +
a_e E - a_L L \\ \dot P &= f_P(L,P) = -\mu_P P - a_p P + a_L
L\\ \dot A &= f_A(P,A) = -\mu_A A + a_p P \end{align}
$$
\

-   A noisy larval population with stable adult population could be
    driven in the LPA model by weak damping in the larval class ![
    $\partial_L f_L \approx 0$
    relative to a strong covariance term amplifying fluctuations from
    another class, $\partial_j f_L \gg \partial_j f_j$
    As larval dynamics are connected only to egg dynamics and only
    through a_e, this makes the oscillations relatively small.

\

-   The stable adult noise can be driven by strong damping or weak
    coupling $\partial_A f_A(\hat X) \ll 0$

### Comparison to Dennis et al model

which assumes

$d \vec X = f(\vec X) d\vec X + \sqrt{f(\vec X)} d\mathbb{B}_t$

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

