---
layout: post
category: open-science
tags:
- blog

---

The NIH has recently announced the
[report](http://softwarediscoveryindex.org/report) of a landmark meeting
which presents a vision for a _Software Discovery Index_ (SDI). The
report is both timely and focused on the key issues of locating, citing,
reusing software:


> Software developers face challenges disseminating their software
and measuring its adoption. Software users have difficulty identifying
the most appropriate software for their work. Journal publishers lack a
consistent way to handle software citations or to ensure reproducibility
of published findings. Funding agencies struggle to make informed funding
decisions about which software projects to support, while reviewers have
a hard time understanding the relevancy and effectiveness of proposed
software in the context of data management plans and proposed analysis.

To address this, they propose an Index which would do three things:

1. to assign standard and unambiguous identifiers to reference all software,
2. to track specific metadata features that describe that software, and
3. to enable robust querying of all relevant information for users.



The report is both timely and focused on key issues confronting our
community, including the challenges of identifying, citing, and reusing
software. The appendices do an excellent job in outlining key metadata,
metrics, and use cases which help frame the discussion.  The proposal
does well to focus on the importance of identifiers and the creation
of a query-able metadata index for research software, but leaves out an
essential element necessary to make this work.

This proposal sounds very much like the CrossRef and DataCite
infrastructure already in place for academic literature and data,
respectively; and indeed this is an excellent model to follow.  However,
a key piece of that infrastructure is missing from the present proposal --
the social contract between repository or publisher and the index itself.

CrossRef provides unique identifiers for the academic literature (CrossRef
DOIs), but it also defines specific metadata that describe that literature
(as well as metrics of its use), and embed that information into a
robust, query-able, machine-readable format.  DataCite does the same
for scientific data.  These are exactly the features that the authors
of the report seek to emulate.

Just as CrossRef itself does not host academic papers but only the
metadata records, the SDI does not propose to host software itself. This
introduces a substantial challenge in _maintaining the link_ between
the metadata and the software itself. The authors have simply proposed
that the metadata include "Links to the code repository." If CrossRef
or DataCite DOIs worked in this way, we would soon loose all ability to
recover many of the papers or the data itself, and we would be left with
only access to the metadata record and a broken link. DOIs were created
explicitly to solve this problem, not through technology, but through
a _social contract_.

The scientific publishers who host the actual publications are responsible
for ensuring that this link is always maintained when they change names,
etc. Should the publisher go out of business, these links may be adjusted
to point to a new home, such as [CLOCKSS](http://clockss.org). This
guarantees that the DOI always resolves to the resource in question,
regardless of where it moves.  Should a publisher fail to maintain
these links, CrossRef may refuse to provide the publisher any additional
DOIs, cutting it off from this key index.  This is the social contract.
Data repositories work in exactly the same way, purchasing their DOIs
from DataCite.  (While financial transaction isn't strictly necessary
for the financial contract, it provides a clear business model for
maintaining the key organization responsible for the index).

Without such a mechanism, links in the SDI would surely rot away,
all the more rapidly in the fast-moving world of software. Without
links to the software itself, the function of the index would be purely
academic. Yet such a mechanism requires that the software repositories,
not the individual software authors, would be willing to accept the same
social contract, receiving (and possibly paying for) identifiers on the
condition that they assume the responsibility of maintaining the links.
It is unclear that the primary software repositories in use to day
(Sourceforge, Github, Bitbucket, etc) would be willing to accept this.

Data repositories already offer many of the compelling features of this
proposal.  Many data repositories accept a wide array of file formats
including software packages, and would provide such software with a
permanent unique identifier in the form of a DataCite DOI, as well as
collecting much of the essential metadata listed in report's Appendix 1,
which would then already be accessible through the DataCite API in a
nice machine-readable format. This strategy finds several aspects wanting.

The primary barrier to using data repositories indexed by DataCite arises
from the dynamic nature of software relative to data.  Data repositories
are designed to serve relatively static content with few versions.
Software repositories, by contrast, are usually built upon explicit
version control platforms such as Git or Subversion designed explicitly
for handling continual changes, including branches and mergers, of
software code.  The report discusses the challenges of software versions
as a reason for that citing a software paper as a proxy for citing
software is not ideal: the citation to the paper does not convey what
version was used.  Rapid versioning creates other problems though, both
in the number of identifiers that might be created (is each commit a new
identifier?) and defining the relationship between different versions of
the same software. Branches and merges exacerbate this problem.  Existing
approaches that provide the user a one-time way to import software from
a software repository to a data repository such as those cited in the
report ("One significant initiative is a collaboration between Mozilla,
figshare, GitHub, and Zenodo") do nothing to address this issues.

Less challenging issues involve resolving differences between DataCite
metadata and the proposed metadata records for software. Most obviously,
the metadata would need a way to declare the object involved software
instead of data per se, which would thus allow queries to restrict results
to 'software' objects to avoid cluttering searches. Ideally, one would
also create tools that can import such metadata from the format in which
it is usually already defined in software, into the desired format of
the index, rather than requiring manual double-entry of this information.
These are important but more straight-forward problems which the report
already seeks to address.





--------

<!-- comments
Ilya raises the question: Why not just use Github? I think it is important to note that:

a) Github isn't forever, repositories come and go all the time, or move to new links, etc

b) Re-creating and running an NIH-Github would be both expensive (Gitlab notwithstanding) and redundant -- researchers would continue to use Github etc.

c) Github provides somewhat limited query-able metadata, that doesn't capture even the minimal list of fields suggested by the report.
Leveraging existing scientific data repositories by linking them to versioned releases on software repositories addresses each of these problems.

-->


<!--
A. FRAMEWORK SUPPORTING THE SOFTWARE DISCOVERY INDEX
Unique identifiers
Connections to publishers
Use cases
Complementarity with the Data Discovery Index
B. CHALLENGES AND REMAINING QUESTIONS
Defining relevant software
Integrating with other repositories
Evaluating progress and distinguishing this from other efforts
C. IMPLEMENTATION ROADMAP
-->
