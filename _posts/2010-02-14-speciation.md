---
layout: post
category: evolution
tags:
- adaptive-dynamics

---

**editorial note**: These notes pre-date the formal start of my online
laboratory notebook, [Feb 2 2010: The Lab Notebook Goes Open](http://carlboettiger.info/2010/02/02/The-Lab-Notebook-Goes-Open-.html)
and were adapted from a LaTeX document in which I kept notes on this topic
during my summer at [IIASA](http://www.iiasa.ac.at/).  Lacking a proper notebook then, documents
like this one were updated periodically and occassionally branched into
new ones.  The post date represents the last time the 
LaTeX document was edited in the course of that research. 

--------------------------------------------------------------

Abstract
--------

We show stochastic effects due to finite population sizes can pose a
significant impediment to evolutionary branching. We investigate these
effects by exploring the waiting time until evolutionary branching
occurs using both individual-based simulationand analytic
approximations. The accuracy of our approximation demonstrates that
adaptive branching can be thought of as occurring in four phases: (1)
(2) (3) (4). Different ranges of parameters will make different phases
become rate-limiting. We find that the delicate balance of coexistence
early in evolutionary branching is most often rate-limiting, and provide
a convenient approximation to the waiting time based on this limit.

Evolution demographic stochasticity branching adaptive dynamics

Introduction
============

-   Sympatric speciation and the adaptive dynamics of evolutionary
    branching

-   Previous work on stochasticity in branching
    \citet{Claessen2007a, Claessen2007, Claessen2008, Johansson2006}

-   Summarize results and outline paper

Theory and methods
==================

Model Formulation
-----------------

Paragraph reviewing basics of evolutionary branching,
\citet{Geritz1997}, \citet{Dieckmann1999a}.

### Rosenzweig model of competition for a limiting resource

Paragraph reviewing the competition model

### Individual-based simulation

Paragraph reviewing the individual based model implementation

Four phases of evolutionary branching
-------------------------------------

1.  Convergence the branching point

2.  Invasion of the coexistence region

3.  Coexistence until next invasion

4.  Divergence from the branching point.

Figure 1: with two panels: (a) shows eachs of these phases on the
Pairwise Invasibility Plot. (b) Histograms for each showing the absolute
population abundance at each trait value during each of the phases.

Results
=======

Full Approximation
------------------

Figure 2: Distribution of waiting times from simulation, with full
approximation fit, with rate-limiting approximation from phase 3.

Rate-limiting coexistence until next invasion
---------------------------------------------

Figure 3: Escape from potential energy well approach used to calculate
the coexistence time

Other rate-limiting steps
-------------------------

Figure 4: Conceptual figure showing biological scenario corresponding to
each limit, the resultant approximation, and simulation from that
limiting case.

Discussion
==========

-   What understanding waiting times tells us about the evolutionary
    branching process

-   How quantifying rate limiting steps helps identify the most relevant
    parameters to measure in determining rates of evolutionary
    branching.

-   Extensions of the approach, such as the inclusion of environmental
    variation

Acknowledgements
================

-   IIASA

-   NAS, DoE funding

-   other?


