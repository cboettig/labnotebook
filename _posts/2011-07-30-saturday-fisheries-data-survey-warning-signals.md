---
comments: true
date: 2011-07-30 17:26:54
layout: post
slug: saturday-fisheries-data-survey-warning-signals
title: 'Saturday: Fisheries Data Survey, Warning Signals'
redirects: [/wordpress/archives/2263, /archives/2263]
categories:
- ecology
tags:
- warning-signals
---

Marissa mentioned looking into some of the fisheries data for early warning signals: particularly the Canadian Cod collapse.

Apparently several of the data sets are problematic.  All deal with catch instead of abundance and measurement error is highly significant, though it seems that some may suffer from more troublesome systematic errors.  Taking a quick look over what is available.  Lots of data, but despite what appears to be some rather sophisticated tools available on the sites, I'm having a bit of difficulty finding just what I'm looking for.

For instance, would be nice to get the data associated with the often-reproduced [graphs from the Millennium Ecosystem Assessment](http://www.millenniumassessment.org/en/GraphicResources.aspx) (_e.g._ inset).  An hour or so of poking around hasn't been very successful.  Checking out:

![](http://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Atlantic-Cod-Stocks.jpg/773px-Atlantic-Cod-Stocks.jpg)



	
  * [International Fisheries data from FAO](http://www.fao.org/fishery/statistics/collections/en)

	
  * [Canadian Fisheries DFO](http://www.dfo-mpo.gc.ca/stats/commercial/sea-maritimes-eng.htm) (annual entries, only back to 1990)

	
  * [Millennial Ecosystem assessment data at NBII](http://wdc.nbii.gov/ma/datapage.htm) Looks more promising, but in zipped (MS access?) DB formats, not quite sure what's what yet.




## Reading


Nice paper by Carpenter and Brock comparing performance of non=parametric warning signals out in Ecology today (Carpenter & Brock, 2011).  Haven't given it a close read yet, but seems to show that diffusion-related estimates like variance are the most reliable indicator while drift-related estimates such as autocorrelation/return time are less reliable. The estimate a drift-diffusion-jump model:

$$ dx = \mu(x_t,\theta_t)d t + \sigma(x_t, \theta_t) d W + d(\sum Z_n) $$

Where the $Z_n$ is a sum over discontinuous shocks.  Seems that this conclusion can be argued from first principles of stochastic processes -- convergences of parameter estimates should obey a central-limit theorem, though the time-varying case might be harder.  They seem to be estimated in a piece-wise constant manner over a sliding Gaussian window.  Mean and variance are just estimated from the first and second moments in the window, somehow jump terms are estimated as function of the sixth and forth moment.  This estimation approach comes from the econometrics literature Bandi & Nguyen, 2003, (Johannes, 2004).


## Presentation


Working on incorporating comments from Friday's practice talk.


## Misc





	
  * Registered for DataCite 2011.

	
  * Wrote to Alan about EIM 2011

	
  * Some ESA planning



## References


- Carpenter S and Brock W (2011).
"Early Warnings of Unknown Nonlinear Shifts: A Nonparametric Approach."
*Ecology*, **92**.
ISSN 0012-9658, <a href="http://dx.doi.org/10.1890/11-0716.1">http://dx.doi.org/10.1890/11-0716.1</a>.

- Johannes M (2004).
"The Statistical And Economic Role of Jumps in Continuous-Time Interest Rate Models."
*The Journal of Finance*, **59**.
ISSN 0022-1082, <a href="http://dx.doi.org/10.1111/j.1540-6321.2004.00632.x">http://dx.doi.org/10.1111/j.1540-6321.2004.00632.x</a>.



-  on The Functional Estimation of Jump-Diffusion Models, Federico M. Bandi, Thong H. Nguyen,  (2003) *Journal of Econometrics*, **116**    [10.1016/S0304-4076(03)00110-6](http://dx.doi.org/10.1016/S0304-4076(03)00110-6)
