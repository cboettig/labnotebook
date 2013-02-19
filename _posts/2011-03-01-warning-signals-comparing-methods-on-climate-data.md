---
comments: true
date: 2011-03-01 16:51:54
layout: post
slug: warning-signals-comparing-methods-on-climate-data
title: 'Warning Signals: Comparing Methods on Climate Data'
redirects: [/wordpress/archives/1145, /archives/1145]
categories:
- ecology
tags:
- warning-signals
---

Continuing my exploration in applying these techniques to real climate data.  Applying the Kendall's Tau based approach on real data.



Greenhouse Earth, CaCO3 data:

![]( http://farm6.staticflickr.com/5295/5489514762_f8c9a6fa42_o.png )




Glaciation I-IV (deuterium data)

![]( http://farm6.staticflickr.com/5257/5489563736_33a34fa14e_o.png )


![]( http://farm6.staticflickr.com/5259/5488967119_ae49dc1dfa_o.png )


![]( http://farm6.staticflickr.com/5015/5489564102_61f857cb7d_o.png )


![]( http://farm6.staticflickr.com/5056/5489564230_eeeb03e8f2_o.png )




These use the unadjusted timeseries, and hence don't reproduce the values of Kendall's tau statistic reported in (Dakos _et. al._ 2008).  In fact they don't even agree on the sign -- visually many of the datasets are certainly decreasing in variance. I ran the Monte-Carlo distributions for  tau on models estimated from these data-sets with and without warning, for variance (left) and autocorrelation (right), in the CaCO3 data:

![]( http://farm6.staticflickr.com/5095/5487867329_6f2f9f9b60_o.png )


![]( http://farm6.staticflickr.com/5014/5488464534_d6733a5707_o.png )


and again the models with a trend show an actual decrease in the variance and autocorrelation, (just as the real data does), as well as rather low power to distinguish.  The opposite trend is observed by (Dakos _et. al._ 2008) after detrending and interpolating the data.


## Detrending and Interpolating


We can try both interpolating and detrending the data to compare more directly (R functions make this easy.  We follow the original work using _ksmooth_ for kernel smoothing mean which is subtracted out, and _approx_ for linear interpolation).

![]( http://farm6.staticflickr.com/5173/5490180354_b16fe6a469_o.png )


Top plot shows the raw data (blue), interpolated data (red) and trend subtracted from the data (gray).  Lower curve shows the autocorrelation, AR1 coefficient over the moving window and it's score in Kendall's tau test.[ref] Note some effort required to produce these nicer plots.  Particularly, R makes it rather unintuitive how to specify that a greek letter is equal to a variable.  _expression_ is typically used to display math/greek, but doesn't work for including values of a variable.  After wasting some time, posted to our statcompsci lsit and got the answer in about 30 seconds from Duncan: the key is the _substitute_ command.  See the c[ode in show_stats function in the tau_dist_montecarlo.R file](https://github.com/cboettig/structured-populations/blob/738265dad8c57abd9bda26234e66c9d510511c51/warningsignals/R/tau_dist_montecarlo.R).[/ref]

![]( http://farm6.staticflickr.com/5095/5489563269_c027c1deb3_o.png )


Supplement describes the functions used by (Dakos _et. al._ 2008), many of which are from R (some, like linear interpolation, is done in matlab).  They use autocorrelation calculated with _"ar.ols"_, while I have been using the _acf_ function. I compare the differences with warning_ar.ols with warning_autocorr (acf) (right; [code)](https://github.com/cboettig/structured-populations/blob/d7b49ec24bbcc9c02f36e7688c2f1d8bac80d3ff/warningsignals/demos/compare_ar1_examples.R) The ar.ols is substantially slower to evaluate (seconds per call on this data).  I also migrated to the built in cor.test(method="kendall") in "stats" package rather than the "Kendall" function in the extension package "Kendall" for consistency.

Now set to rerun the above results on the detrended, interpolated data...



## References


- Dakos V, Scheffer M, van Nes E, Brovkin V, Petoukhov V and Held H (2008).
"Slowing Down as an Early Warning Signal For Abrupt Climate Change."
*Proceedings of The National Academy of Sciences*, **105**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0802430105">http://dx.doi.org/10.1073/pnas.0802430105</a>.
