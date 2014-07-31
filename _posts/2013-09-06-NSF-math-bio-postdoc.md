---
layout: post
category: ecology
tags:
- nonparametric-bayes
- warning-signals

---

Guess it's that time of year again.  Just saw the reminder for [this year's RFP for NSF Biology Post-docs](http://www.nsf.gov/funding/pgm_summ.jsp?pims_id=503622&WT.mc_id=USNSF_39&WT.mc_ev=click).  As I was fortunate enough to receive one of these for the "Mathematical Biology" track through last year's call, I have received a few requests for materials and advice.  I'm not sure if I have any more insight for having received this funding, but as I appreciated the advice of others this time last year I'll give it a shot.  I found it particularly useful to see another proposal, particularly one that was also from a theoretical angle, so I am grateful to [Ethan White](http://whitelab.weecology.org/) for sharing [his successful proposal on figshare](http://dx.doi.org/10.6084/m9.figshare.93938) (though for a call under "Bioinformatics" rather than "Mathematical Biology").  Following suit, [my own full proposal](http://dx.doi.org/10.6084/m9.figshare.652970) can be found on figshare. (This is also linked from my vita, which hasn't proven very discoverable). While I do not feel it appropriate to post my reviews (after all, they are not written with the expectation of public release and I don't own the copyright to them), you can drop me an email if you would like to see these privately.

In that spirit, here is a bit of background on my own proposal with some general reflections on my reviews, both as a chance for me to think about the feedback I received as I now embark on this proposed research, and for whatever value it may have to this year's applicants.


----------------

In July I officially started my NSF mathematical biology post-doc with mentors Marc Mangel and Steve Munch:  _Management for an uncertain world: robust decision theory in face of regime shifts_.   Over the next two years, this research will focus primarily in pursing three questions:

1. **Can early warning signals be incorporated into decision-theoretic approaches to decrease the chance of an undesirable critical transition?**
2. **Can the use of non-parametric and machine learning approaches to ecosystem modeling and prediction decrease or increase the chance of an undesirable transition?**
3. **What learning strategies can be employed to reduce uncertainty without increasing the chance of accidentally crossing a tipping point?**


The project brings me into rather new ground into at least two new methodologies (Optimal control, specifically through stochastic dynamic programming -- something I have been recently introduced to by economists in a NIMBIOS working group)  and a new ecological system (fisheries dynamics). I had to smile on seeing that some of my reviewers fretted that the project sounded too similar to my thesis work.  While potentially understandable from a comparison of my thesis title and my NSF proposal title, I had feared the actual content had more the opposite problem.[^1]

Overall my reviews were somewhat more applied than I anticipated, focusing much more on the conceptual goals of the research than the details of the implementation.  In retrospect this was probably fortuitous, as I did not have space to fully develop the technical challenges in some of these areas, which are at points formidable (several areas involve methodology that is quite new to me.  Question 3 in particular draws on two classically hard problems and I worry myself if I will have the capacity to tackle it effectively). From others I understand that my proposal was potentially somewhat more focused on big picture issues than on implementation details, which may not always be advisable but worked well in this case.  It's unclear to me if this is typical of more theoretical proposals or just luck.



### Broader Impacts and the Open Notebook

NSF gives quite a wide range of potential areas for broader impacts. The 2013 changes only made this more vague, extending the listed examples and emphasizing that they were meant to be illustrative, not prescriptive. A particularly promising change comes in using the same [criteria as the merit review](http://www.nsf.gov/pubs/policydocs/pappguide/nsf13001/gpg_3.jsp#IIIA2); emphasizing that the effectiveness of the impact is assessed, and that the applicant is well-qualified for the task. Though I have volunteered much of my adult life with non-profit organizations working with under-served youth in my [community](/community.html), I did not think it appropriate to shoehorn those activities into my proposal.  For these reasons I chose not to focus on broadening participation of under-represented groups in this proposal, and instead emphasize three of five (now eight) suggested areas that I felt I could effectively impact through my open lab notebook: education, dissemination, and infrastructure.

I think this was a bit of a gamble, focusing on something that was both more unique to me and that I could implement and assess well, rather than on something more traditionally recognized for broader impacts. It is difficult to know just what my panel thought of this idea -- but my impressions is that "good enough" might be the general sentiment.  Comments included:

> The PI operates a blog (open notebook) that already receives attention and is an interesting way to promote engagement and learning across a broad community of scientific peers and perhaps the public.


> the notebook/blog could be developed into an online asynchronous classroom to mentor others in applying the results.


> The blog is a good idea for dissemination of results.

Whether or not this was a lukewarm endorsement of the open notebook, I'm excited that as part of my proposal the practice is officially part of my supported proposal and not merely a time-saving endeavor for myself.  Though the more technical features seemed to be of little interest to my reviewers, I'll nonetheless particularly interested in exploring the potential to better leverage such elements as [semantic markup](http://carlboettiger.info/2013/04/04/notebook-parsing.html) and [hashes](http://carlboettiger.info/2013/05/03/notebook-features-hashes-providing-an-immutable-and-verifiable-research-record.html) in the notebook as I move forward with my research.

### Reflections on Data Management

The data management plan is supposed to be assessed under both 'Intellectual Merit' and 'Broader Impact' sections where applicable,

> "The Data Management Plan will be reviewed as an integral part of the proposal, coming under Intellectual Merit or Broader Impacts or both, as appropriate for the scientific community of relevance." [NSF GPG](http://www.nsf.gov/pubs/policydocs/pappguide/nsf13001/gpg_2.jsp#IIC2j)

which may have the effect that it is assessed under neither, unless a reviewer particularly cares about this section. I saw no mention of it in my own reviews.  I have posted a draft of my [data management plan](http://carlboettiger.info/2012/10/09/data-management-plan.html) previously.  Having recently become familiar with the Ecological Metadata Standard I will probably amend the plan to reflect this.


#### Weaknesses

1. One reviewer expresses a desire for a case-study application
2. One suggests more on broader public and under-served groups
3. One feels the proposal has "some similarities to the dissertation"


[^1]: After moving from an undergraduate in physics, I did my best to stitch my graduate work for an evolution and ecology PhD under a unifying theme in my dissertation, but it could hardly have been more across the map.  My dissertation had three papers: one in Adaptive Dynamics, one in Comparative Phylogenetics, and one in warning signals of ecological shifts -- there was no overlap in authors and essentially no overlap in the topic or reference lists (Okay, Cox 1968, in the latter two).  I didn't even attempt to weave in my two ecoinformatics papers.  My undergraduate was similarly varied.  I spent summer 2004 in an astrophysics lab (lambda CDM models with Neta Bahcall), 2005 sequencing extremeophilic microbes in a geomicrobiology lab (with TC Onstott), 2006 doing computational methods for boundary value problems during a plasma physics fellowship (with Hersh Rabitz).  Though a physics major I wrote my first JP on population dynamics under clonal interference (David Huse), my second on adaptive dynamics (with Joshua Weitz), and my thesis on forest canopy models (with Stephen Pacala).  It's all a logical path of closely connected ideas in my mind of course ;-)
