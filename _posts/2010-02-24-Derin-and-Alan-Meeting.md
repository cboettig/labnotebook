---
layout: post
tags: [warning-signals]
categories: [ecology]
---


1-2pm

-   Discussion of reasons early warning signals fail

1.  Insufficient signal-to-noise ratio for early warning
2.  Ensemble vs time average -- satisfying ergodicity assumption?
3.  Role of bifurcation type. existing literature focuses mostly on 1D
    saddle node.
4.  Role of chaos (certainly frustrates warning signals, but not
    required).

-   How general are warning signals? Normal forms of bifurcations.
    Fitting a good model vs. general warning signals. Problem of
    extrapolation.
-   Classification scheme of warning signals -- TREE paper(?)
-   Mean First passage time from potential

Analytic calculations continued
-------------------------------

### Expected Variance across Ensembles

The expected variance across ensembles can be calculated from the
Fokker-Planck Equation derived from the linear noise approximation. This
should agree with the variance computed over a time window when the
system has reached stationarity. I do these calculations and compare:

Equilibrium population size solves

$$ e n - a = \frac{e K n^2}{n^2+h^2}$$


Equilibrium variance should be given by

$$ \hat \sigma^2 = \frac{d(\hat n)}{b'(\hat n)-d'(\hat n)} =
\frac{e \hat n - a}{ 2 e K \hat n (1 - \frac{\hat n}{\hat n^2 +
h^2}) - e} $$

### Time averaging from simulation doesn't match analytic prediction!

The analytic solution to $\hat n$
is the general solution to a cubic so not very pretty, but easy to
calculate numerically in order to give the variance estimate; using the
values below I confirm that ODE solver and analytic solution above agree
$ \hat \sigma^2 = 1352$,
which is *only about half that computed over the time window (approx
2360)!* Parameter values and solutions from analytics are:


  ------------------ -------
  e                  0.5
  K                  1000
  h                  200
  a                  160
  n                  570.5
  $\hat \sigma^2$    1352
  ----------------   -------

### Test of higher order corrections

I try the higher order correction to the mean dynamics (accounts for
inflation effect of the variance):

\frac{d}{dt} E(n) = \alpha_1(n) + \frac{1}{2} \sigma^2 \alpha_1''(n)

Though not surprisingly, the effect is negligible. In this case the
average is slightly higher (572.5) and variance slightly lower (1349),
so the curvature at equilibrium must be positive (in contrast to the
deflation example with logistic or Levins model). Perhaps this is a
consequence of the ergodicity assumption failing; I'll check against
simply computing ensemble variance rather than the (mean-over-ensembles)
time-averaged variance.

### Ensemble averaging simulation does match theory, though time averaging doesn't

-   Okay, variance computed over ensembles only matches the theory
    (averaging over all time over an ensemble of 1000 I'm getting 1362
    ensemble variance, while the time averaged (over a sampletime of
    100, sample interval of .1, and max time 500) variance averaged over
    ensembles comes out a steady 2339. So much for ergodicity? **Note:**
    these conditions should match the code found in subversion revision
    25.

Reflections on Warning Signals literature
-----------------------------------------

-   Created a separate [Mendeley
    collection](http://www.mendeley.com/collections/1374711/EarlyWarningSigns/ "http://www.mendeley.com/collections/1374711/EarlyWarningSigns/")
    for literature on Early Warning Signals, still very underpopulated.
    Note that my Mendeley library wasn't available online for a couple
    days due to some stupid syncing mistakes I made, but the Mendeley
    support team was fantastic in getting things back in working order
    (Let's just say I may be responsible for the release of 0.9.6.1).
    Note that one can subscribe to this collection as an [rss
    feed](http://www.mendeley.com/collections/rss/1374711/ "http://www.mendeley.com/collections/rss/1374711/").

-   I'm bothered to see the phrase "tipping point" used synonymously
    with bifurcation -- they invoke very different ideas. A tipping
    point such as the maximum angle you can push a canoe before it flips
    is not a bifurcation, it is a perturbation to the state directly
    large enough to push it over the seperatrix, and directly related to
    the first passage time problem in the stochastic models. The
    bifurcations under consideration are changes in a parameter, not the
    state of interest, which destroys a stable point. Phase transitions
    are examples, though often lacking hysteresis.

-   Another annoying quality is the lack of distinguishing bifurcation
    from rare event. If alternate stable states are present, what is the
    probability we would simply jump into them by chance?

-   Detrending before fitting AR(1) model to data is also unjustified.
    Trends influence variance as well!

-   Taking a sliding window size equal to half the size of the available
    time series is arbitrary and unjustified, as it is neither the most
    promising way to detect the trend nor should the window size choice
    depend on such things as knowing the time the crash occurs.

### Current Library

(Also a chance to test Mendeley library embedding)

* * * * *

[Research](http://www.mendeley.com) collected using Mendeley

Subversion Log
--------------

r25 | cboettig | 2010-02-25 00:12:09 -0800 (Thu, 25 Feb 2010) | 1 line

made samplefreq into a double instead of size\_t, still co-opting the
autocorrelations, seems to show successfully a different ensemble vs
time-averaged variance

* * * * *

r24 | cboettig | 2010-02-24 23:46:07 -0800 (Wed, 24 Feb 2010) | 2 lines

co-opted the autoregressive data for the moment to explore direct
ensemble mean and variance (without any time-averaging)

* * * * *

r23 | cboettig | 2010-02-24 21:53:12 -0800 (Wed, 24 Feb 2010) | 2 lines

ode integrator seems to accurately compute mean and variance dynamics,
though the time-averaged variance doesn't seem to agree with the
analytic ensemble variance; will have to compute that directly from
simulation to compare. Runge-Kutta solver on adaptive mesh seems
significantly slower than my simple Euler scheme; particularly with the
(nearly irrelevant) higher order correction to the mean dynamics.

* * * * *

