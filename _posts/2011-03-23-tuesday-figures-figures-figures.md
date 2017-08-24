---
date: 2011-03-23 10:37:35
layout: post
modified: 2013-02-22
title: 'Tuesday: Figures, figures, figures'
categories:
- ecology 
tags:
- warning-signals
- delayed-release
---

Today working mostly on selecting examples of data sets to include in the figure patterns.  Working with the idea of three figures -- data, bootstraps of Tau, bootstraps of likelihood -- in panels for several examples: some real data sets and some simulated data sets with and without warning.  In addition to this, I still have some more work to do with references, and refining the writing of a few of the appendices.


## Empirical example data, original signals


Code: Run [real_data_examples.R](https://github.com/cboettig/structured-populations/blob/256941ba96e741fbfec7b12e08f25bc7291c847c/warningsignals/demos/real_data_examples.R) to reproduce this set.


#### Deuterium Data, pre-processed


Deuterium data during Glaciation III shows the clearest signal, though also possibly Glaciation I.  (order below is II, I, III, IV, click to enlarge for labels).

[flickr-gallery mode="search" tags="stochpop, processed"  tag_mode="all"  min_upload_date="2011-03-22 12:00:00" max_upload_date="2011-03-22 12:05:00"]


#### Deuterium Data, unprocessed


Almost none of the unprocessed data shows a signal.  Uneven spacing matters for autocorrelation and skew estimates, but not variance.
[flickr-gallery mode="search" tags="stochpop, deut, raw"  tag_mode="all"  min_upload_date="2011-03-22 12:00:00" max_upload_date="2011-03-22 12:05:00"]


#### CaCO3 Data


[flickr-gallery mode="search" tags="stochpop, CaCO3"  tag_mode="all"  min_upload_date="2011-03-22 12:00:00" max_upload_date="2011-03-22 12:05:00"]


#### Simulated Data




![]( http://farm6.staticflickr.com/5068/5550314677_841e211a3e_o.png )


## Uncertainty


Using code functions from [bootstrap_indicators.R](https://github.com/cboettig/structured-populations/blob/49be95ffdf17ec67187c27642e2a5ea4612ab332/warningsignals/demos/bootstrap_indicators.R), run from script [indicator_example.R](https://github.com/cboettig/structured-populations/blob/49be95ffdf17ec67187c27642e2a5ea4612ab332/warningsignals/demos/indicator_example.R).  Note, these use the LTC model estimates.  (easily confirmed -- load the data by id, call timedep$setmodel)

Columns are: CaCO3 Data, Deuterium Data, (Glaciation III) pre-processed, simulated data with crash.  Rows are Variance, Autocorrelation, Skew, Kurtosis.  Note that the higher moments are meaningless, containing virtually no signal, while variance is the most reliable.

![]( http://farm6.staticflickr.com/5174/5550768947_1775500510_o.png )
 ![]( http://farm6.staticflickr.com/5184/5550956133_63ae0a5c28_o.png )
 ![]( http://farm6.staticflickr.com/5141/5551584198_27d43d2eaa_o.png )



## Decreasing the uncertainty using likelihood




#### CaCO3 Data


using LTC against the null:
![]( http://farm6.staticflickr.com/5255/5518867116_6773275786_o.png )



#### Deuterium Data, (Glaciation III) pre-processed


This I believe is fit with LTC
![]( http://farm6.staticflickr.com/5216/5520221975_5017582330_o.png )


## Model Choice for bifurcation type


Can consider choosing between LSN and LTC first on real data.  Both the Glaciation III and CaCO3 dataset clearly prefer the saddle-node model, (though note that the CaCO3 data is increasing stability!).  Code in [model_choice.R](https://github.com/cboettig/structured-populations/blob/faf10ddc66b139f47ac2550e655a5662b1dec55a/warningsignals/demos/model_choice.R)


#### CaCO3 Data


![]( http://farm6.staticflickr.com/5060/5551674282_e8335023b8_o.png )



#### Deuterium Data, (Glaciation III) pre-processed


![]( http://farm6.staticflickr.com/5051/5552850530_0aea953363_o.png )

On simulated data we know the correct model.  We can confirm that this works, using the LTC simulated dataset from above, we find no reason to prefer LSN, as we did with the real data.

#### Simulated data


![]( http://farm6.staticflickr.com/5268/5552596535_8182746b73_o.png )

## Code updates

* Empirical data files are now read and formatted with own scripts, [load_deut.R](https://github.com/cboettig/structured-populations/blob/master/warningsignals/demos/load_deut.R) and [load_CaCO3.R](https://github.com/cboettig/structured-populations/blob/master/warningsignals/demos/load_CaCO3.R) Settings for [simulated data here](https://github.com/cboettig/structured-populations/blob/5ac3751756d2406d19bb46618ca239d2711cd618/warningsignals/demos/simulate_data.R), though best to load data-set directly from .Rdat corresponding to figure.

	

