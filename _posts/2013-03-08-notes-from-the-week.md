---
layout: post
category: ecology
tags: 
- warning-signals
- nonparametric-bayes
- notebook-technology

---

(Working from Galveston this week while at Louise's conference, looking after little one. some progress below.)

## Monday 

#### Alan Skype meeting

* Comment piece / reply
* [ews-review](https://github.com/cboettig/ews-review)
* Comments on TE review?
* IARPA Conference, funding options?

#### Tasks 

* On Marc's suggestion, writing comparison of pattern-based and mechanism based approaches to modeling, particularly in decision theory context. [draft](https://github.com/cboettig/nonparametric-bayes/blob/cb0f7d5f779bb424e5fb02b06463f946c360017d/inst/doc/beyond-mechanistic-models.md) in nonparametric-bayes
* Review edits and writing on [ews-review](https://github.com/cboettig/ews-review)

## Tuesday 

#### Kathy Skype

* Decision theory in early warning signals?
* NCEAS / SESYNC working group?
* Long term lake monitoring data, including some sedimentary analysis (see <span rel="tooltip" title="Wang R, Dearing J, Langdon P, Zhang E, Yang X, Dakos V and
Scheffer M (2012). Flickering Gives Early Warning Signals of A
Critical Transition to A Eutrophic Lake State. _Nature_, *492*.
ISSN 0028-0836,  http://dx.doi.org/10.1038/nature11655."><a href="http://dx.doi.org/10.1038/nature11655" rel="http://purl.org/spar/cito/discusses" >Wang _et. al._ (2012)</a></span>).  
* Send Kathy TREE articles: <span rel="tooltip" title="Polasky S, Carpenter S, Folke C and Keeler B (2011).
Decision-Making Under Great Uncertainty: Environmental Management
in an Era of Global Change. _Trends in Ecology & Evolution_,
*26*. ISSN 01695347, 
http://dx.doi.org/10.1016/j.tree.2011.04.007."><a href="http://dx.doi.org/10.1016/j.tree.2011.04.007" rel="http://purl.org/spar/cito/discusses" >Polasky _et. al._ (2011)</a></span> and <span rel="tooltip" title="Fischer J, Peterson G, Gardner T, Gordon L, Fazey I, Elmqvist T,
Felton A, Folke C and Dovers S (2009). Integrating Resilience
Thinking And Optimisation For Conservation. _Trends in Ecology &
Evolution_, *24*. ISSN 01695347, 
http://dx.doi.org/10.1016/j.tree.2009.03.020."><a href="http://dx.doi.org/10.1016/j.tree.2009.03.020" rel="http://purl.org/spar/cito/discusses" >Fischer _et. al._ (2009)</a></span>.  

## Tasks

* Writing comparison of pattern-based and mechanism based approaches to modeling, particularly in decision theory context
* Review edits and writing on [ews-review](https://github.com/cboettig/ews-review)


## Wednesday 

* more of the same.  


## Friday

* Finished and submitted [ews-review](https://github.com/cboettig/ews-review).  
* See commit log and [issues](https://github.com/cboettig/ews-review/issues) tracker for details.  



## Notebook: Semantics,

* stemming-based search seems to perform poorly -- i.e. cannot find phrases, weight terms in titles, etc, just most frequently occuring terms in a post.  Trying lunr, loads full text into memory but should do so only on selecting search bar? See issue [#7](https://github.com/cboettig/labnotebook/issues/7)

* Modified google-analytics plugin to make single call to the API see issue [#66](https://github.com/cboettig/labnotebook/issues/66)

* Tuning RDFa, primarily on vita. [#22](https://github.com/cboettig/labnotebook/issues/22) [#63](https://github.com/cboettig/labnotebook/issues/63).  Tuned FOAF referencing to common nodes.  Note that `rel` always applys to links while `property` applies to the content of the tag (e.g. anchor text, span context).  Use `rel` in span and div elements, etc, to apply to multiple links.  

## References

- Joern Fischer, Garry D. Peterson, Toby A. Gardner, Line J. Gordon, Ioan Fazey, Thomas Elmqvist, Adam Felton, Carl Folke, Stephen Dovers,   (2009) Integrating Resilience Thinking And Optimisation For Conservation.  *Trends in Ecology & Evolution*  **24**  [10.1016/j.tree.2009.03.020](http://dx.doi.org/10.1016/j.tree.2009.03.020)
- Stephen Polasky, Stephen R. Carpenter, Carl Folke, Bonnie Keeler,   (2011) Decision-Making Under Great Uncertainty: Environmental Management in an Era of Global Change.  *Trends in Ecology & Evolution*  **26**  [10.1016/j.tree.2011.04.007](http://dx.doi.org/10.1016/j.tree.2011.04.007)
- Rong Wang, John A. Dearing, Peter G. Langdon, Enlou Zhang, Xiangdong Yang, Vasilis Dakos, Marten Scheffer,   (2012) Flickering Gives Early Warning Signals of A Critical Transition to A Eutrophic Lake State.  *Nature*  **492**  [10.1038/nature11655](http://dx.doi.org/10.1038/nature11655)

