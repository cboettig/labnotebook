---
layout: post
title: Value of information, cost of bias
category: ecology
tags: decision-theory  
---


## Value of information

The motivation for this "value of information" excercise comes from Costello _et al._ (2010),
which essentially compares two scenarios: the value of a marine protected area when you the 
dispersal kernel is unknown (one of a discrete set of possible kernels you sum over), to the
value of the protected area when the kernel is known perfectly.  No intrinsic stochasticity,
single time step, no learning. 

The model I'm looking at comes from Reed (1979), and a modification by Sethi _et al._ (2005).
Fish dynamics are driven by Beverton Holt process, we harvest some of the population each year.
In the Reed formulation, only the future growth rate is stochastic -- the current stock value
is known without error when we must choose the harvest level for that year. The Sethi paper 
expands this result to consider the case in which the stock assessment may have measurement
error, and the harvest process may have implementation error. In either event, the optimal
harvest level for all possible values of stock for each interval in time (on a finite time-horizon)
is computed by stochastic dynamic programming, given some price function for the harvest.
This is implemented in [my R package, pdgControl](https://github.com/cboettig/pdg-control).

I consider several cases in which we vary the management uncertainty and the stock uncertainty.
I've considered four scenarios so far, (links to the runs of each scenario with R code and results)

- ["Value of information" (VI)](https://github.com/cboettig/pdg_control/blob/e501e219ddae177804751f289355510a8c5fc88a/inst/examples/value_of_information.md)
- ["Value of stochasticity" (VS)](https://github.com/cboettig/pdg_control/blob/e501e219ddae177804751f289355510a8c5fc88a/inst/examples/value_of_stochasticity.md)
- ["Cost of underestimating" (CU)](https://github.com/cboettig/pdg_control/blob/e501e219ddae177804751f289355510a8c5fc88a/inst/examples/cost_of_underestimating.md)
- ["Reckless driver" (RD)](https://github.com/cboettig/pdg_control/blob/cfe87046bb29122b4e624459b63e4df5db34118d/inst/examples/reckless_driver.md)

Easiest to compare by putting these on a grid of manager uncertainty (across) vs true stochasticity (down):

                   none        growth    g+measure    g+m+implement
-----------        ----------  --------  -----------  -------------
**none**            VS,VI,RD     VI         VI        VI
**growth**           RD          VS                   
**g+measure**        RD                     VS        
**g+m+implement**   CU, RD       CU         CU        CU, VS



### Numerical values

                   none         growth      g+measure    g+m+implement
-----------        -----------  ----------  -----------  -------------
**none**            33+/-0.3      33+/-1.4     33+/-1.5  33 +/1.4
**growth**           35+/-4       35 +/ -3               
**g+measure**        33+/-3                  33+/- 3.5   
**g+m+implement**    33+/-4       33+/- 4      33+/-4    33 +/- 5

So far I've been surprised that the expected profits in each scenario are remarkably similar, despite the apparent mismatch between optimization strategy and reality, or the presence of extra noise. Perhaps this is driven by the essentially single-step prediction nature of the problem formulation, perhaps simply because things are relatively linear? 


References
----------

Costello C, Rassweiler A, Siegel D, De Leo G, Micheli F and
Rosenberg A (2010). "Marine Reserves Special Feature: The
value of spatial information in MPA network design." _Proceedings
of the National Academy of Sciences_, *107*. ISSN 0027-8424, 
http://dx.doi.org/10.1073/pnas.0908057107

Sethi G, Costello C, Fisher A, Hanemann M and Karp L (2005).
"Fishery management under multiple uncertainty." _Journal of
Environmental Economics and Management_, *50*. ISSN 00950696,
http://dx.doi.org/10.1016/j.jeem.2004.11.005

Reed W (1979). "Optimal escapement levels in stochastic and
deterministic harvesting models." _Journal of Environmental
Economics and Management_, *6*. ISSN 00950696, 
http://dx.doi.org/10.1016/0095-0696(79)90014-7




