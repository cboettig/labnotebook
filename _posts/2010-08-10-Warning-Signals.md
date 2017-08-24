---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Warning Signals
---






 








### Alternate models

-   Writing down the change-point model correctly now, starting with the
    simulation. **Done.** Implemented in
    [sde\_likelihood.R](http://github.com/cboettig/structured-populations/blob/959b426292915ebc90222b971f8298870df5c912/R/sde_likelihood.R "http://github.com/cboettig/structured-populations/blob/959b426292915ebc90222b971f8298870df5c912/R/sde_likelihood.R")

-   Implementing Neyman-Pearson comparisons for all three models.

#### Linearizing directly from the saddle node model

Dynamics:

![ \\frac{K e n\^2}{n\^2 + h\^2} - e n - a
](http://openwetware.org/images/math/8/3/1/8313f708bcb8cef91bf83746d04c8941.png)

Slope (alpha) at equilibrium comes from the derivative:

![ \\frac{1}{n} \\left( \\frac{K e n\^2}{n\^2 + h\^2} - e n - a \\right)
-\\frac{2 K e n\^3}{\\left( n\^2 + h\^2 \\right)\^2}
](http://openwetware.org/images/math/f/9/9/f99debdc2a427e17fe5e2c5054996df2.png)

![ \\implies -\\frac{2 K e n\^3}{\\left( n\^2 + h\^2 \\right)\^2}
](http://openwetware.org/images/math/0/4/d/04dd614e5354123085866d3a9dd01000.png)

is the slope evaluated at n equal to equilbrium (which is the root of
some messy cubic).

\

\

