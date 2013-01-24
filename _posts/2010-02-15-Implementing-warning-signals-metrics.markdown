---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Implementing warning signals metrics
---






 








The
[code](http://code.google.com/p/popdyn/source/checkout "http://code.google.com/p/popdyn/source/checkout")
now contains implementation of the basic warning signals metrics
computed over a given window size into the past.

1.  mean
2.  variance
3.  skew
4.  lag-1 autocorrelation
5.  lag-n autocorrelation

These are implemented through the fixed interval sampler function.
Recall that the Gillespie simulation API permits two kinds of events,
random events occurring with exponential time distribution and events
occurring at fixed (scheduled) times, which can be used for
discretizations of deterministic continuous time dynamics (i.e.
Forward/Backward Euler, Runge-Kutta), as well as scheduled events such
as sampling. Just as each random event can have its own rate, fixed
events can occur at different frequencies.

A sample run provided below. Note that the simulation terminates when it
hits extinction, even though this zero point is not necessarily sampled
on the fixed interval. Created using the parameter values and settings
as found in the commit to the svn repository revision 14. The
environmental degradation starts at t=5000, marked by the red line.

![image](http://openwetware.org/images/thumb/3/32/Earlywarning.png/400px-Earlywarning.png)

A python script in the code repository produces this plot. The script in
the original form used to create the plot can also always be found in
revision 14; meanwhile the plotting script can continue to evolve for
later exploration. (Definitely one of the great strengths of version
management!)

### Notes

-   Currently the user sets the size of the window by number of samples
    to store and frequency of sampling, rather than directly entering
    the length of time the window should average over (and the sampling
    frequency). This should be changed and will mean dynamically
    allocating the window block.
-   Many of the metrics can be handed the mean after it is computed,
    currently they recompute the mean. (all metrics are implemented
    through the use of the GSL stats library).
-   We will want to be able to average the metrics over ensembles to
    demonstrate convergence to the theory.
-   API is still embedded in the single file, will need to be
    functionalized further and made into its own library. Need more
    documentation, particularly on the fixed interval sampler.

\

