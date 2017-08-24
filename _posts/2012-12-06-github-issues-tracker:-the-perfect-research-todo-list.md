---
layout: post
category: open-science
tags:
- notebook-technology
- blog

---


Github issues tracker has increasingly become my research to-do list.  Far beyond bugs and features of the code associated with the project, the issues sign-post different directions for investigation and the progress I've made in each.  Tags serve to group issues related to a common sub-project (as in my [pdg-control](https://github.com/cboettig/pdg_control/issues)) repo or priotize tasks (as in my [nonparametric-bayes](https://github.com/cboettig/nonparametric-bayes/issues) repo.  

Issues not only have title and tags, but support a comment thread for progress and discussion of the issue.  Thanks to github-flavored-markdown, issues can reference each other simply by number, and can be updated or closed automatically by mentioning the issue number in a commit.  

Issues can also be grouped into shared deadlines, or milestones; a feature I haven't fully exploited (but see our [ews-review](https://github.com/cboettig/ews-review/issues/milestones) paper).  In any collaborative project the issues can be assigned to different people, (though currently this requires they have a Github account).  

A consequence of this workflow is a conveniently numbered, color-coded and cross-linked collection of steps involved in a given research project.  This tends to be a higher-level overview than the individual commit log, particularly as I often use commits to track multiple runs with different parameters, or move code across to different supercomputers that do the actual runs. 


![Example from closed issues on [`pdg-control`](https://github.com/cboettig/pdg_control/issues?labels=&milestone=&page=1&state=closed)](http://farm9.staticflickr.com/8490/8250376085_09f734c6f1.jpg)

I am still figuring out the right level or "resolution" on which to create and track issues.[^1]  On one extreme, almost every commit could be seen as resolving an issue.  The ideal use for me is probably nearer the other extreme, where individual issues are rather big-picture, and may be referenced by many commits.  Perhaps the right way to think about it is that the questions addressed by resolving an issue are on the level of *what is interesting to others*, while changes in individual commits are more for me. Hopefully I get better at finding this relevant level.   

Another nice feature of issues is that they can be closed when a particular line of investigation hits a dead-end, or stalls, or when the problem is resolved.  Unlike the resulting paper from an investigation which essentially summarizes the issues that were closed successfully, the issues tracker also reveals the dead-ends, as well as those issues that were not closed a time of publication (but perhaps left to "further research").  Hopefully I will have some decent examples of this in the repositories accompanying my next papers.  

[^1]: Unlike issues, commits do not have a native tag structure (so-called "tags" mark important events in the commit history rather than grouping common commits).  So at least this would group commits by the tag of the associated issue.  




