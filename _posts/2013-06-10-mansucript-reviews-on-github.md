---
title: 'manuscript reviews on github?'
subtitle: 'examples and questions'
layout: post
category: open-science
tags:
- blog

---


I was recently impressed to learn of Trevor Bedford's strategy of seeking [pre-approval](https://twitter.com/trvrb/status/334310856982671361) for posting his reviewer's comments as Github issues.  Beyond providing links to the data and source-code, I generally don't advertise the open science nature of papers I submit -- I guess I assume that if the reader or reviewers care, it should be easy enough for them to discover it. Consequently I am usually immediately frustrated to realize that upon receiving my reviews I have to create a second, private repository for the review material, our replies to reviewers, etc., as I don't have permission to disclose that information. [^1]  I have recently stumbled across [several](http://www.steinsaltz.me.uk/pnas.html) [examples](http://theseamonster.net/2013/05/are-unreasonably-harsh-reviewers-retarding-the-pace-of-coral-reef-science/) of authors publishing to the web anonymous reviews they have received.  Though anonymous, I feel the practice potentially murky without explicit permission, so I would appreciate any insight others have on this.  


### Asking permission

Trevor's approach suggests I should consider broaching this question when first submitting my review, so I am puzzling over the best way to do so.  One option would be to include such a request in the cover letter.  For example,

> The authors of this manuscript would like to request that the editor and reviewers indicate in their replies if they consent or decline to have their comments posted anonymously in the public [Issues Tracker](#) of this paper.  

Does that need more explanation? A link to examples like [Trevor's](https://github.com/trvrb/flux/issues?labels=reviewer+1) that have done this before? Do I need to explain the value of having this kind of transparent provenance for the paper? Should I mention how this could give the reviewer more transparent credit?  Encourage them to comment directly on Github from their own account?  

Does this need the blessing of the journal? How would you feel about such a clause as a reviewer or editor?  For a recent review I had done of a paper that was similarly written on Github, I obtained the Journal's permission to post my review as an [issue](https://github.com/weecology/data-sharing-paper/issues/71) in their repository. I would love to see more examples of this kind of thing, if anyone has come across them.  



## Cover letters for open science manuscripts?


While I lean towards a minimal statement such as the one above, perhaps a cover letter would be a good place to document some of the other open and reproducible features of the manuscript?  Or perhaps such statements should be added to the manuscript itself?  Among the options, I might point out:

1. The manuscript has been written on Github.  Consequently the full drafting and **revision history** is available, along with graphs of author contributions (which omit authors without Github accounts and may be distorted by trivial line changes)
2. The manuscript has been written with all the code necessary to repoduce the results embedded as a [knitr](http://yihui.name/knitr) **dynamic document**.  This helps ensure the analysis is always in synch with the results presented in the manuscript and the that the research is reproducible.  The analysis, figures, and manuscript can be reassembled from scratch by typing `make pdf` in the repository directory.  
3. **Code** to replicate the analysis and produce each of the figures shown can be found at:  (Version-stable lnk to the appropriate Github pages? Deposit in Figshare/Dryad first?)  
4. **Data** to replicate the analysis and data shown in each of the figures can be found at: (Easiest to link to Github, since the code and data already reside there.  
_Alternatively I could deposit these in [Figshare](http://figshare.com) or [Dryad](http://datadryad.org) first...)_
5. The manuscript, code, data, and documentation are available **as an R package in the Github repository**.  
6. The **issues tracker** associated with the manuscript's repository provides a record of this research, including lines of investigation that were resolved into the results presented here, lines that were closed as dead-ends or null results, and outstanding issues for further investigation.  
7. The **daily lab notebook entries** accompanying this research can be found under the [project-tag](/tags) between dates of XX and XX.  

Listing all of these would make for a somewhat lengthy cover letter, which might be a bit overwhelming to be useful (or seem more promotional than valuable).  Are any of the seven things above worth highlighting in particular?  

Perhaps these details could be deferred to a README file in the project's Github repo, and the cover letter could simply provide a link to the project repository?  What, if anything, would appear most useful and accessible to a reviewer unfamiliar with this approach or its potential value? Though elements of this approach have been discussed in the published literature, e.g. <span class="showtooltip" title="Gentleman R and Temple Lang D (2007). Statistical Analyses And
Reproducible Research. _Journal of Computational And Graphical
Statistics_, *16*. ISSN 1061-8600, 
http://dx.doi.org/10.1198/106186007X178663."><a href="http://dx.doi.org/10.1198/106186007X178663" rel="http://purl.org/spar/cito/citesAsEvidence" >Gentleman & Temple Lang (2007)</a></span> 'compendium' concept, <span class="showtooltip" title="Stodden V (2009). Enabling Reproducible Research: Open Licensing
for Scientific Innovation. 
http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1362040. 
http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1362040."><a href="http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1362040" rel="http://purl.org/spar/cito/citesAsEvidence" >Stodden (2009)</a></span> RRS concept, or <span class="showtooltip" title="Peng R (2011). Reproducible Research in Computational Science.
_Science_, *334*. ISSN 0036-8075, 
http://dx.doi.org/10.1126/science.1213847."><a href="http://dx.doi.org/10.1126/science.1213847" rel="http://purl.org/spar/cito/citesAsEvidence" >Peng (2011)</a></span> reproducible papers in the Journal of Biostatistics, I'm unsure if pointing a reviewer to these references would be more valuable or more confusing.  Let me know what you think.   



[^1]: Strictly speaking the edits to the manuscript in the open repository could also be considered confidential, though at that stage I haven't yet signed the copyright agreements that come with publication, which tend to be quite reasonable even for the traditional subscription based journals I work with

## References


- Robert Gentleman, Duncan Temple Lang,   (2007) Statistical Analyses And Reproducible Research.  *Journal of Computational And Graphical Statistics*  **16**  [10.1198/106186007X178663](http://dx.doi.org/10.1198/106186007X178663)
- R. D. Peng,   (2011) Reproducible Research in Computational Science.  *Science*  **334**  [10.1126/science.1213847](http://dx.doi.org/10.1126/science.1213847)
- Victoria Stodden,   (2009) Enabling Reproducible Research: Open Licensing for Scientific Innovation.  [http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1362040](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1362040)

