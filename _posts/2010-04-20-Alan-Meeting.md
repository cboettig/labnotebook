---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Alan Meeting
---






 








*From 03/31, see [below](#Updated_Outline) for more!*

### Outline

**Title**

*On the ability to detect leading indicators of catastrophe in
unreplicated time series*

**Introduction** Background on Warning Signals

1.  [literature](http://www.mendeley.com/research-papers/collections/1374711/EarlyWarningSigns/ "http://www.mendeley.com/research-papers/collections/1374711/EarlyWarningSigns/")
2.  Saddle Node bifurcation
3.  Detecting decreasing stabilization -- gradual vs changepoint
    estimation

Reasons detection can fail:

1.  Ergodicity: ensembles vs single instances
2.  Sufficient statistical power
3.  Appropriate dynamics

**Methods**

-   Defining an indicator -- significant Kendall rank correlation
    coefficient τ as in
    [doi:10.1073/pnas.0802430105](http://hdl.handle.net/10.1073/pnas.0802430105 "doi:10.1073/pnas.0802430105")
-   Simulation approach
-   Analytic limits
-   accounting for delay?

**Figures**

-   Saddle node bifurcation example -- should discuss difference between
    stochastic and deterministic edge?
-   Single replicates using standard detection statistics

**Results/Discussion**

-   Misleading indicators
-   Need for further exploration

\

### Towards a better approach

-   Estimating the linear system directly:

1.  estimating the exponential coefficient λ of the autocorrelation
    function directly. Contrast to the autocorrelation. Estimating
    spectral width.
2.  estimating variance directly: ![ \\frac{\\sigma\^2}{2\\lambda }
    ](http://openwetware.org/images/math/2/f/e/2fed1c2e179a9874a35108bdcbfdbd48.png)

Compare to ARMA approach of

1.  [Ziebarth NL, Abbott KC, and Ives AR.
    .](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/elink.fcgi?cmd=prlinks&dbfrom=pubmed&retmode=ref&id=19849710 "View or buy article from publisher (if available)")
    pmid:19849710.
    [PubMed](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&rettype=abstract&id=19849710 "PMID 19849710")
    [HubMed](http://www.hubmed.org/display.cgi?uids=19849710 "PMID 19849710")
    [Ives2010]

-   Changepoint analysis vs gradual trends.
    -   i.e. [web
        example](http://www.variation.com/cpa/tech/changepoint.html "http://www.variation.com/cpa/tech/changepoint.html"),
    -   [book](http://www.gbv.de/dms/goettingen/230144551.pdf "http://www.gbv.de/dms/goettingen/230144551.pdf"),
    -   Bayesian / Dirchelet Process Prior analysis,
    -   model selection.

-   Examples from software:
    -   correlation C executable
    -   R: source("warning\_signals.R") example.

### Other topics

-   F1000
-   Workstation order
-   Adaptive Dynamics manuscript
-   Labrids Manuscript

Updated Outline
---------------

1.  Warning Signals intro (Alan)
2.  Scope & previous work -\> 1D (Alan)
3.  Reasons Detection can fail (Carl)
4.  Methods -\> defining an indicator (Carl)
5.  Simulation approach (Carl)
6.  Analytic limits (Carl -- still to do)
7.  Accounting for delay (Carl -- still to do)
8.  Results -- saddle node (Carl -- still to do)
9.  Results -- single replicate (Carl -- still to do)
10. Conclusions (Alan / both)

[style
guidelines](http://www.sciencemag.org/about/authors/prep/prep_init.dtl "http://www.sciencemag.org/about/authors/prep/prep_init.dtl")

\

