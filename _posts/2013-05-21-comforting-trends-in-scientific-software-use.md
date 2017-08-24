---
layout: post
category: open-science
tags: 
- blog

---


**Author's Note**: 
Having refrained from actually posting this for 8 months, as I think I have quite mellowed more my critique. I do believe that education and peer review are the best way forward in tackling these issues, but cannot overstate how much of a long and rocky road that process will be.  The Mozilla Science Foundation is really leading these efforts with their code review pilots (as I have discussed in posts since writing this), and through their work with Software Carpentry training. Still, I leave this post as a bookmark of my intial thoughts and a reminder of these challenges.  

Consider reading these other posts on software review and training:

- [Reflections on the Mozilla Code Review Pilot](http://carlboettiger.info/2013/09/25/mozilla-software-review.html) (phase 1)
- ISEES Meeting software lifecycle: [Day 1](http://carlboettiger.info/2013/08/13/ISEES-Day-1.html), [Day 2](http://carlboettiger.info/2013/08/14/ISEES-day-2.html)
- ISEES Software training [Day 1](http://carlboettiger.info/2013/09/10/ISEES-training-workshop-day-1.html), [Day 2](http://carlboettiger.info/2013/09/11/ISEES-Workforce-Development-Day-2.html)

- [Reviewing Software, revisited](http://carlboettiger.info/2013/07/09/reviewing-software-revisited.html)
- [What I look for in software papers](http://carlboettiger.info/2013/06/13/what-I-look-for-in-software-papers.html)

------------

I have just been reading through `r citet("10.1126/science.1231535", "critiques")`.
While I agree  with a lot of the sentiment in this article, (we place
way too little emphasis on good coding practices, validation, etc.),
I actually found this article incredibly frustrating.  Following 
a little [rant on Google+](https://plus.google.com/112929796403983408632/posts/8whV6rtvsuw) 
(G+ has to be good for something, right?) and subsequent discussion, 
I've tried formulating my thoughts into a blog post here.


What first got my goat were the proposed "solutions" to the problem.
I think it is hopelessly naive to write that the solution is "better
computational education" and "peer review of code".

### Calling for better education is a cop-out

I completely agree that better education is sorely needed,
and am delighted to see the authors cite the [Sofware
Carpentry](http://softwarecarpentry.org) project (Though couldn't they
have made this a proper citations with a link?).  However, this is an
all too common cop-out of an answer that will do little to address the
real problem. For decades such position papers have called for better
education to address all our weaknesses -- biologists should learn better
mathematics, better statistics, better programming skills.  They should
also learn proper data management and archiving skills no doubt.
While we're at it, they should learn more about communicating science
and public speaking too.  What these calls to "raise standards" have in
common is a **dearth of incentives**.  Reward these talents with jobs and
advancement (publications and grants, after all, are just a means to such
ends, are they not?) and the education will follow.  Economics teaches
us that if we want to change behavior, we change incentives. Unless
this education translates into the currency of academia, we will only
do our students a disservice by forcing it upon them.  (I do note that
Software Carpentry rightly claims that the kind of training it offers
does promise to pay off in the current currency through time savings
that will be realized down the line...)

### Peer review of code is not the answer

If "peer review" were the ultimate solution to good code, we'd see that
standard in the software industry too, wouldn't we? Peer review actually
is used in the software industry, if perhaps more the way we treat
"friendly review" then with the black-and-white view we attach to peer
review in the scientific literature.  Peer review would never guarantee
the validity of code, though it would certainly help. The real bugbear
with peer review of code is just how difficult it would be to establish
as a practice.  The authors are silent on these challenges: organizing,
incentivising, transitioning to, and paying for such a system would all
be major hurdles to overcome.


I would trust software that has a long and active development history
with an engaged user base much more than anything that has simply been
"peer reviewed".   I suspect that instituting peer review of code in the
sciences would be a huge challenge for a potentially limited payoff. If
open source taught us nothing else, it is that "with many eyes all bugs
are shallow".  Robust software must ultimately rely on bug report feedback
cycle of users (and developers following the ["dog food" rule]()).


## So what is the problem, exactly?

If the proposed solutions are weak, the statement of the problem is not
actually much more convincing.  What, exactly, is the "troubling trend"
alluded to in the title?  The primary concern from their survey appears
to be that scientists rely on personal recommendations, ease of use,
and frequency of use in published studies when choosing what software
to use.  This approach is only "dangerous" if we assume that a scientist
has a choice of N potential software applications to perform a task,
of which some fraction F are faulty. (And that a "worrying" 80% want to
become better programmers...)

But does this study argue any of the software there users approached
was faulty? No.  Do they provide evidence that the metrics a researcher
uses (popularity, trust, ease of use) are not good predictors of decent
software? No!  They just assume this can't possibly be a good criterion
to evaluate software.

Suggesting that this criterion is to blame misses the underlying problem
entirely.  Researchers will always prefer software that has been used in
published studies, is easy to use, and recommended by people they trust.
If this is leading to problems, we must fix the software, not the people.

Reliance on common software is replacing reliance on undisclosed software
written from scratch by each researcher.  It is much easier to identify
and correct errors when the community all uses a common piece of software
then when everything is done from scratch.  Crucially, this shows the
emergence of a common code base -- a shared software infrastructure,
emerging in many fields.  This development is to be celebrated and taken
advantage of rather than something to fret over. A shared infrastructure
is a powerful thing.

## Real solutions: changing incentives

Of course there are some real gems in the paper that should have recieved more emphasis.

> Current models for how scientists and journals are rewarded must change,
as the would-be editors of the Open Research Computation journal (now a
series of the journal Source Code for Biology and Medicine) discovered
during efforts to establish a journal for publishing peer-reviewed
software ( 27).

Reward software the way we reward papers.  Github model of contributions. 

