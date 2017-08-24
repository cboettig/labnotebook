---
layout: post
tags: [tribolium, warning-signals]
categories: [ecology]
title: Alan Meeting
---






 








### Updates

1.  Likelihood calculation for beetle model.
2.  Proposed model and calculations Linear parameter change for warning
    signal model. Results in a few test cases.
3.  Likelihood methods within SDE framework, an outline of methods.
    Subtle problems, good approximations, powerful approaches.

\

### Questions

1.  LPA vs ELLPA model
2.  Defining state space in individual-based model vs stage based model,
    setting initial conditions? ***Conclusion:*** Means non-Markovian
    system, so likelihood isn't determined in one step approach. More
    lit review, see: Ellner [[1](#bibkey_Ellner)], Perry,
    [[2](#bibkey_Perry), [3](#bibkey_Perry2), [4](#bibkey_Perry3)]
3.  Calculating likelihood while accounting for non-independence of the
    occupancy of each stage? Focus on one class? ***Conclusions:***
    Choose Larvae.

### Parameter fitting

On likelihood based model selection vs model based estimates of process:

-   Some cases maximum likelihood estimate agrees with statistical
    definition -- variance definition is mle of sigma parameter for
    indep gaussian random numbers, the arithmetic mean is the mle for
    lambda in the poisson, etc. Doesn't necessarily hold true in these
    time-series analyses, at least for numerical fitting. Would be
    better to estimate theta from the mean and search for other
    parameters.
-   requires more precise parameterization

\


## References

1.  [Ellner SP and Rees M.
    .](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/elink.fcgi?cmd=prlinks&dbfrom=pubmed&retmode=ref&id=16673349 "View or buy article from publisher (if available)")
    pmid:16673349.
    [PubMed](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&rettype=abstract&id=16673349 "PMID 16673349")
    [HubMed](http://www.hubmed.org/display.cgi?uids=16673349 "PMID 16673349")
    [Ellner]
2.  [De Valpine P.
    .](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/elink.fcgi?cmd=prlinks&dbfrom=pubmed&retmode=ref&id=19886497 "View or buy article from publisher (if available)")
    pmid:19886497.
    [PubMed](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&rettype=abstract&id=19886497 "PMID 19886497")
    [HubMed](http://www.hubmed.org/display.cgi?uids=19886497 "PMID 19886497")
    [Perry]
3.  [Polansky L, de Valpine P, Lloyd-Smith JO, and Getz WM.
    .](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/elink.fcgi?cmd=prlinks&dbfrom=pubmed&retmode=ref&id=19739392 "View or buy article from publisher (if available)")
    pmid:19739392.
    [PubMed](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&rettype=abstract&id=19739392 "PMID 19739392")
    [HubMed](http://www.hubmed.org/display.cgi?uids=19739392 "PMID 19739392")
    [Perry2]
4.  [de Valpine P.
    .](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/elink.fcgi?cmd=prlinks&dbfrom=pubmed&retmode=ref&id=19425421 "View or buy article from publisher (if available)")
    pmid:19425421.
    [PubMed](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&rettype=abstract&id=19425421 "PMID 19425421")
    [HubMed](http://www.hubmed.org/display.cgi?uids=19425421 "PMID 19425421")
    [Perry3]

All Medline abstracts:
[PubMed](http://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&rettype=abstract&id=16673349,19886497,19739392,19425421 "All abstracts at PubMed")
[HubMed](http://www.hubmed.org/display.cgi?uids=16673349,19886497,19739392,19425421 "All abstracts at HubMed")

\

Research: Themes for Weds/Thurs workshop with Bob and Brett
-----------------------------------------------------------

*Why is this all important?*

-   Importance of space
-   Importance of environmental variation
-   Importance of intrinsic variation <- us

*A recipe for trouble*

-   Age or stage structure
-   Density dependence
-   demographic stochasticity

Reading / Misc
--------------

### Open Access

-   Answering a question for a colleague about whether posting on arxiv
    was consistent with [Elsevier's
    policies](http://www.elsevier.com/wps/find/authorsview.authors/copyright "http://www.elsevier.com/wps/find/authorsview.authors/copyright").
    ([It
    is](http://www.elsevier.com/wps/find/authorshome.authors/preprints "http://www.elsevier.com/wps/find/authorshome.authors/preprints")).
    Many Eslevier journals including TPB provide a watermarked authors
    copy of post-publication pdf explicitly for posting on the author's
    website and sharing with colleagues.

\

-   Fun stats: [90% of
    journals](http://romeo.eprints.org/stats.php "http://romeo.eprints.org/stats.php")
    allow archiving preprints, many major funders (NIH, Wellcome) and
    require open archives, and the
    [FRPAA](http://www.arl.org/sparc/advocacy/frpaa/index.shtml "http://www.arl.org/sparc/advocacy/frpaa/index.shtml")
    bill now before congress would require it for almost all public
    funding. [Very few publishers
    maintain](http://www.eprints.org/openaccess/self-faq/#self-archiving-legal "http://www.eprints.org/openaccess/self-faq/#self-archiving-legal")
    the Ingelfinger rule of refusing to publish things that are archived
    before publication. Open archives are now the norm.

-   arXiv's
    [endorsement](http://arxiv.org/help/endorsement "http://arxiv.org/help/endorsement")
    system seems to be a source of confusion sometimes. [Our TPB
    paper](http://arxiv.org/abs/1004.4233 "http://arxiv.org/abs/1004.4233")
    on arXiv.

### Open Education

-   [This is how we
    dream](http://www.youtube.com/watch?v=PHvoBPjhsBA "http://www.youtube.com/watch?v=PHvoBPjhsBA")
    a fantastic piece on the changing media of writing. [part
    2](http://www.youtube.com/watch?v=6KsEQnOkTZ0&feature=related "http://www.youtube.com/watch?v=6KsEQnOkTZ0&feature=related").
    From Richard Miller, at Rutgers.
-   [AcademiX](http://edseminars.apple.com/event/2610 "http://edseminars.apple.com/event/2610")
    an exciting conference on the open future of learning.

\

