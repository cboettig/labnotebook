---
layout: post
category: ecology
tags: 
- nonparametric-bayes 
- pdg-control 
- multiple-uncertainty
- warning-signals

---

# Progress mid-October through mid-December  

## 80% Time: nonparametric-bayes

The bulk of my time has been spent becoming familiar with the literature on Gaussian Processes and their numerical implementation. I have written my own Gaussian process code from scratch to convince myself of my understanding of the methodology, and explored some of the related numerical issues addressing computational speed and stability.  

I then developed an algorithm for applying the Gaussian process inference of the state dynamics to stochastic dynamic programming methods for determining an optimal harvesting policy.  I have compared the performance of the Gaussian-process inferred model to the optimal solution (given the  exact underlying model) and to solutions based on estimated parametric models (both matching and not matching the underlying structure).  This analysis shows the benefit of the nonparametric approach in better accounting for structural uncertainty in the underlying dynamics.  

Steve and I have just started to look into the potential for state shifts and warning signals there-of in the ENSO / Pacific decadal oscillation.  I obtained 2 appropriate datasets and have run a very preliminary [analysis](http://www.carlboettiger.info/2012/12/17/random_ews_example.html).  

## 20% Time: Independent projects

1. **pdg-control Working group paper.** Updated analysis for Figures 3 and 4.  Updated draft.  Conference call for feedback from working group participants.  ([Current draft](https://github.com/cboettig/pdg_control/blob/master/inst/doc/policycosts/policycosts.tex))
2. Wrote **comment** piece on Early Warning Signals for *Nature*.  
3. Working on EWS review paper for Theoretical Ecology with Noam Ross.  ([Current draft](https://github.com/cboettig/ews-review))
4. Working on analysis optimal policies under multiple uncertainties (with Jim Sanchirico, Mike Springborn).  [#multiple-uncertainty](http://www.carlboettiger.info/tags.html#multiple-uncertainty) tag in notebook; currently analyses are part of [pdg-control](https://github.com/cboettig/pdg_control/tree/master/inst/examples) repository.  
5. Finished and submitted NSF post-doc application

### Other academic activities 

- Wrote requested reviews for *Conservation Letters*, *Ecology Letters*, *Proceedings of the Royal Society B*.  Declined to review for *Systematic Biology*.  
- Presented my [exit seminar](http://dx.doi.org/10.6084/m9.figshare.97500) in the UC Davis Center for Population Biology Colloquia series. 
- Interviewed for the  *Nature* column  *Turning Point*. 
- Invited and attended the PLoS alt-metrics workshop and hackathon
- Ran two sessions on version management, dynamic/reproducible papers, and building academic websites for the Mangel group.  
- Presented scaling from individual to population level models through the van Kampen expansion in Steve's Applied Math Club
- Participated regularly in applied math club meetings. 
- Established communication with FishBase team, arranged a coalition of developers interested in API access.
- ongoing development in [rOpenSci project](https://github.com/ropensci)


# Goals for January - March

## 80% Time

*Writeup of the Nonparametric Bayesian approach to management paper.*

Initial goal for manuscript is proof of concept piece with the aim of demonstrating the value of a nonparametric approach to ecological decision-making.  Alternatively a more technical piece could focus on the details of using Gaussian processes models for stochastic dynamic programming.  

- Outline of manuscript: Dec 31st
- Decide on manuscript figures to include
- Complete draft 
- Appendices
- Solocit friendly revisions 
- Submit (by March 31?)

*Next steps and Additional projects*

- The multi-species context is probably the next goal.  Depending on timing, Steve may take the lead on that in these three months; I aim to be working in this in March.  The step after will be the active/reinforcement learning/approximate SDP approaches.  I aim to start into the background reading for that material but real progress on that front will happen after March.  

- Steve and I will likely continue to do something with the ENSO / PDO analysis as well. (Currently waiting on Steve's pending queries to domain experts for further discussion)

- I will also need to determine my summer conference schedule during this interval, and submit abstracts, etc.  I have committed to the symposium to which I was invited at SIAM in San Deigo, July 8 - 12, and plan on attending ESA.  

## 20% Time goals

- Finish and submit EWS review paper: end of January
- Finish and submit pdg-control policy costs paper (see [current issues](https://github.com/cboettig/pdg_control/issues?direction=desc&labels=policy+costs&milestone=&page=1&sort=created&state=open))
- Finish the methods section for the Labrids paper 
- Finish my pending review for *Environmental Modeling and Assessment*. 
- Skype with pdg-control Working group, basic follow-up tasks.  
- Some next steps on multiple uncertainty.

### Additional academic goals

- Present in mega-group meeting: Feburary 20th
- Join the phylotastic hackathon remotely(?)



