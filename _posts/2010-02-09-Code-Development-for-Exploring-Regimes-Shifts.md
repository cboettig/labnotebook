---
layout: post

categories: [ecology]
title: Code Development for Exploring Regimes Shifts
---






 








-   Just [committed
    changes](http://code.google.com/p/popdyn/source/list "http://code.google.com/p/popdyn/source/list")
    to the google project. `warning_signals.c` now provides a fully
    functional, ensemble enabled simulation written with functional API
    for general Gillespie simulations (at last! I've come quite a way in
    my C coding from those early Gillespie simulations for adaptive
    dynamics two years ago). Still need to pull the API out of the
    single file. Doxygen-compatible literate programming included, but
    needs significant expansion before it can really be used effectively
    as an API for other users. Getting there... Meanwhile, on the
    science side:
-   Simulation represents demographic stochasticity in a population
    following dynamics that are capable of the saddle node bifurcation.
    Can add environmental noise, remove demographic stochasticity, and
    allow a slow parameter change that will force the saddle node
    bifurcation either deterministically or stochastically.

Next steps
----------

-   add reporter functions to monitor the classic warning signals, based
    a single replicate (using time-averaging) and on the ensemble.
    -   Variance is the easiest warning signal to implement for both
        cases.
    -   Autocorrelation over a specified window-size
    -   Power spectrum over time window (chance to become familiar with
        GSL's fft, though I have this analysis implemented in some old
        Python all ready.

-   Observer function will need to be able to pass its data up to a
    higher-level language like R. Might be time to learn .Call over .C
    interface...
-   Would be nice to have an R (command-line) and a Python based GUI,
    slider-bar, real-time graphing interface to the simulation to make
    it easy for users to explore how slow changes needed to be, how big
    the autocorrelation window, etc, to detect a warning signal.

### Notebook Reflections

Ok, so that's part vague list of accomplishments, part dense list of
goals. Code development stage doesn't really have simulations to
chronicle with all there parameters and results to plot and show, but
I'll get there. Still figuring out what kind of notes are most useful
for this stage, will be more obvious once things are coded and I can
start exploring preliminary results.
[Comments](mailto:cboettig@gmail.com "mailto:cboettig@gmail.com")
welcome; they can also be added to the talk page or directly to this
notebook. Hope to figure out how to get a comment form bubble to appear
so viewers can leave in-notebook comments without wiki-editing (possibly
without logging in to OWW?). Thoughts on how to do that also
appreciated.

\

\

