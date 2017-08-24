---
layout: post
categories: ecology
tags: 
- conference 
- pdg-control 

---

## MBI Workshop


#### Becky Epanchin-Niell

- Motivating example of Rabies spatial control in Switzerland

- 2012 Eco Let: should New Zealand survey for bark beetle? Cost of survellience, control, and damage. <span class="showtooltip" title="Epanchin-Niell R, Haight R, Berec L, Kean J, Liebhold A and Regan H (2012). 'Optimal Surveillance And Eradication of Invasive Species in Heterogeneous Landscapes.' Ecology Letters, 15, pp. 803-812. ."><a href="http://dx.doi.org/10.1111/j.1461-0248.2012.01800.x">Epanchin-Niell et al. (2012)</a></span>  

- 2012 JEEM spatial spread of star thistle: control spread and eradication as an integer programming problem in deterministic context.  (with Wilen)
<span class="showtooltip" title="Epanchin-Niell R and Wilen J (2012). 'Optimal Spatial Control of Biological Invasions.' Journal of Environmental Economics And Management, 63, pp. 260-270. ISSN 00950696."><a href="http://dx.doi.org/10.1016/j.jeem.2011.10.003">Epanchin-Niell & Wilen (2012)</a></span> 

- Breaking landscape into individual landowners makes it less valuable to control early.  


####  Kat Shea

- IDH varying both frequency and intensity. <span class="showtooltip" title="Miller A, Roxburgh S and Shea K (2011). 'How Frequency And Intensity Shape Diversity-Disturbance Relationships.' Proceedings of The National Academy of Sciences, 108, pp. 5643-5648. ISSN 0027-8424."><a href="http://dx.doi.org/10.1073/pnas.1018594108">Miller et al. (2011)</a></span> , experimental example in <span class="showtooltip" title="Hall A, Miller A, Leggett H, Roxburgh S, Buckling A and Shea K (2012). 'Diversity-Disturbance Relationships: Frequency And Intensity Interact.' Biology Letters, 8, pp. 768-771. ISSN 1744-9561."><a href="http://dx.doi.org/10.1098/rsbl.2012.0282">Hall et al. (2012)</a></span> 

- Changing of timing matters more than frequency (e.g. hit weed a key phase of life cycle) <span class="showtooltip" title="Miller A, Roxburgh S and Shea K (2011). 'Timing of Disturbance Alters Competitive Outcomes And Mechanisms of Coexistence in an Annual Plant Model.' Theoretical Ecology, 5, pp. 419-432. ISSN 1874-1738."><a href="http://dx.doi.org/10.1007/s12080-011-0133-1">Miller et al. (2011b)</a></span> .  
- changing autocorrelation of distrubance as a managment strategy 


#### Brian Leung

"Data, uncertainty and risk in biological invasions"

- Alien risk assessments <span class="showtooltip" title="Leung B, Roura-Pascual N, Bacher S, Heikkilä J, Brotons L, Burgman M, Dehnen-Schmutz K, Essl F, Hulme P, Richardson D, Sol D, Vilà M and Rejmanek M (2012). 'Teasing Apart Alien Species Risk Assessments: A Framework For Best Practices.' Ecology Letters, 15, pp. 1475-1493. ."><a href="http://dx.doi.org/10.1111/ele.12003">Leung et al. (2012)</a></span> , shows a dominance of rank scoring over truely quantitative approaches. Limitations to each.  
- It's not the model complexity, but the implementation interface that poses the real barrier. Also need better integration needs.   


-------------

####  Breakout session: Spatial strategies for management

Scott Barrett 



### PDG Control 

- back-and-forth with Paul: is second column redundant?  Seems not: NPV when paying penalty that doesn't exist is: profit under penalty ($\Pi_0(x,h)$) minus zero (adjustment cost), while scaling is set such that profit under penalty _minus adjustment cost_, $\Pi_0(x,h) - \Pi_1(h, c_2)$. Also, better to normalize everything against the adjustment-free ENPV ($Pi_0$) than to normalize by the truth/simulation model (which differs in different cases).  

See [commit log](https://github.com/cboettig/pdg_control/commits/6e81656ce60a5c9f53bb8bd383b388266d72fcf3) for updated versions.  




## References


```r
bibliography()
```


- Rebecca S. Epanchin-Niell, Robert G. Haight, Ludek Berec, John M. Kean, Andrew M. Liebhold, Helen Regan,   (2012) Optimal Surveillance And Eradication of Invasive Species in Heterogeneous Landscapes.  *Ecology Letters*  **15**  803-812  [10.1111/j.1461-0248.2012.01800.x](http://dx.doi.org/10.1111/j.1461-0248.2012.01800.x)
- Rebecca S. Epanchin-Niell, James E. Wilen,   (2012) Optimal Spatial Control of Biological Invasions.  *Journal of Environmental Economics And Management*  **63**  260-270  [10.1016/j.jeem.2011.10.003](http://dx.doi.org/10.1016/j.jeem.2011.10.003)
- A. R. Hall, A. D. Miller, H. C. Leggett, S. H. Roxburgh, A. Buckling, K. Shea,   (2012) Diversity-Disturbance Relationships: Frequency And Intensity Interact.  *Biology Letters*  **8**  768-771  [10.1098/rsbl.2012.0282](http://dx.doi.org/10.1098/rsbl.2012.0282)
- Brian Leung, Nuria Roura-Pascual, Sven Bacher, Jaakko Heikkilä, Lluis Brotons, Mark A. Burgman, Katharina Dehnen-Schmutz, Franz Essl, Philip E. Hulme, David M. Richardson, Daniel Sol, Montserrat Vilà, Marcel Rejmanek,   (2012) Teasing Apart Alien Species Risk Assessments: A Framework For Best Practices.  *Ecology Letters*  **15**  1475-1493  [10.1111/ele.12003](http://dx.doi.org/10.1111/ele.12003)
- A. D. Miller, S. H. Roxburgh, K. Shea,   (2011) How Frequency And Intensity Shape Diversity-Disturbance Relationships.  *Proceedings of The National Academy of Sciences*  **108**  5643-5648  [10.1073/pnas.1018594108](http://dx.doi.org/10.1073/pnas.1018594108)
- Adam David Miller, Stephen H. Roxburgh, Katriona Shea,   (2011) Timing of Disturbance Alters Competitive Outcomes And Mechanisms of Coexistence in an Annual Plant Model.  *Theoretical Ecology*  **5**  419-432  [10.1007/s12080-011-0133-1](http://dx.doi.org/10.1007/s12080-011-0133-1)

