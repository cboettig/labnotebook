---
comments: true
date: 2011-02-27 16:24:03
layout: post
slug: warning-signals-on-real-data
title: Warning Signals on Real Data?
redirects: [/wordpress/archives/1131, /archives/1131]
categories:
- ecology
tags:
- warning-signals
---

Grabbed the data used in (Dakos _et. al._ 2008), which is includes climate data from the Deuterium levels in the Vostok ice core (Petit _et. al._ 1999), showing transitions into the last several ice ages,  and calcium carbonate from Eocene "greenhouse" climate (Tripati _et. al._ 2005), and carbon-14 data from the Younger Dryas (Hughen, 2000).  Data is all freely provided through NOAA.



	
  * [CaCO3  data file ](ftp://ftp.ncdc.noaa.gov/pub/data/paleo/contributions_by_author/tripati2005/tripati2005.txt)(Tripati _et. al._ 2005), NOAA entry.

	
  * [Deuterium data file](ftp://ftp.ncdc.noaa.gov/pub/data/paleo/icecore/antarctica/vostok/deutnat.txt) (Petit _et. al._ 1999), [NOAA entry.](http://www.ncdc.noaa.gov/paleo/metadata/noaa-icecore-2453.html)

	
  * C-14 [greyscale data file](ftp://ftp.ncdc.noaa.gov/pub/data/paleo/contributions_by_author/hughen2000/cariaco2000_pc56_greyscale.txt),(Hughen, 2000) [NOAA entry](http://www.ncdc.noaa.gov/paleo/pubs/hughen2000/hughen2000.html)


Data is also added to the warningsignals package.

Broke deuterium data into chunks for each ice age, and truncated the CaCO3 data to the time interval used for early warning, as in (Dakos _et. al._ 2008).

(example data figures and analysis coming)


### Real Timeseries vs regular sampling


The data in each of the above intervals are not sampled on a regular time interval, as is assumed by the R timeseries object I'm using for my default data-type (for consistency with the sde R package -- I've never really enjoyed forcing my data into this format and now its more obvious why).

To fit this data to the models in which a warning signal is present, this means that the likelihood function will need to be passed a different time-step delta at each interval, which will require a bit of tweaking at a rather low-level in the code, since it changes the logic of the computation a bit.

Made edits to package functions ([see git log](https://github.com/cboettig/structured-populations/commit/943adc11d94a89fe37a0c16887734035e6517443)) to generalize this to arbitrary time intervals.  Data can now be specified in data frame or matrix with time in first column and data in the second, or as a timeseries as before.  Requires testing.


## ROC Curves


Alan suggested taking a look at the unfortunately-named receiver-operator characteristics (ROC) to emphasize the trade-off between false alarms and missed detections.

[![](http://upload.wikimedia.org/wikipedia/commons/8/8c/Receiver_Operating_Characteristic.png)](http://upload.wikimedia.org/wikipedia/commons/8/8c/Receiver_Operating_Characteristic.png)

I don't actually find the curve more useful than just seeing the two distributions themselves, but possibly useful as it has made appearances in the theoretical ecology literature already (M.A. Lewis).


## Manuscript: Still Revising/Writing...

## References


- Dakos V, Scheffer M, van Nes E, Brovkin V, Petoukhov V and Held H (2008).
"Slowing Down as an Early Warning Signal For Abrupt Climate Change."
*Proceedings of The National Academy of Sciences*, **105**.
ISSN 0027-8424, <a href="http://dx.doi.org/10.1073/pnas.0802430105">http://dx.doi.org/10.1073/pnas.0802430105</a>.

- Petit J, Jouzel J, Raynaud D, Barkov N, Barnola J, Basile I, Bender M, Chappellaz J, Davis M, Delaygue G, Delmotte M, Kotlyakov V, Legrand M, Lipenkov V, Lorius C, PÉpin L, Ritz C, Saltzman E and Stievenard M (1999).
"Unknown."
*Nature*, **399**.
ISSN 00280836, <a href="http://dx.doi.org/10.1038/20859">http://dx.doi.org/10.1038/20859</a>.

- Tripati A, Backman J, Elderfield H and Ferretti P (2005).
"Eocene Bipolar Glaciation Associated With Global Carbon Cycle Changes."
*Nature*, **436**.
ISSN 0028-0836, <a href="http://dx.doi.org/10.1038/nature03874">http://dx.doi.org/10.1038/nature03874</a>.

- Hughen K (2000).
"Synchronous Radiocarbon And Climate Shifts During The Last Deglaciation."
*Science*, **290**.
ISSN 00368075, <a href="http://dx.doi.org/10.1126/science.290.5498.1951">http://dx.doi.org/10.1126/science.290.5498.1951</a>.
