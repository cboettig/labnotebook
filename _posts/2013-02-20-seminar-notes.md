---
layout: post
tags: seminar
category: ecology

---

Leo Polansky Seminar
--------------------

(all notes cover published results only)

* Wavelet analysis does a nice trick of seeing frequency-domain spectra change over time, rather than being entirely in frequency space or entirely in time space.  
* higher rank elephants decrease their movement more in dry, resource-poor season than low rank.  Guarding the good territory?  I wonder if this is a stochastic effect - asset protection, where you take more risk when you have low assets than when you have higher assets, a feature that would dissappear in a deterministic environment.  
* Nice hidden markov model analysis from the mhsmm package.
* movement time series -- high impact public data or closely guarded secret?  (top secret)


Michael Bonsall 
----------------

(Seminar to the Mangel megagroup meeting)

* uncertainty and variability in population dynamics.  Mike uses the very words I've used to describe my interests: dynamic, nonlinear, and noisy.  

### Blasocyst Dynamics

* Development of mammalian blastocyst much more messy/complicated than development in other taxa.  heterogeneity in timing
* Begins with ODE model with time lags (to avoid poisson waiting times).  Then add a distribution over the time lag.  
* Invasion analysis of cell types differing in time.  Widening distribution of time lags increases fitness. *Interesting! But intuition/mechanism unclear*
* Now add process noise, observation error and priors on parameters to compare model to data.  Variability can be explained entirely by differences in rates. (as estimated from a particle filter).  *Identifiability?*


### Bruchid Dynamics 

* Spatial dynamics with beatles and their parasitic wasps.
* Beautiful microcosm setup that follows Nicholson-Bailey dynamics.  
* Within patch dynamics show regimes.  
* Consider stochastic birth-death-diffusion model
* Stochastic focusing / demographic heterogeneity observed


### Bipolar disorder dynamics

* (Inductive example)
* EM algorithm for missing values in time lag model



Other activities today
----------------------

* working on nominations
* ropensci sustainability plan (see email threads), 
* also see the Conceptualizing an Institute for Sustainable Earth and Environmental Software (ISEES), http://isees.nceas.ucsb.edu/
* friendly review phylolm package and preprint
* summarizing reimbursement form
* updated issues lists for notebook
* Bonsall speaker dinner



## Further reading 

Following up on discussions today, seemed like a good time to reread: 

- Bonsall, M. B. & Hastings, A. 2004 Demographic and environmental stochasticity in predator - prey metapopulation dynamics. , 1043-1055. (doi:10.1111/j.0021-8790.2004.00874.x)

Also taking a look at the 'stochastic focusing' literature.  Unclear if the term has caught on much beyond Paulsson and co. though.  

- Paulsson, J., Berg, O. G. & Ehrenberg, M. 2000 Stochastic focusing: fluctuation-enhanced sensitivity of intracellular regulation. Proceedings of the National Academy of Sciences of the United States of America 97, 7148-53. (doi:10.1073/pnas.110057697)


