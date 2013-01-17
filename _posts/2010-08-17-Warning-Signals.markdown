---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Warning Signals
---






 








-   Bootstrapping for likelihood ratios!
-   Updated class behavior -- all simulation and fitting routines now
    return timeseries objects as data with correct range and timestep.
-   updated plotting routines. Likelihood ratio plotting function.
    Bootstraps of parameters can be plotted using the output from the
    likelihood ratio fit simulation, avoiding redundancy, just specify
    which model is desired. Bootstrap likelihood ratio plots includes
    the original ratio and calculates plot range using this information.

-   Warning signal model implementation needs to also receive the
    absolute time, and update alpha\_0 as alpha\_0 + beta\*t

\

\

