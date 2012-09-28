---
layout: post
tags: [Labrids, Open Notebook Thoughts, Model_Choice]
categories:  Comparative_Phylogenetics
---





 





Research
--------

-   Wrote summary function using bootstrap confidence intervals for the
    bootstraps of the likelihoods directly.
-   **On interpreting** the bootstraps of likelihoods directly:

1.  The extent to which the distributions themselves are distinct
    provides an indication of the ability to distinguish between models
    on the given phylogenetic tree and the actual data. For instance, if
    the tree was a star tree and the data produced by either BM or OU1,
    then all distributions would fall on top of one another.
2.  The extent to which the observed likelihood matches those produced
    by the bootstraps under that model gives an indication of how well
    that model is fitting the actual data.
3.  May also be interesting to look at the bootstrap confidence
    intervals around theta parameters, to see if they are distinct.

### Labrids

![200 reps, bootstraps that refit
painting](http://openwetware.org/images/thumb/1/18/Labrids.png/200px-Labrids.png)

![image](/skins/common/images/magnify-clip.png)

200 reps, bootstraps that refit painting

-   observed likelihoods of BM & OU1 are indistinguishable from one
    another but outside the 95% confidence interval of the other
    distributions. The observed likelihoods lie easily within the
    distribution produced by those models for both BM & OU1.

-   Observed likelihood for OU2 falls within the bootstrap likelihoods
    produced under OU2.

-   Observed likelihood for OU3 and OU4 fall significantly below the
    likelihoods expected by data simulated under these models,
    suggesting that OU2 is indeed the best fit.

### Anoles

![2000 reps, painting fixed, refit hansen
pars](http://openwetware.org/images/thumb/2/20/Anoles.png/200px-Anoles.png)

![image](/skins/common/images/magnify-clip.png)

2000 reps, painting fixed, refit hansen pars

-   The observed likelihood scores of the first three models (BM, OU1,
    OU3) lie within the 95% confidence intervals for those models.
-   The observed likelihood scores of OU4 and OU(LP) lie within the 95%
    confidence intervals of all models.

\

NESCent
-------

### Possible topics

\1. Comparative Methods Workflow in R -- hackathon

-   Interfaces between programs
-   Extensibility of existing software
-   Redundancy of approaches
-   User / developer dialog and interface

\2. Reliability: evaluating the robustness of current methods

-   Model choice criteria
-   Robustness to assumptions in tree, etc

\3. Future of methods

-   Bayesian implementations
-   High-dimensional data
-   databases, standards

\

### People

-   [Marc
    Lajeunesse](http://www.nescent.org/science/awards_summary.php?id=66 "http://www.nescent.org/science/awards_summary.php?id=66")
-   [Liam
    Revell](http://www.nescent.org/science/awards_summary.php?id=184 "http://www.nescent.org/science/awards_summary.php?id=184")
-   [Hilmar
    Lapp](http://www.linkedin.com/in/hlapp "http://www.linkedin.com/in/hlapp")
-   [Todd
    Vision](http://visionlab.bio.unc.edu/ "http://visionlab.bio.unc.edu/")
-   Sam Price
-   [Brian
    O'Meara](http://www.brianomeara.info/ "http://www.brianomeara.info/")

Notes and Reading
-----------------

-   [Federal Research Public Access
    Act](http://www.arl.org/sparc/advocacy/frpaa/index.shtml "http://www.arl.org/sparc/advocacy/frpaa/index.shtml"),
    mentioned in
    [Nature](http://www.nature.com/news/2010/100407/full/464822a.html "http://www.nature.com/news/2010/100407/full/464822a.html")
    article on rise of open access.
-   another [Nature
    article](http://www.nature.com/nature/journal/v464/n7290/full/464813a.html "http://www.nature.com/nature/journal/v464/n7290/full/464813a.html").
    on open access.
-   I'm mentioned in [*Science
    Careers*](http://sciencecareers.sciencemag.org/career_magazine/previous_issues/articles/2010_04_09/caredit.a1000036 "http://sciencecareers.sciencemag.org/career_magazine/previous_issues/articles/2010_04_09/caredit.a1000036")
    on Open Notebook Science.
    -   Article discussed by [Jean-Claude
        Bradley](http://usefulchem.blogspot.com/2010/04/scientists-embrace-openness-article-in.html "http://usefulchem.blogspot.com/2010/04/scientists-embrace-openness-article-in.html"),
        [friendfeed](http://bit.ly/aV94bp "http://bit.ly/aV94bp"),
        [Nature
        blogs](http://blogs.nature.com/stories/2590 "http://blogs.nature.com/stories/2590"),
        [qbit](http://timestopsnow.blogspot.com/2010/04/science-moves-toward-becoming-more-open.html "http://timestopsnow.blogspot.com/2010/04/science-moves-toward-becoming-more-open.html"),
        [Duncan
        Hull](http://duncan.hull.name/2010/04/08/ons/ "http://duncan.hull.name/2010/04/08/ons/"),
        [Anthony](http://gradness.blogspot.com/2010/04/kochlab-and-other-labs-in-news.html "http://gradness.blogspot.com/2010/04/kochlab-and-other-labs-in-news.html"),
        [library](https://www.lib.uwo.ca/blogs/digitalscholarly/2010/04/openness-in-sci.html "https://www.lib.uwo.ca/blogs/digitalscholarly/2010/04/openness-in-sci.html"),
        [Deepak](http://mndoci.com/2010/04/09/the-open-guys-hit-the-big-time/ "http://mndoci.com/2010/04/09/the-open-guys-hit-the-big-time/")


