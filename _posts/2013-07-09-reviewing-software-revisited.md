---
subtitle: Great ideas from the Journal of Open Research Software
layout: post
category: open-science
tags:
- blog 

---

Several weeks ago I wrote a [post](/2013/06/13/what-I-look-for-in-software-papers.html) describing issues I commonly raise when reviewing software papers. This provoked a lively discussion among authors, editors, and other reviewers of software papers (most of us having been on at least both reviewing and authoring end), with quite varied perspectives as to whether such criteria were appropriate in this context.  As I describe there, I view the concept of dedicated software papers as a somewhat necessary "hack" of the publishing system, and hope a more mature system will eventually come into place, as is now happening for data through efforts such as [Dryad](http://datadryad.org) and associated journal archiving requirements.  


Sustainability of the software is important for the same reason archiving the literature is important -- without this, we cannot build on existing work.  Building on "researcher/developer" software (e.g. the kind of software typically covered in 'software papers') is currently an uncommon and risky, as eloquently argued by Brian O'Meara in the comments of [an earlier post](http://carlboettiger.info/2013/04/23/we-need-more-object-oriented-design-in-comparative-methods.html) describing just such a failure.  

Through that discussion, I've come to see the goal of reviewing software papers as one of software sustainability.  After all, the publication becomes a part of the researcher's permanent record and part of the permanent scholarly archive, designed to outlive the journal itself.  It seems reasonable that the software it describes should at least exist and do something five years later.  Though this sentiment underlies most of my criteria, my phrasing is often too specific and a little too grounded in language explicit to software development.  

As I learned from Neil Chue Hong ([Software Sustainability Institute](http://www.software.ac.uk/)) in a follow up from that discussion, The Journal of Open Research Software has recently revised its guidelines making much of this more explicit and much better worded than I did.  They provide separate lists for the reviewer to comment on both the paper and the software -- making it clear that the review goes beyond the paper.  The questions for the paper are every bit as valuable as those from the software section: for instance, reference to sections on "Reuse", "Quality Control", and "Implementation and Architecture".  While these things might not get their own section headings in an MEE paper, the ideas should certainly be addressed.  I think these guidelines provide an excellent checklist for promoting sustainable software without putting undo emphasis on questions of performance, scalability, extensibility, etc.  



## Journal of Open Research Software's Guidelines

(content below [CC-BY](http://creativecommons.org/licenses/by/3.0/), quoted from [Journal of Open Research Software](http://openresearchsoftware.metajnl.com/))


 _Please provide a list of your recommendations, indicating which are compulsory for acceptance and which are optional but would improve the quality of the paper or the reusability of the software._

 
###  The paper

a. Is the title of the paper descriptive and objective?
b. Does the Abstract give an indication of the software's functionality, and where it would be used?
c. Do the keywords enable a reader to search for the software?
d. Does the Introduction give enough background information to understand the context of the software's development and use?
e. Does the Implementation and Architecture section give enough information to get an idea of how the software is designed, and any constraints that may be placed on its use?
f. Does the Quality Control section adequately explain how the software results can be trusted?
g. Does the Reuse section provide concrete and useful suggestions for reuse of the software, for instance: other potential applications, ways of extending or modifying the software, integration with other software?
h. Are figures and diagrams used to enhance the description? Are they clear and meaningful?
i. Do you believe that another researcher could take the software and use it, or take the software and build on it?


###  The software

a. Is the software in a suitable repository? (see [http://openresearchsoftware.metajnl.com/about/repositories/](http://openresearchsoftware.metajnl.com/about/repositories/) for more information)
b. Does the software have a suitable open licence? (see [http://openresearchsoftware.metajnl.com/faq/#q5](http://openresearchsoftware.metajnl.com/faq/#q5) for more information)
c. If the Archive section is filled out, is the link in the form of a persistent identifier, e.g. a DOI? Can you download the software from this link?
d. If the Code repository section is filled out, does the identifier link to the appropriate place to download the source code? Can you download the source code from this link?
e. Is the software license included in the software in the repository? Is it included in the source code?
f. Is sample input and output data provided with the software?
g. Is the code adequately documented? Can a reader understand how to build/deploy/install/run the software, and identify whether the software is operating as expected?
h. Does the software run on the systems specified? (if you do not have access to a system with the prerequisite requirements, let us know)
i. Is it obvious what the support mechanisms for the software are?

----------------------------------------------

Like my own list, a repository, a license, and sample input-output data are all mentioned explicitly.  Software review section suggests there should be a mechanism in place to "identify whether the software is operating as expected" -- such as basic unit tests.  Extensibility is also mentioned, but without any reference to features that may or may not assist in that -- a fault of my own list, which was probably over-specific on that account.  I think these are reasonable and solid guidelines, and would love to see other journals that frequently publish software papers (Looking at you, MEE, JSS, Bioinformatics, R Journal, PLoS Comp Bio) adopt similar criteria.  

Of course I'd love to hear what others think about this.  







