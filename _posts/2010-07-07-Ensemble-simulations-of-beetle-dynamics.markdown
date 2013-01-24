---
layout: post
tags: [tribolium]
categories: [ecology]
title: Ensemble simulations of beetle dynamics
---






 








![code Fig
1](http://openwetware.org/images/thumb/1/15/Gamma_beetle_ensemble_ibm.png/300px-Gamma_beetle_ensemble_ibm.png)

![image](/skins/common/images/magnify-clip.png)

[code](http://github.com/cboettig/structured-populations/commit/efdfa0a033b7597824797af8659397a7bf7b4f3b "http://github.com/cboettig/structured-populations/commit/efdfa0a033b7597824797af8659397a7bf7b4f3b")
**Fig 1**

![code Fig
2](http://openwetware.org/images/thumb/d/da/Ibm_compare.png/300px-Ibm_compare.png)

![image](/skins/common/images/magnify-clip.png)

[code](http://github.com/cboettig/structured-populations/commit/efdfa0a033b7597824797af8659397a7bf7b4f3b "http://github.com/cboettig/structured-populations/commit/efdfa0a033b7597824797af8659397a7bf7b4f3b")
**Fig 2**

![code Fig
3](http://openwetware.org/images/thumb/3/30/Stable_nodes.png/300px-Stable_nodes.png)

![image](/skins/common/images/magnify-clip.png)

[code](http://github.com/cboettig/structured-populations/commit/4f2d9ec4a0adf5170436f5ade875da92f39593c1 "http://github.com/cboettig/structured-populations/commit/4f2d9ec4a0adf5170436f5ade875da92f39593c1")
**Fig 3**

Exploring full ensemble simulations of beetle dynamics. Linear noise
approximations (**Fig 2**) show divergent noise under oscillating
conditions (**Fig 2** lower panel), though this may be an artifact of
the approximation, which applies only for finite time calculations.

\
 Note that mean dynamics agree, and oscillations damp out, **Fig 1**
simulation means (circles) fall exactly on predicted lines. Variance
dynamics do not agree. **Fig 1:** plot shows variances from individual
based simulation (invisible in fig 1), which seem to reach stable
values.

\
 **Fig 3** Unfortunately the variance dynamics do not seem to match
between individual simulation and analytic approx for the stable node
solution either, even though the mean dynamics agree. (yellow circles
hard to see, click on image for larger) but fall directly on mean line
but well above variance prediction...) Reason for the disagreement is
unclear, bears further investigation before the Fig 1 conclusion can be
certain.

### Computing implementation

Disabled compiled support of openMP in the simulation. For some reason
when called from R, the code runs the code on each processor with the
same replicate index, in addition to performing all the replicates.
Because I need += to add up all the members in a given class, the second
time through using the same index it continues to increment the value,
getting the wrong number in the process. Disabling openMP from R for the
moment by removing the flags from the Makevars file as a work-around.
