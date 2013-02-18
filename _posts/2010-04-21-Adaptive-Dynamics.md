---
layout: post
tags: [adaptive-dynamics, open-science]
categories: evolution
title: Adaptive Dynamics
---






 








-   Wrapping up paper on waiting time to branching in adaptive dynamics.
-   Cleaning up code from summer. Now in a local git repository in
    adaptiveDynamics/code
-   Moved ensemble parallelization to higher level, so parallelization
    can be performed in R or C.
-   Adding documentation

### Current status

-   Calculates the waiting time to complete phase 1, phase 2, and phase
    3 successfully from individual-based simulation.

 Phase 1
  ~ Completed when 2 branches exist over threshold
 Phase 2
  ~ Completed when a third population has established over threshold
    exterior to a stable pair
 Phase 3
  ~ Completed when two populations over threshold are separated in
    traitspace by more than finishline units

\

Notes
-----

### Thoughts On Notebook separation

-   Wrapping up the adaptive dynamics project from this summer at IIASA.
    Not really a comparative phylogenetics topic but it's evolution and
    I've got to write it down somewhere, there are advantages and
    disadvantages of maintaining separate notebooks for separate
    projects. Since this is something I've been thinking about lately
    will take a moment to write it down.
    -   **Advantages**: Provides a clearer progression of a single body
        of work. Particularly when two projects are entirely unrelated,
        interleaving them would be very frustrating. A very good
        search/tag/aggregation system would alleviate this. I should
        start using categories
    -   **Disadvantages**: Selecting the division level for notebook. At
        what level does a project become an independent idea? i.e. is
        the stochastic population dynamics in structured populations
        independent of the warning signals work? There's also content
        that isn't directly relevant to one notebook or another. I think
        if I didn't work in two separate labs (Hastings and Wainwright)
        everything would be one notebook.

### backup and local editing

-   Experimenting with
    [mvs](http://search.cpan.org/~markj/WWW-Mediawiki-Client/bin/mvs "http://search.cpan.org/~markj/WWW-Mediawiki-Client/bin/mvs")
    commandline client to download and upload pages to the wiki, as
    [described
    here](http://wiki.freegeek.org/index.php/Www-mediawiki-client "http://wiki.freegeek.org/index.php/Www-mediawiki-client").

\

\

