---
layout: post

categories: [ecology]
title: Large Intrinsic Noise
---






 








### Modified Crowley model

Realizing *Arbitrarily large demographic noise* systems??

Consider the Crowley model from last week which I'd implemented as an
individual birth-death model: (*x* is the better competitor, *y* the
better colonist)

![ \\begin{align} \\dot x &= b\_1 x (K - x - y) - d\_1 x + c\_1 x y =
\\alpha\_1(x,y) \\\\ \\dot y &= b\_2 y (K - x - y) - d\_1 y - c\_2 x y =
\\beta\_1(x,y) \\end{align}
](http://openwetware.org/images/math/7/5/b/75bbcc817dc349b3e49eee488c36554e.png)

I've implemented the linear noise approximation for this model as a
system of coupled ODEs:

![ \\begin{align} \\frac{d \\langle \\xi\^2 \\rangle}{d t} &= 2
\\frac{\\partial \\alpha\_{1,0}}{\\partial \\phi} \\langle \\xi\^2
\\rangle + 2 \\frac{\\partial \\alpha\_{1,0} }{\\partial \\psi} \\langle
\\xi \\eta \\rangle + \\alpha\_{2,0} \\\\ \\frac{d \\langle \\xi \\eta
\\rangle}{d t} &= \\left( \\frac{\\partial \\alpha\_{1,0}}{\\partial
\\phi} + \\frac{\\partial \\beta\_{1,0} }{\\partial \\psi}
\\right)\\langle \\xi \\eta \\rangle+ \\frac{\\partial \\alpha\_{1,0}
}{\\partial \\psi} \\langle \\eta\^2 \\rangle \\\\ \\frac{d \\langle
\\xi\^2 \\rangle}{d t} &= 2 \\frac{\\partial \\beta\_{1,0}}{\\partial
\\psi} \\langle \\eta\^2 \\rangle + \\beta\_{2,0} \\end{align}
](http://openwetware.org/images/math/b/a/1/ba156d602601209f3d2db74507362626.png)

And solved numerically ([R
code](http://github.com/cboettig/structured-populations/blob/bd1769fef7af9eecf32a5ec40f886bc2b74dd1b9/R/noise_approx.R "http://github.com/cboettig/structured-populations/blob/bd1769fef7af9eecf32a5ec40f886bc2b74dd1b9/R/noise_approx.R"),
links directly to this version and can run stand-alone from the package)
using parameter values matching the individual based simulation ([C
code](http://github.com/cboettig/warningSignals/commit/ddb5d73d011a2eaa7b894e925ffddec74250e043 "http://github.com/cboettig/warningSignals/commit/ddb5d73d011a2eaa7b894e925ffddec74250e043")
from warning\_signals package).

![Image:Diverge.png](http://openwetware.org/images/7/7b/Diverge.png)

As this simulation clearly shows, even though I've started the
population at the expected abundances and the average dynamics are
stable, the variance term for the colonist diverges. With weaker c\_2 it
is easy to have equilibrium variances and have the expected variance of
the competitor be larger than that of the colonist (despite smaller
abundance).

\

