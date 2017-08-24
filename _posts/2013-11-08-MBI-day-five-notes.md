---
layout: post
category: ecology
tags: 
- conference
- ropensci

---

Panel discussion

- Hugh's question on the usefulness of dynamic vs static models: do we have dynamical systems envy?
- Chris: are temporal dynamics historical artefact, and space the new frontier?
- Hugh: though decision theory is fundamentally temporal.  really question of sequential decision vs single decision
- Hugh, on what would be his priority if he had time for new question: Solve the 2 player, 2 step SDP competition closed form.  
- Paul: the narrow definitions of "math biology" with 1980s flavor.  
- @mathbiopaul: Formulating the hard problems arising in application in an appropriate abstraction that mathematicians will attack.
- Leah raises issue of publishing software and reproducibility
- Julia mentions Environmental modeling and software journal



### Notes from some discussions today

- Sandy Leibold mentions potential for exploring early warning signals in larch budmoth data: <span class="showtooltip" title="Esper J, Buntgen U, Frank D, Nievergelt D and Liebhold A (2007). '1200 Years of Regular Outbreaks in Alpine Insects.' Proceedings of The Royal Society B: Biological Sciences, 274, pp. 671-679. ISSN 0962-8452."><a href="http://dx.doi.org/10.1098/rspb.2006.0191">Esper et al. (2007)</a></span> , `r citet("10.1111/j.1469
-8137.2009.02825.x")`.  

- Bill Fagan mentions paper with Eli Holmes on quasi-extinction forecasting <span class="showtooltip" title="Holmes E, Sabo J, Viscido S and Fagan W (2007). 'A Statistical Approach to Quasi-Extinction Forecasting.' Ecology Letters, 10, pp. 1182-1198. ISSN 1461-023X."><a href="http://dx.doi.org/10.1111/j.1461-0248.2007.01105.x">Holmes et al. (2007)</a></span>  and an analysis of the GPDD <span class="showtooltip" title="Fagan u, Meir u, Prendergast u, Folarin u and Karieva u (2001). 'Characterizing Population Vulnerability For 758 Species.' Ecology Letters, 4, pp. 132-138. ISSN 1461-023X."><a href="http://dx.doi.org/10.1046/j.1461-0248.2001.00206.x">Fagan et al. (2001)</a></span>  as potentially interesting applications for our Bayesian nonparametrics work.  


- Matt Potts mentions DoD program in [Strategic Environmental Research and Development Program (SERDP)](http://www.serdp.org/).  E.g. see the current call for [New Paradigms for Managing Species and Ecosystems in a Non-Stationary World (pdf)](http://www.serdp.org/content/download/22120/228239/version/2/file/FY15_RCSON-15-01_New+Conservation+Paradigms_Final.pdf)




### pdg-control 

Trying to understand pattern of increasing ENPV with increasing stochasticity.  Despite having the same optimal policy inferred under increasing stochasticity (i.e. still in Reed's self-sustaining criterion, below $\sigma_g$ of 0.2 or so) the average over simulated replicates is higher.  We don't seem to obtain the theoretical ENPV, but something less, in either case.  See code [noise_effects.md](https://github.com/cboettig/pdg_control/blob/38bccb71b08f1bbd02b7a5ca55188a739eea5109/inst/examples/noise_effects.Rmd).  


### ropensci

Schema.org defines a vocabulary for [datasets](http://schema.org/Dataset) (microdata/rdfa)

Rutger gives a one-liner solution for tolweb to nexml using [bio-phylo](https://github.com/rvosa/bio-phylo) perl library:

```bash
perl -MBio::Phylo::IO=parse -e 'print parse->to_xml' format tolweb as_project 1 url 'http://tolweb.org/onlinecontributors/app?service=external&page=xml/TreeStructureService&node_id=52643'
```

Hmm, there's a journal of [Ecological Informatics](http://www.sciencedirect.com/science/journal/15749541).  




## References



- Rebecca S. Epanchin-Niell, Robert G. Haight, Ludek Berec, John M. Kean, Andrew M. Liebhold, Helen Regan,   (2012) Optimal Surveillance And Eradication of Invasive Species in Heterogeneous Landscapes.  *Ecology Letters*  **15**  803-812  [10.1111/j.1461-0248.2012.01800.x](http://dx.doi.org/10.1111/j.1461-0248.2012.01800.x)
- Rebecca S. Epanchin-Niell, James E. Wilen,   (2012) Optimal Spatial Control of Biological Invasions.  *Journal of Environmental Economics And Management*  **63**  260-270  [10.1016/j.jeem.2011.10.003](http://dx.doi.org/10.1016/j.jeem.2011.10.003)
- J. Esper, U. Buntgen, D. C Frank, D. Nievergelt, A. Liebhold,   (2007) 1200 Years of Regular Outbreaks in Alpine Insects.  *Proceedings of The Royal Society B: Biological Sciences*  **274**  671-679  [10.1098/rspb.2006.0191](http://dx.doi.org/10.1098/rspb.2006.0191)
- unknown Fagan, unknown Meir, unknown Prendergast, unknown Folarin, unknown Karieva,   (2001) Characterizing Population Vulnerability For 758 Species.  *Ecology Letters*  **4**  132-138  [10.1046/j.1461-0248.2001.00206.x](http://dx.doi.org/10.1046/j.1461-0248.2001.00206.x)
- A. R. Hall, A. D. Miller, H. C. Leggett, S. H. Roxburgh, A. Buckling, K. Shea,   (2012) Diversity-Disturbance Relationships: Frequency And Intensity Interact.  *Biology Letters*  **8**  768-771  [10.1098/rsbl.2012.0282](http://dx.doi.org/10.1098/rsbl.2012.0282)
- Elizabeth Eli Holmes, John L. Sabo, Steven Vincent Viscido, William Fredric Fagan,   (2007) A Statistical Approach to Quasi-Extinction Forecasting.  *Ecology Letters*  **10**  1182-1198  [10.1111/j.1461-0248.2007.01105.x](http://dx.doi.org/10.1111/j.1461-0248.2007.01105.x)
- Brian Leung, Nuria Roura-Pascual, Sven Bacher, Jaakko Heikkilä, Lluis Brotons, Mark A. Burgman, Katharina Dehnen-Schmutz, Franz Essl, Philip E. Hulme, David M. Richardson, Daniel Sol, Montserrat Vilà, Marcel Rejmanek,   (2012) Teasing Apart Alien Species Risk Assessments: A Framework For Best Practices.  *Ecology Letters*  **15**  1475-1493  [10.1111/ele.12003](http://dx.doi.org/10.1111/ele.12003)
- A. D. Miller, S. H. Roxburgh, K. Shea,   (2011) How Frequency And Intensity Shape Diversity-Disturbance Relationships.  *Proceedings of The National Academy of Sciences*  **108**  5643-5648  [10.1073/pnas.1018594108](http://dx.doi.org/10.1073/pnas.1018594108)
- Adam David Miller, Stephen H. Roxburgh, Katriona Shea,   (2011) Timing of Disturbance Alters Competitive Outcomes And Mechanisms of Coexistence in an Annual Plant Model.  *Theoretical Ecology*  **5**  419-432  [10.1007/s12080-011-0133-1](http://dx.doi.org/10.1007/s12080-011-0133-1)


