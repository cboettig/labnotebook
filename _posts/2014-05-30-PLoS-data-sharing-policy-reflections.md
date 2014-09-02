---
layout: post
category: open-science
tags:
- blog
---

PLOS has posted an [excellent
update](http://blogs.plos.org/biologue/2014/05/30/plos-data-policy-update/)
reflecting on their experiences a few months in to their new data sharing
policy, which requires authors to include a statement of where the data
can be obtained rather than providing it upon request. They do a rather
excellent job of highlighting common concerns and offering well justified
and explained replies where appropriate.


At the end of the piece they pose several excellent questions, which I reflect on here
(mostly as a way of figuring out my own thoughts on these issues).

----------------


- __When should an author choose Supplementary Files vs a repository
vs figures and tables?__

To me, repositories should always be the default. Academic repositories
provide robust permanent archiving (such as [CLOCKSS]
backup), independent DOIs to content, often tracking of use metrics,
enhanced discoverability, clear and appropriate licenses, richer metadata,
as well as frequently providing things like API access and easy-to-use
interfaces.  They are the Silicon Valley of publishing innovation today.

Today I think it is much more likely that some material is not
appropriate for a 'journal supplement' rather than not being able to
find an appropriate repository (enough are free, subject agnostic and
accept almost any file types). In my opinion the primary challenge is
for publishers to tightly integrate the repository contents with their
own website, something that the repositories themselves can support
with good APIs and embedding tools (many do, PLOS's coordination with
figshare for individual figures being a great example).

I'm not clear on "vs figures and tables", as this seems like a content
question of "What" should be archived rather than "Where" (unless it is
referring to separately archiving the figures and tables of the main text,
which sounds like a great idea to me).

- __Should software/code be treated any differently from ‘data'? How
should materials-sharing differ?__

At the highest level I think it is possible to see software as a 'type'
of data. Like other data, it is in need of appropriate licensing, a
management plan, documentation/metadata, and conforming to appropriate
standards and placed in appropriate repositories.  Of course what is meant
by "appropriate" differs, but that is also true between other types of
data. The same motivations for requiring data sharing (understanding and
replicating the work, facilitating future work, increasing impact) apply.

I think we as a scientific community (or rather, many loosely federated
communities) are still working out just how best to share scientific
code and the unique challenges that it raises.  Traditional scientific
data repositories are well ahead in establishing best practices for
other data, but are rapidly working out approaches to code. The [guidelines](http://openresearchsoftware.metajnl.com/about/editorialPolicies)
from the Journal of Open Research Software from the UK Software
Sustainability Institute are a great example. (I've written on this topic
before, such as [what I look for in software papers](http://www.carlboettiger.info/2013/06/13/what-I-look-for-in-software-papers.html) and on the topic
of the [Mozilla Science Code review pilot](www.carlboettiger.info/2013/09/25/mozilla-software-review.html)

I'm not informed enough to speak to sharing of non-digital material.

- __What does peer review of data mean, and should reviewers and editors
be paying more attention to data than they did previously, now that they
can do so?__


In as much as we are satisfied with the current definition of peer review
for journal articles I think this is a false dichotomy. Landmark papers, at
least in my field, five or six decades ago (e.g. about as old as the
current peer review system) frequently contained all the data in the paper
(papers were longer and data was smaller).  Somehow the data outgrew the
paper and it just became okay to omit it, just as methods have gotten more
complex and papers today frequently gloss over methodological details. The
problem, then, is not one of type but one of scale: how do you review data
when it takes up more than half a page of printed text.

The problem of scale is of course not limited to data. Papers frequently
have many more authors than reviewers, often representing disparate and
highly specialized expertise over possibly years of work, depend upon more
than 100 citations and be accompanied by as many pages of supplemental material.
To the extent that we're satisfied with how reviewers and editors have coped
with these trends, we can hope for the same for data.

Meanwhile, data transparency and data reuse may be more effective safe guards.
Yes, errors in the data may cause trouble before they can be brought to light,
just like bugs in software.  But in this way they do eventually come to light,
and that is somewhat less worrying if we view data the way we currently build publications
(e.g. as fundamental building blocks of research) and publications as we currently
view data (e.g. as a means to an ends, illustrated in the idea that it is okay to have
mistakes in the data as long as they don't change the conclusions). Jonathan Eisen
has some [excellent](http://www.slideshare.net/phylogenomics/jonathan-eisen-talk-on-open-science-at-bosc2012-ismb "see slide 13") [examples](https://www.youtube.com/watch?v=oWZzUe3Kxeo) in which openly sharing the data led to rapid
discovery and correction of errors that might have been difficult to detect
otherwise.



- __And getting at the reason why we encourage data sharing: how much data,
metadata, and explanation is necessary for replication?__

I agree that the "What" question is a crux issue, and one we are still
figuring out by community. There are really two issues here: what data
to include, and what metadata (which to me includes any explanation or
other documentation of the data) to provide for whatever data is included.


On appropriate metadata, we'll never have a one-size-fits-all answer, but
I think the key is to at least uphold current community best-practices
(best != mode), whatever they may be. Parts of this are easy: scholarly
archives everywhere include basic [Dublin Core Elements] metadata
like title, author, date, subject and unique identifier, and most
data repositories will attach this information in a machine-readable
metadata format with minimal burden on the author (e.g. [Dryad], or to
lesser extent, [figshare]).  Many fields already have well-established
and tested standards for data documentation, such as the [Ecological
Metadata Langauge], which helps ecologists document things like column
names and units in an appropriate and consistent way without constraining
how the data is collected or structured.

What data we include in the first place is more challenging, particularly
as there is no good definition of 'raw data' (one person's raw data being
another person's highly processed data). I think a useful minimum might
be to provide any data shown in a figure or used in a statistical test
that appears in the paper.

Journal policies can help most in each of these cases by pointing authors
to the policies of repositories and to subject-specific publications on
these best practices.


- __A crucial issue that is much wider than PLOS is how to cite data and
give academic credit for data reuse, to encourage researchers to make
data sharing part of their everyday routine.__

Again I agree that credit for data reuse is an important and largely
cultural issue. Certainly editors can play there part as they already do
in encouraging authors to cite the corresponding papers on the methods
used, etc.

I think the cultural challenge is much greater for the "long tail" content
than it is for the most impactful data. I think most of the top-cited
papers over the last two decades have been methods papers (or are cited
for the use of a method that has become the standard of a field; often
as software).  As with any citation, there's a positive feedback as more
people are aware of it.  I suspect that the papers announcing the first
full genomes of commonly studied organisms (essentially data papers,
though published by the most exclusive journals) did not lack citations.
For data (or methods for that matter) that do not anticipate that level
of reuse, the concern of appropriate credit is more real. Even if a
researcher can assume they will be cited by future reuse of their data,
they may not feel that sufficient compensation if it means one less
paper to their name.

Unfortunately I think these are not issues unique to data publication but
germane to academic credit in general. Citations, journal names, and so
forth are not meaningless metrics, but very noisy ones.  I think it is too
easy to fool ourselves by looking only at cases where statistical averages
are large enough to see the signal -- datasets like the human genome and
algorithms like BLAST we know are impactful, and the citation record bears
this out. Really well cited papers or well-cited journals tend to coincide
with our notions of impact, so it is easy to overestimate the fidelity
of citation statistics when the sample size is much smaller. Besides,
academic work is a high-dimensional creature not easily reduced to a few
scalar metrics. <!--(I think that is why, at least in the US, we tend
to place more trust in the opinions of people over current metrics.)-->



- __And for long-term preservation, we must ask who funds the costs of
data sharing?  What file formats should be acceptable and what will
happen in the future with data in obsolete file formats? Is there likely
to be universal agreement on how long researchers should store data,
given the different current requirements of institutions and funders?__

I think these are questions for the scientific data repositories and the
fields they serve, rather than the journals, and for the most part they
are handling them well.

Repositories like [Dryad] have clear pricing schemes closely integrated
with other publication costs, and standing at least an order of magnitude
less than most journal publication fees look like a bargain. (Not so if
you publish in subscription journals I hear you say.  Well, I would not
be surprised if we start seeing such repositories negotiate institutional
subscriptions to cover the costs of their authors).

I think the question of data formats is closely tied to that of metadata,
as they are all topics of best-practices in archiving. Many scientific
data repositories have usually put a lot of thought into these issues
and also weigh them against the needs and ease-of-use of the communities
they serve.  Journal data archiving policies can play their part by
encouraging best practices by pointing authors to repository guidelines as
well as published articles from their community (such as the [Nine Simple
Ways](http://library.queensu.ca/ojs/index.php/IEE/article/view/4608)
paper by White et al.)

I feel the almost rhetorical question about 'universal agreement'
is unnecessarily pessimistic.  I suspect that much of the variance in
recommendations for the duration a researcher should archive their own
work predates the widespread emergence of data repositories, which have
vastly simplified the issue from when it was left up to each individual
lab.  Do we ask this question of the scientific literature? No, largely
because many major journals have already provided robust long term
archiving with [CLOCKSS]/LOCKSS backup agreements.  Likewise scientific
data repositories seem to have settled for indefinite archiving.  It seems
both reasonable and practical that data archiving can be held to the
same standard as the journal article itself. (Sure there are lots of
challenging issues to be worked out here, the key is only to leave it in
the hands of those already leading the way and not re-invent the wheel).



[Dublin Core Elements]: http://en.wikipedia.org/wiki/Dublin_Core
[Ecological Metadata Language]: http://en.wikipedia.org/wiki/Ecological_Metadata_Language
[figshare]: http://figshare.org
[Dryad]: http://datadryad.org
[CLOCKSS]: http://clockss.org


