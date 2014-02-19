---
layout: post
category: ecology
tags: 
- multiple-uncertainty
- ropensci

---


EML
===

- bug fixes and replies to various input from community on EML package 

- Thoughts on understanding and using EML in research, including Dryad.  See  https://github.com/ropensci/EML/issues/82#issuecomment-33558301


multiple-uncertainty
======================

#### Jim and Mike meeting

- Why the steps in the optimal solution of the deterministic case?
- Irregularities in value function in first iteration: sometimes not exact ties; actually preferring to fish at almost 0 rather than 0.  
- address range constraints on `h` and `x`.  

### Next steps

- Puzzle out irregular first iteration.  Role of state equation, 
- Interpolation-based inference of optimum, rather than grid
- When can we optimize over the $X_{t+1}$ that maximizes the value and just back out the corresponding harvest?

In the stochastic case, multiple harvests could all realize the $X_{t+1}$
that maximizes the value, though each with different probability.
I do not believe that it holds in general that the h for which it is
most likely to get the optimal $X_{t+1}$ is necessarily the h which
maximizes the value.  Would you agree? (recall we want to maximize the
expectation, so we need to integrate over all outcomes of the harvest,
not consider only the most likely outcome).  I see no alternative to
solving for h directly then?




NCEAS workshop prep
===================

The agenda for the workshop, participant
list, goals and intended outcomes can be found at
https://projects.ecoinformatics.org/ecoinfo/projects/commdyn/wiki/First_Community_Workshop
and is attached.  In preparation for the workshop we would like for
you to:

-  If at all possible, identify and bring a dataset that includes
community data for at least ten points in time at somewhat even intervals.

LTER searches; Bestelmeyer maybe

- Bring ideas for metrics that are meaningful measures of community
change over time.

Early warning signals? Climate change vectors?

-  Develop ecological research questions that may be answered with
the metrics of community change that will be developed/used during the
workshop. Ideally, these synthesis questions span several ecological
systems.

Is this list in reverse sequence? e.g. should develop questions, then
metrics, then identify datasets?


Desired Outcomes

- Repository design requirements for sharing workflows 
- list of community metrics 
- list of data sets 
- list of data transformation operations to get from raw data to analyses 
- list of visualizations 
- research collaborations: Ideas for ecological questions that can be
answered with these data and metrics



Reading 
=======

- _Nature_ on troubled times for the monitoring buoys
used by the TAO early warning system for El Nino events
[10.1038/505585a](http://doi.org/10.1038/505585a)
- Nice pieces on reproducibility in Nature
[10.1038/505612a](http://doi.org/10.1038/505612a) and Science
[10.1126/science.1250475](http://doi.org/10.1126/science.1250475)
recently.

