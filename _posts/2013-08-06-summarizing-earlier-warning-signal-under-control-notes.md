---
layout: post
category: ecology
tags: 
- warning-signals
- pdg-control

---

- NSF goals: 
  - combine control methods and warning signals
  - do non-parametric or machine learning increase or decrease chance of transition
  - learning
- Further areas (from comment piece)
- baselines (statistical; emperical)
- context-specific (additional data sources, reflecting context in model)

## Warning signals in managed systems

Management decreases the signal: compare likelihood statistic in [unmanaged_warning](https://github.com/cboettig/pdg_control/blob/master/inst/examples/unmanaged_warning.md) [managed_warning](https://github.com/cboettig/pdg_control/blob/master/inst/examples/managed_warning.md):


![unmanaged](http://farm8.staticflickr.com/7108/7853909166_45ecb1af08_o.png) 


![managed](http://farm9.staticflickr.com/8445/7889665150_d2f03f6f86_o.png) 


## Estimating Stability in managed systems

Recovery rate in optimally fished vs unfished system (based on the OU model): [stability.md](https://github.com/cboettig/pdg_control/blob/e6aaf0ba27e4280cbbb04d5ecfeb9b18f158ca77/inst/examples/stability.md)

![OU parameters over replicates](http://farm8.staticflickr.com/7041/6960365083_4b41dd1f0a_z.jpg) 

- How would a use of a signal feed back into a control algorithm?  Need probabilities of possible models for driving a belief SDP?


## Learning

Learning about a tipping point: models are the correct allee-threshold (Myers) model, and the best-fit Beverton Holt model.  Inability to learn fast enough leads to crashes [model_uncertainty.md](https://github.com/cboettig/pdg_control/blob/ff049e1f623413e1438555aec63ddbe65dec6d8f/inst/examples/model_uncertainty.md)

![](http://farm8.staticflickr.com/7231/7019134197_cb196dbdb1_o.png) 

- Active learning about parameters can be worse than not learning?  


