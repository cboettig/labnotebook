---
comments: true
date: 2012-03-03 22:21:36
layout: post
slug: thursday-friday-saturday
title: Thursday, Friday, Saturday
redirects: [/wordpress/archives/4041, /archives/4041]
categories:
- ecology
tags:
- pdg-control
---



  * forage fish seminar - Patrick and Jay with interesting stuff.  Sounds like compensating benefits due to quality-response (larger fish) and stock effect (easier to find) will be more minor in this fishery, but demand response be compensating.
  * knit hooks
  * externalization example working (based on Reed.R).  Still unsure how I feel about externalization vs fully literate code.  Redundant typing is bad but isn't that why common tasks are functionalized?
  * pmc-0.5 posted to CRAN (use `check --as-cran` in tests)
  * R updated 2.14.2, packages updated.  
  * markdown notes of Reed vs extra noise

## Rules-of-thumb that are not robust

  * [Precautionary.md](https://github.com/cboettig/pdg_control/blob/9ade7cffe7f50b58622062040344c9c1bde3f70f/inst/examples/precautionary.md) considers deriving an optimal policy by assuming that a threshold (in the RickerAllee model) is higher than it really is, which should lead to a conservative policy. This does lead to fewer crashes than the optimal model derived with the correct uncertainty, but, surprisingly, when faced with a higher noise than anticipated, this does not out-perform the optimal model.  

![](http://www.carlboettiger.info/wp-content/uploads/2012/03/wpid-unnamed-chunk-43.png) 

  * This [pattern persists](https://github.com/cboettig/pdg_control/blob/9ade7cffe7f50b58622062040344c9c1bde3f70f/inst/examples/perfect_policy_imperfect_implement.md) in the case where the additional noise comes from the implementation step, rather than as additional growth noise (a conservative estimate of the threshold point doesn't help). 

![](http://www.carlboettiger.info/wp-content/uploads/2012/03/wpid-unnamed-chunk-114.png) 

  * [Overestimating the growth noise](https://github.com/cboettig/pdg_control/blob/9ade7cffe7f50b58622062040344c9c1bde3f70f/inst/examples/ppii_movenoise.md) cannot compensate for underestimating the implementation noise(?)

![](http://www.carlboettiger.info/wp-content/uploads/2012/03/wpid-unnamed-chunk-113.png) 

* A basic example of the [impact of underestimating the growth noise](https://github.com/cboettig/pdg_control/blob/1d993d4eedbd90e51f853a3419ca86e757442848/inst/examples/wrong_noise.md).

![](http://www.carlboettiger.info/wp-content/uploads/2012/03/wpid-winners_losers.png) 


[Progress as told by the commit logs](https://github.com/cboettig/pdg_control/commits/master).

