---
layout: post
tags: [adaptive-dynamics]
categories: evolution
title: Adaptive Dynamics
---






 








-   Modified code phase definitions: phasetime[0] is the first time
    dimorphism is established. Dimorphism may be lost and restablished,
    last (most recent) time it establishes is phasetime[1] (used to be
    phasetime[0]). Other times are still the most recent time at which
    the phase was accomplished.

-   Fiddling with analytic approximations. These shouldn't integrate to
    evaluate at each value, but should be done in a fully discretized
    system. Prototyping in R, the discrete version is probably fast
    enough to handle in scripted code alone.

\

\

