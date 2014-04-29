---
layout: post
category: ecology
tags:
- multiple-uncertainty

---

Attempt to replicate Figure 3, but with one noise at a time
-----------------------------------------------------------

- Code: [one_noise_at_a_time.m](https://github.com/cboettig/multiple_uncertainty/blob/95a79c15659248ccc635f231b24a5db849b01e73/inst/matlab/one_noise_at_a_time.m)
- Uniform Noise
- Large noise means devation of 0.5, as in Sethi
- Other noise terms are 0 instead of 0.1

![](http://cboettig.github.com/multiple_uncertainty/one_at_a_time.svg)


Figure 3
---------

- Code: [carl_fig3.m](https://github.com/cboettig/multiple_uncertainty/blob/ac84a3623786099e827e47bc1ef0c3c094438080/inst/matlab/carl_fig3.m)
- Uniform Noise
- Large noise means devation of 0.5, as in Sethi
- Small noise means 0.1, as in Sethi

![](http://cboettig.github.com/multiple_uncertainty/carl_fig3.svg)

**Now fixed**. See:

* Updated code version of [carl_fig3.m](https://github.com/cboettig/multiple_uncertainty/blob/be2597935e166f1311f7d43df91750d07a69f7cc/inst/matlab/carl_fig3.m)

![](http://cboettig.github.com/multiple_uncertainty/carl_figure3.svg)

----------------------------

One noise at a time, lognormal noise, `sigma = 0.3`. ([code](https://github.com/cboettig/multiple_uncertainty/blob/9739f930c5c6c78cdf41956ce6c38a5d5b2870dc/inst/matlab/lognormal_one_at_a_time.m))


![](http://cboettig.github.com/multiple_uncertainty/lognormal_one_at_a_time.svg)


