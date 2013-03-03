---
comments: true
date: 2011-06-29 22:08:01
layout: post
slug: warning-signals-summary-statistic-performance-at-varying-sampling-effort
title: 'Warning signals: summary statistic performance at varying sampling effort'
categories:
- ecology
tags:
- warning-signals
- delayed-release
---

* oikos post
* launch case of increased sampling on sim data for autocorrelation
* (is our approach more robust to model differences?)

## IBM data Example


Using data from the individual-based model simulation of a system approaching a saddle-node.


### Variance


While the initial example with variance shows almost no signal, increasing the sampling effort substantially improves the performance.  This can be seen in the ROC curves and as a tightening and spreading out of the null and test distributions as the sampling effort is increased.



![]( http://farm6.staticflickr.com/5061/5886269969_d9fecfa77b_o.png )


![]( http://farm6.staticflickr.com/5158/5886270151_ddf0fd6c45_o.png )




The distributions corresponding to each of the ROC curves above, in order of increasing sampling effort.  The original simulation had 40 data points. The coefficient of variation essentially matches the variance pattern.


### autocorrelation


Autocorrelation requires substantially higher sampling before it becomes very effective at discriminating between the critical and stable cases.

![]( http://farm6.staticflickr.com/5312/5886270427_c95b6dd420_o.png )


![]( http://farm6.staticflickr.com/5263/5886270603_ac9dc593b3_o.png )



### Skew


Skew does not appear to be a useful indicator. This is probably a consequence of the low-order models on which the inference is actually based, since accurately estimating a higher-order model in the first place would be problematic.

![]( http://farm6.staticflickr.com/5304/5886270909_3d145b3522_o.png )


![]( http://farm6.staticflickr.com/5080/5886837244_69fb0de8b7_o.png )



