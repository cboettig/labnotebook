---
layout: post
category: ecology
tags: warning-signals decision-theory

---

Tour of existing files (version stable links)

* [managed warning](https://github.com/cboettig/pdg_control/blob/e6aaf0ba27e4280cbbb04d5ecfeb9b18f158ca77/inst/examples/managed_warning.md) is the current direct test of this, but needs decently ranged input example where detection has a good chance to succeed.  

* [criticaltransition](https://github.com/cboettig/pdg_control/blob/e6aaf0ba27e4280cbbb04d5ecfeb9b18f158ca77/inst/examples/criticaltransition.md) Statistics across replicate crashes that don't show much promise for detection.

* A heuristic implementation in response to the detection of a signal might use a simple rule like a fraction of the optimal harvest of a stable system.  [cautious.md](
) simply shows the economic cost associated with this fractional harvest.


* [resilience_assessment](https://github.com/cboettig/pdg_control/blob/e6aaf0ba27e4280cbbb04d5ecfeb9b18f158ca77/inst/examples/resilience_assessment.Rmd) not run


Also compare to 

* [Stability assessment](https://github.com/cboettig/pdg_control/blob/e6aaf0ba27e4280cbbb04d5ecfeb9b18f158ca77/inst/examples/stability.md), estimating coefficient \\( \alpha \\); surprisingly difficult to distinguish the fished from the unfished by this metric.  
