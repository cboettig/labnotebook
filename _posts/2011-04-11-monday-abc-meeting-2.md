---
comments: true
date: 2011-04-11 16:21:09
layout: post
slug: monday-abc-meeting-2
title: 'Monday: algorithms Meeting'
redirects: [/wordpress/archives/1397, /archives/1397]
categories:
- computation
tags:
- algorithms
---

Yaniv has started an algorithms discussion group. We just met with a few  students to discuss implementing Approximate Bayesian Computing methods from scratch.  Most of us had read (Beaumont, 2010) and (Csilléry _et. al._ 2010)  but also followed [cite source="pubmed"]12524368[/cite] most helpful during the session.

[gist id=914487]

![]( http://farm6.staticflickr.com/5222/5610998871_13dd3c8c88_o.png )


This gets us as far as the regression step, Figure 1 of (Csilléry _et. al._ 2010).  This in part distinguishes the approach from simple rejection sampling.  We'll pick up from here next week.


## Existing Tools


Explored a bit of the existing tools available explicitly for ABC computing.



	
  * ABC-sysBio (Liepe _et. al._ 2010) looks interesting: a Python+GPU enabled toolkit. Models are specified as xml, apparently following the Systems Biology Markup Language, for which their is an existing database, [BioModels](http://www.ebi.ac.uk/biomodels-main/).

	
  * Can't decide if I think having a library of models is ridiculous or brilliant, but the data-base looks well curated and linked to the publications, which is rather nice.  If there are models linked to multiple papers I'd be particularly interested, but not sure if it's enough of a standard to be useful, or if most modelers want to learn an XML markup when they already have there own familiar syntax for model specification.

	
  * [ABCToolbox](http://www.cmpg.iee.unibe.ch/content/softwares__services/computer_programs/abctoolbox/index_eng.html) Haven't explored this one, written in C++.

	
  * The [Wikipedia entry](http://en.wikipedia.org/wiki/Approximate_Bayesian_computation) seems to have a decent entry with links to literature and existing tools



## References


- Beaumont M (2010).
"Approximate Bayesian Computation in Evolution And Ecology."
*Annual Review of Ecology, Evolution, And Systematics*, **41**.
ISSN 1543-592X, <a href="http://dx.doi.org/10.1146/annurev-ecolsys-102209-144621">http://dx.doi.org/10.1146/annurev-ecolsys-102209-144621</a>.

- Csilléry K, Blum M, Gaggiotti O and François O (2010).
"Approximate Bayesian Computation (Abc) in Practice."
*Trends in Ecology &amp; Evolution*, **25**.
ISSN 01695347, <a href="http://dx.doi.org/10.1016/j.tree.2010.04.001">http://dx.doi.org/10.1016/j.tree.2010.04.001</a>.

- Liepe J, Barnes C, Cule E, Erguler K, Kirk P, Toni T and Stumpf M (2010).
"Abc-Sysbio&ndash;Approximate Bayesian Computation in Python With Gpu Support."
*Bioinformatics*, **26**.
ISSN 1367-4803, <a href="http://dx.doi.org/10.1093/bioinformatics/btq278">http://dx.doi.org/10.1093/bioinformatics/btq278</a>.
