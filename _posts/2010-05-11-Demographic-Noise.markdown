---
layout: post
tags: [tribolium]
categories: [ecology]
title: Demographic Noise
---






 








### Crowley Model

-   Exploring the extent to which demographic stochasticity in a key
    class can reverberate through the entire population dynamics.
-   Starting with a simple test case of a modified Crowley model:

![ \\begin{align} \\dot x &= b\_1 x (K - x - y) - d\_1 x + c\_1 x y \\\\
\\dot y &= b\_2 y (K - x - y) - d\_1 y - c\_2 x y \\end{align}
](http://openwetware.org/images/math/7/5/f/75f2b0cfed3d87a63da03d093581eefd.png)

-   Model is implemented on a
    [branch](http://github.com/cboettig/warningSignals/tree/crowley# "http://github.com/cboettig/warningSignals/tree/crowley#")
    of the warningSignals package. Model in
    [crowley.c](http://github.com/cboettig/warningSignals/blob/crowley/src/crowley.c "http://github.com/cboettig/warningSignals/blob/crowley/src/crowley.c"),
    Depends on modified gillespie.c library in this package.
-   Branching necessary as implementation simplifies the gillespie
    function dependencies, but these changes would break compatibility
    with warning\_signals.c and its R functions. Once warning\_signals.c
    is updated to the new interface format I can remerge the branches.
-   compile with *make crowley* for the moment, will add R interface
    soon.
-   Branches need to be pushed to the github server separately, see the
    [github
    directions](http://github.com/guides/push-a-branch-to-github "http://github.com/guides/push-a-branch-to-github"),
    but essentially

<!-- -->

     git push origin branchname

will do the trick.

\

#### Parameters for small class

-   Values: b\_1 = 0.11, b\_2 = 0.6, d\_1 = d\_2 = c\_1 = 0.1, c\_2 = 4,
    K = 10000.
-   Expected sizes: E(x) = 500, E(y) = 4500, (analytic)
-   Variation (from simulation) SD(x) ≈ 120, SD(y) ≈ 1000
-   For K = 1000, means are 1/10th and extinction very common within 500
    time units, and possible in either group. Extinctions of smaller
    population not uncommon for K = 10000 in 5000 time units.
-   Freezing dynamics of x (*i.e.* b\_1 = .00, d\_1 = .00, c\_1 = .00)
    greatly decreases fluctuations in Y (more than an order of
    magnitude, SD(y) ≈ 70).
-   Analytic description should be straight-forward linear noise
    approximation.

\

