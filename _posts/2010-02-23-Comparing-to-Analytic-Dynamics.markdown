---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Comparing to Analytic Dynamics
---






 








Goal for today: implement analytic calculations for warning signals.

-   10am-12pm

Abstraction/functionalizing code.

-   4pm-7pm

Implement GSL ode solvers for linear noise approximation:

Recall our dynamics are ![ b(n) = \\frac{e K n\^2}{h\^2+n\^2}
](http://openwetware.org/images/math/b/0/f/b0f86bdecd1ecc1882bcbc4a61d7b2e7.png)

*d*(*n*) = *e**n* + *a*

and defining the jump moments (van Kampen) α~1~(*n*) = *b*(*n*) −
*d*(*n*)

α~2~(*n*) = *b*(*n*) + *d*(*n*)

\
 recall that we have a linear Fokker-Planck equation whose solution is
Gaussian and specified by the first two moments: ![ \\frac{d}{dt} E(n) =
\\alpha\_1(n)
](http://openwetware.org/images/math/7/c/f/7cf6568c3252fa68c7b4c28acf3025e0.png)

![ \\frac{d}{dt} \\sigma\^2\_n = 2 \\sigma\_2(n) \\frac{d}{dn}
\\alpha\_1(n) + \\alpha\_2(n)
](http://openwetware.org/images/math/f/4/1/f4149089d99a43125c9d91ceca4d8ea5.png)

-   These are implemented in code using GSL ode library.
-   The variance calculation seems not to agree with the simulated
    results, though no obvious bug. Perhaps I've been too cavalier about
    the scaling above?
-   Will try implementing simpler functions I've tested before to
    confirm.
-   Need to repeat this analysis for the multivariate case where
    parameter *a* changes dynamically at specified rate.
-   Will also consider making *a* change according to stochastic rules,
    adding environmental variability.

\

### svn log

* * * * *

r22 | cboettig | 2010-02-23 23:45:12 -0800 (Tue, 23 Feb 2010) | 1 line

Implemented ode functions solving the linear noise approximation
equations. Mean agrees well, variance calculation seems off.

* * * * *

r21 | cboettig | 2010-02-23 11:39:25 -0800 (Tue, 23 Feb 2010) | 2 lines

gillespie.h and gillespie.c abstraction completed. Documentation should
still explain how to create the necessary functions to run a gillespie
simulation, but is otherwise complete.

* * * * *

r20 | cboettig | 2010-02-23 10:30:03 -0800 (Tue, 23 Feb 2010) | 2 lines

Functionalizing code into seperate files. The main gillespie code has
been broken off into its own file, gillespie.c along with its own
header. To keep the function calls agnostic to the details of the
parameters structure, all the gillespie functions my\_pars is passed as
a void pointer and promoted to a pars pointer inside the function defs.

\

\

