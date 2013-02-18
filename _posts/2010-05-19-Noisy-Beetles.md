---
layout: post
tags: [tribolium]
categories: [ecology]
title: Noisy Beetles
---






 








### Goals

-   individual-based simulation via my gillespie C library with 2-step
    transitions.
    -   Integrate the function definitions from R? Use of R formula
        language?
    -   Conversely, have the R code use the C functions?

-   Handle population-size scaling correctly
-   Methods write-up, read/compare to other examples.
-   Exploration/demonstration of the significance of two-step process vs
    two one-step processes. Highlight which examples will show largest
    differences, and in which terms (means vs variances/covariances,
    etc).
-   Noise response to parameter changes (a la habitat fragmentation,
    etc)

Code Updates
------------

### Merged Warning-Signals into Structured populations

The future development of the structured populations package will depend
directly on the gillespie library source code in warningSignals
repository. Though these two projects will have different higher level
functions as they will share much of the same base C machinery it made
sense at this point to merge the projects. This preserves their
[independent
histories](http://github.com/cboettig/structured-populations/network "http://github.com/cboettig/structured-populations/network")
while avoiding the duplication of code. Will have to figure out whether
or not to close down/remove the warning signals github and local
repositories all together to avoid confusion (would break links to
remove the github version).

Fortunately, this merger is remarkably easy on using git:

~~~~ {.de1}
git fetch ../regime_shifts master:regime_shifts   # imports the entire regime shifts project history as a branch, names it regime_shifts
git merge regime_shifts # Merges that branch onto the current (master) branch
~~~~

### Structural modifications

-   gillespie command must now be passed functional handles to the the
    reset function (needed to reset loop in ensemble ) and the
    fixed\_interval\_tasks function. This makes the dependencies more
    explicit and also allows clean handling of having different models
    with different versions of these functions in the same library. R
    package cannot compile with the redundant namespace otherwise.
-   Still need to figure out what to do about main() function to allow
    modular, independent compiles and still allow R package compile...
-   UPDATE: the R package now compiles and loads. makefile is depricated
    currently and all main functions replaced inside a single main fn
    call. General updates across code (including NAMESPACE).

\

### Other Code Changes and notes

-   Implemented R interface for crowley individual-based model and
    simplified beetle individual-based model with exponential waiting
    times between stages (with two step process though, corresponding to
    the lin noise approx in this system).
-   Recall the extern "C" command when using C++ code to avoid the name
    mangling trouble.
-   seems openmp compiling from within R is working, at least turns both
    processors on full, will need more exploration. Will also have to
    consider storing the full ensemble of runs in C vs calculating
    moments on the fly (and avoiding packet collisions in parallel).

Reading
-------

Set up Google Reader last night for ToCs via rss rather than my former
system of eToCs. Convient tag/like/share options, nice to separate from
the email process.

-   Came across the
    [DensiTree](http://hdl.handle.net/10.1093/bioinformatics/btq110 "doi:10.1093/bioinformatics/btq110")
    paper in bioinformatics to visualize posterior tree densities that
    had been demonstrated in beta @ Phylogenetics workshop.
-   Rather well done if classical treatment of SIS birth death model [in
    JMB](http://hdl.handle.net/10.1007/s00285-010-0336-x "doi:10.1007/s00285-010-0336-x")
    with diffusion approximation, OU approximation and extinction times.
    Seems clearly explained a makes a nice reference.

-   Interesting
    [talk](http://www.youtube.com/watch?v=u6XAPnuFjJc&feature=player_embedded "http://www.youtube.com/watch?v=u6XAPnuFjJc&feature=player_embedded")
    and presentation style, take this approach to the classroom?
    Motivating students? (Talk adapted from [Dan
    Pink](http://www.youtube.com/watch?v=_mG-hhWL_ug&feature=channel "http://www.youtube.com/watch?v=_mG-hhWL_ug&feature=channel")).
-   Another [Richard
    Florida](http://www.youtube.com/watch?v=iLstkIZ5t8g&feature=related "http://www.youtube.com/watch?v=iLstkIZ5t8g&feature=related")
    talk.

\

