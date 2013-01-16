---
layout: post
tags: [ Labrids]
categories: evolution
---





 





Research
--------

### Labrid Paper Outline

Biology Letters
[format](http://rsbl.royalsocietypublishing.org/site/misc/styleandpolicy.xhtml "http://rsbl.royalsocietypublishing.org/site/misc/styleandpolicy.xhtml"),
2500 words, 2 figures.

![Fig 1](http://openwetware.org/images/thumb/7/71/2_data.png/100px-2_data.png)


Fig 1?

![Fig 2?](http://openwetware.org/images/thumb/f/f7/Bootstrap_models.png/100px-Bootstrap_models.png)


Fig 2?

-   **Title**: *Phylogenetic Evidence for Multiple Morphological Niches
    in Coral Reef Fish*
-   **Summary** (< 200 words)
    -   We present phylogenetic evidence for two distinct evolutionary
        optima in the fin morphology of Labrid Fish.

-   **Keywords**: Evolution, Phylogenetics, Comparative Methods,
    Labrids, Multiple Niches
-   **Introduction**
    -   Labrid Fin Morphology
    -   Is clustering in Trait space evidence of Selection or
        Phylogenetic Inertia?

-   **Material and Methods**
    -   as in this entry

-   **Results**
    -   Evidence for and significance of the two-peak model

-   **Figures**
    -   possibly fin morphology and data in single panel? Maybe
        bootstraps as well?

-   **Discussion**

1.  Understanding multiple niches within current methodology
2.  Novel methodology to approach this in a phylogenetic context
3.  Future questions

-   **Acknowledgements**
-   **References**

Computing
---------

### R Package -- To Do

-   Should move example scripts into a demo directory
-   Should wrap as an R package
-   Need function to automate the analysis of bootstrap data and
    recommend the right number of peaks
-   Need prototype stochastic partition and stochastic reconstruction

Misc / Notes
------------

### F1000 reviews

﻿Constable, H. et al., 2010. VertNet: a new model for biodiversity data
sharing. PLoS biology, 8(2), e1000309. Available at:
[http://www.ncbi.nlm.nih.gov/pubmed/20169109](http://www.ncbi.nlm.nih.gov/pubmed/20169109 "http://www.ncbi.nlm.nih.gov/pubmed/20169109").
*Must read*

**Summary:** Authors describe VertNet, a cloud-computing resource for
vertibrate biodiversity data. Data is publicly accessible can be user
annotated while remaining contributor-mediated, retaining primacy and
expertise of the orignal contributor.

**Opinion:** Scientists have long argued for the importance of openly
accessible, standardized and georeferenced biodiversity data. This work
represents a significant accomplishment in overcoming technological,
sociological, and idiosynchratic barriers to make this a reality.

\
 ﻿Cadotte, M.W. et al., 2010. Phylogenetic diversity metrics for
ecological communities: integrating species richness, abundance and
evolutionary history. Ecology Letters, 13(1), 96-105. Available at:
[http://blackwell-synergy.com/doi/abs/10.1111/j.1461-0248.2009.01405.x](http://blackwell-synergy.com/doi/abs/10.1111/j.1461-0248.2009.01405.x "http://blackwell-synergy.com/doi/abs/10.1111/j.1461-0248.2009.01405.x").
*Recommended*

**Summary:** Existing phylogenetic diversity metrics do not account for
relative abundance.

**Opinion:** This work represents a significant improvement on existing
approaches of phylogenetic diversity which are commonly used to evaluate
species conservation value.

\
 Ziebarth, N.L., Abbott, K.C. & Ives, A.R., 2010. Weak population
regulation in ecological time series. Ecology letters, 13(1), 21-31.
Available at:
[http://www.ncbi.nlm.nih.gov/pubmed/19849710](http://www.ncbi.nlm.nih.gov/pubmed/19849710 "http://www.ncbi.nlm.nih.gov/pubmed/19849710").
*Recommended*

**Summary:** Authors evaluate two large data collections of population
dynamics to find that many long time series express only weak regulation
using autoregressive moving average (ARMA) models. The variation of the
stationary distribution relative to the variation in the moving average
component is taken as the measure of population regulation (1 if strong,
much larger under weaker regulation).

**Opinion:** An intriguing paper that brings extensive analysis to a
long-standing and fundamental question in population biology. These
methods deserve further exploration for their ability to detect strong
regulation, as it should be possible to establish confidence intervals
on this estimate.

### Mendeley

-   Can I get an rss feed of articles I've recently added to my Mendeley
    collection? Two-way cite-u-like integration? *To explore later*

### Libraries for stochastic simulation

-   with various levels of course graining, different tau-leaping
    methods, sdes, etc. Will have to explore more at some point, should
    see if Arkin's group uses any either. See:
-   [SynBioSS](http://synbioss.sourceforge.net/simulator/examples/ "http://synbioss.sourceforge.net/simulator/examples/")
-   [Cain](http://cain.sourceforge.net/ "http://cain.sourceforge.net/")
-   Came across more tau-leaping methods for [spatial
    dynamics](http://hdl.handle.net/10.1063/1.3310808 "doi:10.1063/1.3310808")
    and
    [another](http://hdl.handle.net/10.1073/pnas.0809340106 "doi:10.1073/pnas.0809340106")
    how to do tau-leaping when timescales vary widely (stiff dynamics).
-   Mario has some interesting [entries on Gillespie
    methods](http://pineda-krch.com/category/gillespie-algorithm/ "http://pineda-krch.com/category/gillespie-algorithm/")
    as well.

### Other

-   [Interesting
    post](https://www.hypios.com/thinking/2010/03/18/facebook-for-scientists-a-scientist-weighs-in/ "https://www.hypios.com/thinking/2010/03/18/facebook-for-scientists-a-scientist-weighs-in/")
-   [neat github collaboration
    map](http://flowingdata.com/2010/03/31/mapping-the-github-community/# "http://flowingdata.com/2010/03/31/mapping-the-github-community/#")
    might be worth learning more about this kind of visualization.

