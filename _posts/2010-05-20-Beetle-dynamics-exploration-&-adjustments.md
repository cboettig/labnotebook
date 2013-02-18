---
layout: post
tags: [tribolium]
categories: [ecology]
title: Beetle dynamics exploration & adjustments
---






 








-   Adjusted individual based Crowley model to follow same
    parameterization as the macroscopic model. IBM rules had divided b
    and c by K in the dynamics while the macroscopic was just using
    rescaled dynamical rates. Now both use the rescaled rates as
    parameter values while the equations match.

-   Variation in the Crowley model agrees between individual-based
    simulation and the equations.

### Code troubleshooting

-   openmp private declarations perform allocs without frees! parallel
    code has memory leaks not present in the serial code. Will need to
    learn

\

