---
comments: true
date: 2010-11-15 22:37:52
layout: post
slug: phylogenetics-today-discussion-groups-writing-etc
title: 'evolution today:  Discussion groups, writing, etc'
redirects: [/wordpress/archives/326, /archives/326]
categories:
- open-science
- evolution
---

Interesting discussion of [a Lenski paper](http://www.mendeley.com/research/genome-evolution-and-adaptation-in-a-longterm-experiment-with-escherichia-coli?utm_source=desktop&utm_medium=0.9.8.1&utm_campaign=open_catalog&userDocumentId={98edad94-30b4-4e6e-a905-243c3391c835}) in Wainwright's 270.

Barrick, J.E. et al. Genome evolution and adaptation in a long-term experiment with Escherichia coli. Nature 461, 1243-7(2009).

Seems to focus on surprise of continuing linear rate of increase in beneficial mutations, though statistics don't seem to confirm.  Curious about uncertainty in assay of fitness estimates (seem to go down at times, but surely not fixing deleterious mutations).  General difficulties in setup of exponential growth with applications of classic constant population size, but maybe we're all missing something.  Curious if the evolution isn't driven entirely by jettisoning unnecessary protein production, genes, etc to speed up replication time.


### Articles & Reading


Surprised this morning to come across an article about parthenogenesis in a [newspaper](http://www.charlotteobserver.com/2010/11/15/1839395/these-super-snakes-dont-need-a.html) (from the twitter network).

Didn't know that was possible, had to dig around in the literature a bit more for [the article](http://rsbl.royalsocietypublishing.org/content/early/2010/10/21/rsbl.2010.0793.abstract).  Apparently this has been shown not only in almost every vertebrate lineage (as this paper on [parthenogenesis in sharks mentions](http://rsbl.royalsocietypublishing.org/content/3/4/425.full)) except mammals.  Yes, a colleague pointed out it has been found in chickens, turkeys, pigeons, and zebra finch.  Wow.


### Likelihood ratio paper:


Figuring out if it's worth discussing the connection between the concepts of power and information in this paper.  For instance, could include Kulback-Liebler mutual information between the distributions of likelihood ratios generated under each model, rather than frame the discussion in terms of the null and test hypotheses and 95% confidence level, etc.  May at least add the computation into the software package.

![D_{\mathrm{KL}}(P\|Q) = \int_{-\infty}^\infty p(x) \log \frac{p(x)}{q(x)} \; dx, \!](http://upload.wikimedia.org/math/b/9/4/b9494fe37085e28fb04643bce8600f90.png)

Adding the two remaining examples (rejecting the null, BM v OU.3) and inadequate power (BM v OU.1),

Figures:

![]( http://farm5.staticflickr.com/4091/5180123414_d18351bdd9_o.png )


![]( http://farm2.staticflickr.com/1044/5180123460_d7c672f08b_o.png )


Hope to finish through the discussion of power curves today.


#### ONS Thoughts


Interesting discussion continues about data sharing and NSF's impending policies, particularly see references on [DataDryad blog](http://blog.datadryad.org/2010/11/15/nsf-policy-on-dissemination-and-sharing-of-research-results/).  Applied for and added my (Thompson-Reuters) Researcher ID to my contact info in the footer.

Noam asks me today --  why is it that we reward only publications, as if the  data was the easy step; and then refuse to share data, as if  publication was the easy step? Neither are true but we believe both?
