---
comments: true
date: 2011-03-29 22:45:28
layout: post
slug: tuesday-simulations-appendix
title: Tuesday, simulations & appendix
redirects: [/wordpress/archives/1326, /archives/1326]
categories:
- ecology
tags:
- warning-signals
---

Today mostly working over code sets for examples in appendix, and increasing replicates.  Somehow more trouble than it should be, see [commit history](https://github.com/cboettig/structured-populations/commits/) for today.

ibm_sim.R -- simulate from individual-based dynamics containing a saddle-node bifurcation (fully hysteresis model).

ibm_analysis.R -- run figure1, 2, 3 analysis (correlation test, bootstrap of test, likelihood test) on each data.

ibm_likelihood.R -- shouldn't be needed, all code is in deut_examples.R.  Running now due to earlier parallel instance errors during montecarlotest.  Running now at 2000 replicates on zero at nice 19, and with 80 replicates at nice 10.

deut_likelihood.R -- shouldn't be needed, all code is in deut_examples.R, which I reran today with 2000 replicates. Running this now due to earlier parallel instance errors during montecarlotest. (on one, at nice 19)

Deuterium from Glaciation I & II with 2000 replicates, along with CaCO3 data in appendix.R, calls saved data from above to regenerate plots.




## Misc





	
  * Organizing for Felsenstein's visit

	
  * Wainwright lab meeting: discussion of launching new website, lab blog

	
  * CPB Seminar: Yaniv presenting meiotic drive work, Peter presenting spatial wave in multiple mutations work (Ralph & Coop, Genetics 2010(Ralph & Coop, 2010)).


Need code updates:

	
  * socialR localized save.  Also save code call?

	
  * Still need to track filenames of code, not just commit numbers.



## References


- Ralph P and Coop G (2010).
"Parallel Adaptation: One or Many Waves of Advance of an Advantageous Allele?"
*Genetics*, **186**.
ISSN 0016-6731, <a href="http://dx.doi.org/10.1534/genetics.110.119594">http://dx.doi.org/10.1534/genetics.110.119594</a>.
