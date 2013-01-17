---
layout: post
tags: [tribolium]
categories: [ecology]
title: Rethinking Beetles Noise
---






 








-   Noise in the larval class is damped by ![ \\partial\_L f\_L
    ](http://openwetware.org/images/math/d/0/8/d084393ee59f54a76685ec96a58d5713.png)
    and grows proportional to its intrinsic variation and the
    contribution of other classes through their derivatives of *f*~*L*~,
    that is, ![ \\partial\_E f\_l
    ](http://openwetware.org/images/math/0/8/c/08c6845f4c466dddff7c0cf1d0c9bdd9.png)
    as well as the sum of its intrinsic rates (essentially whichever is
    larger). Taking *E* dynamics to be fast we might reduce to a
    continous time LPA model:

![ \\begin{align} & \\dot L = a\_e \\frac{bA - c\_{ea} A - c\_{el}
L}{a\_e + \\mu\_e} - a\_l - \\mu\_l \\\\ & \\dot P = a\_l L - \\mu\_p P
- a\_p P \\\\ & \\dot A = a\_p P - \\mu\_a A \\end{align}
](http://openwetware.org/images/math/8/8/6/8868897b28c0269a662476f8cdaba956.png)

and the larval fluctuations are essentially:

![ \\begin{align} \\sigma\^2\_L &= \\frac{\\nu + \\beta\_L}{2
\\partial\_L f\_L} \\\\ \\nu &= \\frac{ 2(\\partial\_A f\_L)\^2
\\sigma\_A\^2 }{\\partial\_L f\_L + \\partial\_A f\_A} \\\\ \\partial\_A
L &= \\frac{a\_e (b - c\_{ea} ) }{a\_e + \\mu\_e} \\end{align}
](http://openwetware.org/images/math/0/b/2/0b28c653e98e1add40660bcfa8397dfa.png)

where β~*i*~ is the intrinsic noise of the age class. Hence a class *i*
which propagates large noise to another class *j* has a large ![
\\partial\_i f\_j
](http://openwetware.org/images/math/7/b/e/7be2b5af5d2cc89a7191b64172d0111a.png).
If this term is a linear transition λ*X*~*i*~, then the same term
appears in *f*~*i*~ and hence damps the noise ![ \\sigma\_i\^2
](http://openwetware.org/images/math/8/5/8/858533c45c5df12a7e743e031638f296.png)
and cancels out. Hence noise must propagate into a class through
nonlinear transition rates OR through an asymmetry in the transition
(i.e. the c\_1, c\_2 large noise example in the generalized crowley).

\
 Compare to noise in Eggs:

![ \\sigma\^2\_E = \\frac{ \\frac{ (\\sigma\_L\^2 c\_{el} +\\sigma\_A\^2
c\_{ea} )E\^2 }{\\mu\_A + \\mu\_L + a\_L}+ \\beta\_E/2}{\\mu\_E +
c\_{ea} A + c\_{el} L + a\_e}
](http://openwetware.org/images/math/c/b/4/cb43757c3eeb52669b9771261087ddd2.png)

\

Adding age delay to beetle dynamics
-----------------------------------

Current formulation has used exponential waiting times between stages.
By subdividing the classes (increasing the system dimension size) and
creating single jump within-state transitions, these become
gamma-distributed waiting times. Adding ten steps to each phase and a
little parameter fiddling introduces sustained oscillations.
([Version-stable
code](http://github.com/cboettig/structured-populations/blob/a03864e0e22ae210f784f51988e9eb1812005177/R/gamma_beetles.R "http://github.com/cboettig/structured-populations/blob/a03864e0e22ae210f784f51988e9eb1812005177/R/gamma_beetles.R")).

\

![image](http://openwetware.org/images/e/e1/Age_delay.png)

\
 beetle\_pars <- c(b=5, ue= 0, ul = 0.001, up = 0.00001, ua = 0.01, ae =
1.3, al = .1, ap = 1.5, cle = .2, cap = .1, cae = 5, V=100)

Xo[1] = 100

-   Implementation still needs trouble-shooting, variance dynamics don't
    seem to be being computed correctly. **done**
-   Adult class doesn't need multiple stages. **done**
-   Code should allow for a general k classes rather than a fixed 10
    classes. **done**

and now we have noise in oscillatory, gamma-waiting model:

![image](http://openwetware.org/images/d/d2/Oscillate_noise.png)

-   parameters as before, see [version-stable
    code](http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R "http://github.com/cboettig/structured-populations/blob/0af18d6f4b63ef63ced376f0c73cec16b83c66b5/R/gamma_beetles.R").

\

Misc / Code notes
-----------------

-   R-evolution parallelizes the variance dynamics calculation (perhaps
    the matrix multiplication step?) and is probably responsible for the
    openmp parallelization working.

-   [article](http://arxiv.org/abs/1005.2718# "http://arxiv.org/abs/1005.2718#")
    on cloud computing vs grid. reminds me to include questions on cloud
    computing in the CSGF survey.
-   Should also take a closer read of the recent: Kendall BE, Wittmann
    ME. A stochastic model for annual reproductive success. The American
    naturalist. 2010;175(4):461-8. Available at:
    [http://www.ncbi.nlm.nih.gov/pubmed/20163244](http://www.ncbi.nlm.nih.gov/pubmed/20163244 "http://www.ncbi.nlm.nih.gov/pubmed/20163244").

\

\

