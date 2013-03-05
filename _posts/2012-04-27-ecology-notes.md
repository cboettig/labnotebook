---
layout: post
title: Project tracking (Ecology)
category: ecology
tags: decision-theory warning-signals 
---



## [pdg-control](https://github.com/cboettig/pdg-control)

 Has become a variety of different directions: 

### [Policy Costs](https://github.com/cboettig/pdg_control/tree/master/inst/examples/policycosts)

* Considering different norms. [L1](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/policycost_L1.md) [L2](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/policycost_L2.md) [Assymetric](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/policycost_asym.md) [fixed](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/policycost_fixed.md)
* When can policy costs pay for themselves? [notes](https://github.com/cboettig/pdg_control/blob/master/inst/examples/policycosts/exact_npv.md)

### Additional Noise

* Starts with [replicating Sethi et al. (2005)](https://github.com/cboettig/pdg_control/blob/master/inst/examples/Sethi.md).
* Consider the performance of various non-optimal solutions, particularly regarding imperfect implementation
* These are losely collected in [Robustness examples](https://github.com/cboettig/pdg_control/tree/master/inst/examples/robustness), needs some evaluation of the most interesting. 

### Approaches to parameter, structural, and state uncertainty

* (Morph of) Training problem II from the working group. 
* [Active adaptive management using grid, model choice example.](https://github.com/cboettig/pdg_control/blob/master/inst/examples/model_uncertainty.md) 
* Add: Myopic Bayes passive adaptive management for model choice
* Compare to: stationary (no learning) solution averaging over models


## [Warning signals](https://github.com/cboettig/earlywarning)

 * Accepted!
 * Copy up on [arxiv](http://arxiv.org/abs/1204.6231). 
 * Streamline code and examples. Began updating functions to work in a more generic manner that is better for connecting in pipelines and swapping between indicators.  Move examples over from wiki to `inst/examples`. 
 * What to do with older repo `warningsignals` vs newer codebase `earlywarning`?
 * Provide a generic early warning signals package? Perhaps Vasilis would be interested in helping?

## Fallacy

 * Write introduction with more basic background on warning signals
 * Touch up discussion, edits.
 * Updated runs from codebase. Heavy computation makes quick replication difficult
 * draft sent to Alan


