---
comments: true
date: 2011-06-01 15:10:56
layout: post
slug: warning-signals-literature-when-stats-are-and-arent-attempted
title: 'Warning Signals Literature: when stats are and aren''t attempted'
categories:
- ecology
tags:
- warning-signals
- delayed-release
---

In preparing manuscript on warning signals, reviewing the literature on when statistical validation of the warning signal is included, and if so, what kind are done.  There's certainly no consensus in the approach, with the majority of papers not even attempting a method (and those that do not finding significance).  Scheffer's key review (Scheffer _et. al._ 2009) calls for the need to measure statistical significance of warning signals,

> Therefore, it would be useful to build a set of reliable statistical procedures to test whether an increase in autocorrelation, for example, is significant.


doesn't report statistical significance on any of the examples presented.  This is certainly true of many of the most cited papers in the field:


#### most warning signals literature ignores the question of significance:

	
* Carpenter's paper "introducing" variance as a warning statistic (Carpenter & Brock, 2006) (model only) ((uses an annual window rather than sliding window))
* van Nes et al. Am Nat paper (van Nes & Scheffer, 2007), introducing CSD as a warning signal ((though citing earlier introduction to concept in Rietkerk et al. 1996; Gandhi et al. 1998 (Gandhi _et. al._ 1998))) (model only)
* Guttal's spatial skew/spatial variance (Guttal & Jayaprakash, 2008): (model only)
* Carpenter's recent ecosystem experiment compares visually to a control, but no statistical significance test: (Carpenter _et. al._ 2011)
* Drake & Griffen (Drake & Griffen, 2010), No attempt to quantify the probability, hinges on visual comparison to control.  ((Actually use a variety of proxies, just no formal quantification of the probability this would be observed by chance.  On the individual time series (appendix): "any increase or local maximum in the statistic" is assumed a significant increase. Text defines exceeding the running average by 2 sigma as significant increase -- asymptotically any data set becomes significant.))
* Subsequent theoretical work (Brock & Carpenter, 2010), (Biggs _et. al._ 2009), (<span class="showtooltip" title="Carpenter S and Brock W (2010). Early Warnings of Regime Shifts in
Spatial Dynamics Using The Discrete Fourier Transform. _Ecosphere_,
*1*. ISSN 2150-8925,  http://dx.doi.org/10.1890/ES10-00016.1."><a href="http://dx.doi.org/10.1890/ES10-00016.1">Carpenter & Brock, 2010</a></span>) doesn't address this either.
* Observational system increases variance (fish stocks) (Hsieh _et. al._ 2006)




#### Examples attempting statistical significance estimates


* Guttal & Jayaprakash introduce a new summary stat (skew, happily added to the pantheon) (Guttal & Jayaprakash, 2008).  A wonderful paper, does include real data (Sahara desertification), as well as model, and does statistical significance testing with real null and even finds it -- not significant!  Uses a moving average window.  Data from Sandusky bay, Lake Erie, see the [SanduskyData](http://www.heidelberg.edu/academiclife/distinctive/ncwqr/data/data).

* Dakos et al. PNAS paper (Dakos _et. al._ 2008) and Dakos et. al. spatial correlation paper (Gandhi _et. al._ 1998) are one of few examples with statistical significance using Kendall's correlation test, and at least in the appendix comparing it to a reasonable AR(1) null (under which the observed values of the statistic assume almost all values nearly uniformly and half of the examples loose statistical significance).

* Litzow et al.   [cite source="pubmed"]18767612[/cite] uses method STARS from (<span class="showtooltip" title="Rodionov S (2004). A Sequential Algorithm For Testing Climate Regime
Shifts. _Geophysical Research Letters_, *31*. ISSN 0094-8276, 
http://dx.doi.org/10.1029/2004GL019448."><a href="http://dx.doi.org/10.1029/2004GL019448">Rodionov, 2004</a></span>).

* (Kéfi _et. al._ 2007) statistically significant deviation from power law in patch-size (sum of squares reduction test), but is not a generic warning signal.


#### Other commentary

Examples cited (1 of 3) by Scheffer (Scheffer, 2010) as example of "smart data-processing technique" : only one attempts statistical significance test.

	
  * uses detail-specific bifurcation model (genie modeling system). (Lenton _et. al._ 2009), no test of significance
  * Dakos, (Dakos _et. al._ 2008) Kendall's $ \tau $
  * Carpenter 2006, but no measure of statistical significance  (Carpenter & Brock, 2006).


Only models, no significance tests:

	
  * Bailey's model based approach, (Bailey, 2010) cellular automata simulation with CSD, some hints at significance levels from replicate simulations, but no reported statistics.


So where does this leave us & does it matter?

Best examples are Dakos 2008, partic appendix, and Guttal Eco Let 2008.

## References


- Scheffer M, Bascompte J, Brock W, Brovkin V, Carpenter S, Dakos V, Held H, van Nes E, Rietkerk M and Sugihara G (2009).
"Early-Warning Signals For Critical Transitions."
*Nature*, **461**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature08227">http://dx.doi.org/10.1038/nature08227</a>.

- Carpenter S and Brock W (2006).
"Rising Variance: A Leading Indicator of Ecological Transition."
*Ecology Letters*, **9**.
<a href="http://dx.doi.org/10.1111/j.1461-0248.2005.00877.x">http://dx.doi.org/10.1111/j.1461-0248.2005.00877.x</a>.

- van Nes E and Scheffer M (2007).
"Slow Recovery From Perturbations as A Generic Indicator of A Nearby Catastrophic Shift."
*The American Naturalist*, **169**.
ISSN 0003-0147, <a href="http://dx.doi.org/10.1086/516845">http://dx.doi.org/10.1086/516845</a>.

- Gandhi A, Levin S and Orszag S (1998).
"“Critical Slowing Down” in Time-to-Extinction: an Example of Critical Phenomena in Ecology."
*Journal of Theoretical Biology*, **192**.
ISSN 00225193, <a href="http://dx.doi.org/10.1006/jtbi.1998.0660">http://dx.doi.org/10.1006/jtbi.1998.0660</a>.

- Guttal V and Jayaprakash C (2008).
"Spatial Variance And Spatial Skewness: Leading Indicators of Regime Shifts in Spatial Ecological Systems."
*Theoretical Ecology*, **2**.
ISSN 1874-1738, <a href="http://dx.doi.org/10.1007/s12080-008-0033-1">http://dx.doi.org/10.1007/s12080-008-0033-1</a>.

- Carpenter S, Cole J, Pace M, Batt R, Brock W, Cline T, Coloso J, Hodgson J, Kitchell J, Seekell D, Smith L and Weidel B (2011).
"Early Warnings of Regime Shifts: A Whole-Ecosystem Experiment."
*Science*, **332**.
ISSN 0036-8075, <a href="http://dx.doi.org/10.1126/science.1203672">http://dx.doi.org/10.1126/science.1203672</a>.

- Drake J and Griffen B (2010).
"Early Warning Signals of Extinction in Deteriorating Environments."
*Nature*, **467**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature09389">http://dx.doi.org/10.1038/nature09389</a>.

- Brock W and Carpenter S (2010).
"Interacting Regime Shifts in Ecosystems: Implication For Early Warnings."
*Ecological Monographs*, **80**.
ISSN 0012-9615, <a href="http://dx.doi.org/10.1890/09-1824.1">http://dx.doi.org/10.1890/09-1824.1</a>.

- Biggs R, Carpenter S and Brock W (2009).
"Turning Back From The Brink: Detecting an Impending Regime Shift in Time to Avert it."
*Proceedings of The National Academy of Sciences*, **106**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0811729106">http://dx.doi.org/10.1073/pnas.0811729106</a>.

- Hsieh C, Reiss C, Hunter J, Beddington J, May R and Sugihara G (2006).
"Fishing Elevates Variability in The Abundance of Exploited Species."
*Nature*, **443**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature05232">http://dx.doi.org/10.1038/nature05232</a>.

- Guttal V and Jayaprakash C (2008).
"Changing Skewness: an Early Warning Signal of Regime Shifts in Ecosystems."
*Ecology Letters*, **11**.
ISSN 1461-023X, <a href="http://dx.doi.org/10.1111/j.1461-0248.2008.01160.x">http://dx.doi.org/10.1111/j.1461-0248.2008.01160.x</a>.

- Dakos V, Scheffer M, van Nes E, Brovkin V, Petoukhov V and Held H (2008).
"Slowing Down as an Early Warning Signal For Abrupt Climate Change."
*Proceedings of The National Academy of Sciences*, **105**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0802430105">http://dx.doi.org/10.1073/pnas.0802430105</a>.

- Kéfi S, Rietkerk M, Alados C, Pueyo Y, Papanastasis V, ElAich A and de Ruiter P (2007).
"Spatial Vegetation Patterns And Imminent Desertification in Mediterranean Arid Ecosystems."
*Nature*, **449**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature06111">http://dx.doi.org/10.1038/nature06111</a>.

- Scheffer M (2010).
"Complex Systems: Foreseeing Tipping Points."
*Nature*, **467**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/467411a">http://dx.doi.org/10.1038/467411a</a>.

- Lenton T, Myerscough R, Marsh R, Livina V, Price A and Cox S (2009).
"Using Genie to Study A Tipping Point in The Climate System."
*Philosophical Transactions of The Royal Society A: Mathematical, Physical And Engineering Sciences*, **367**.
ISSN 1364-503X, <a href="http://dx.doi.org/10.1098/rsta.2008.0171">http://dx.doi.org/10.1098/rsta.2008.0171</a>.

- Bailey R (2010).
"Spatial And Temporal Signatures of Fragility And Threshold Proximity in Modelled Semi-Arid Vegetation."
*Proceedings of The Royal Society B: Biological Sciences*, **278**.
ISSN 0962-8452, <a href="http://dx.doi.org/10.1098/rspb.2010.1750">http://dx.doi.org/10.1098/rspb.2010.1750</a>.



- S. R. Carpenter, W. A. Brock,   (2010) Early Warnings of Regime Shifts in Spatial Dynamics Using The Discrete Fourier Transform.  *Ecosphere*  **1**  [10.1890/ES10-00016.1](http://dx.doi.org/10.1890/ES10-00016.1)
- Sergei N. Rodionov,   (2004) A Sequential Algorithm For Testing Climate Regime Shifts.  *Geophysical Research Letters*  **31**  [10.1029/2004GL019448](http://dx.doi.org/10.1029/2004GL019448)
