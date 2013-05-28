---
published: false
layout: post
category: open-science
tags:
- blog

---


I was recently impressed to learn of Trevor Bedford's strategy of seeking [pre-approval](https://twitter.com/trvrb/status/334310856982671361) for posting his reviewer's comments as Github issues.  Beyond providing links to the data and source-code, I generally don't advertise the open science nature of papers I submit -- I guess I assume that if the reader or reviewers care, it should be easy enough for them to discover it. Consequently I am usually immediately frustrated to realize that upon receiving my reviews I have to create a second, private repository for the review material, our replies to reviewers, etc, as I don't have permission to disclose that information. [^1]  I have recently stumbled across [several]() [examples]() of authors publishing to the web anonymous reviews they have received.  Though anonymous, I feel the practice potentially murky without explicit permission, so I would appreciate any insight others have on this.  


Trevor's example suggests I should consider broaching this question when first submitting my review, so I am puzzling over the best way to do so.  One option would be to include such a request in the cover letter.  For example,

> The authors of this manuscript would like to request that the editor and reviewers indicate in their replies if they consent or decline to have their comments posted anonymously in the public [Issues Tracker](#) of this paper.  

Does that need more explanation? A link to examples like [Trevor's]() that have done this before? Do I need to explain the value of having this kind of transparent provenance for the paper? Should I mention how this could give the reviewer more transparent credit?  Encourage them to comment directly on Github from their own account?  

Does this need the blessing of the journal? How would you feel about such a clause as a reviewer or editor?  

While I lean towards a minimal statement such as the one above, perhaps a cover letter would be a good place to document some of the other open and reproducible features of the manuscript?  Or perhaps such statements should be added to the manuscript itself?  Among the options, I might point out:

1. The manuscript has been written on Github.  Consequently the full drafting and revision history is available, along with graphs of author contributions (which omit authors without Github accounts and may be distorted by trivial line changes)
2. The manuscript has been written with all the code necessary to repoduce the results embedded as a [knitr]() dynamic document.  This helps ensure the analysis is always in synch with the results presented in the manuscript and the that the research is reproducible.  The analysis, figures, and manuscript can be reassembled from scratch by typing `make pdf` in the repository directory.  
3. Code to replicate the analysis and produce each of the figures shown can be found at:  (Version-stable lnk to the appropriate Github pages? Deposit in Figshare/Dryad first?)  
4. Data to replicate the analysis and data shown in each of the figures can be found at: (Easiest to link to Github, since the code and data already reside there.  Alternatively I could deposit these in [Figshare]() or [Dryad]() first...)
5. The manuscript, code, data, and documentation are available as an R package in the Github repository.  This package can be installed directly from Github using the `install.github` function from the [devtools]() package.  This will automatically handle installing the necessary software dependencies to run the code provided and replicate or extend the results.  
6. The issues tracker associated with the manuscript's repository provides a record of this research, including lines of investigation that were resolved into the results presented here, lines that were closed as dead-ends or null results, and outstanding issues for further investigation.  
7. The daily lab notebook entries accompanying this research can be found under the [project-tag](#) between dates of XX and XX.  

That would make for a somewhat lengthy cover letter.  








[^1]: Strictly speaking the edits to the manuscript in the open repository could also be considered confidental, though at that stage I haven't yet signed the copyright agreements that come with publication, which tend to be quite reasonable even for the traditional subscription based journals I work with)


