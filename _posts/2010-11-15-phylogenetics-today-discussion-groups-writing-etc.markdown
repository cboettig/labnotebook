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

![](data:image/png;base64,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)

Adding the two remaining examples (rejecting the null, BM v OU.3) and inadequate power (BM v OU.1),

Figures:

![]( http://farm5.staticflickr.com/4091/5180123414_d18351bdd9_o.png )


![]( http://farm2.staticflickr.com/1044/5180123460_d7c672f08b_o.png )


Hope to finish through the discussion of power curves today.


#### ONS Thoughts


Interesting discussion continues about data sharing and NSF's impending policies, particularly see references on [DataDryad blog](http://blog.datadryad.org/2010/11/15/nsf-policy-on-dissemination-and-sharing-of-research-results/).  Applied for and added my (Thompson-Reuters) Researcher ID to my contact info in the footer.

Noam asks me today --  why is it that we reward only publications, as if the  data was the easy step; and then refuse to share data, as if  publication was the easy step? Neither are true but we believe both?
