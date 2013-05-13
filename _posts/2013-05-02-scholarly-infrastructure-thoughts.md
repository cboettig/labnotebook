---
layout: post
category: open-science
tags:
- blog

---



## Sustainable Research

Happened across a provocative [example](http://cran.r-project.org/web/packages/mcmc/ChangeLog) of why we need a software ecosystem, though it was certainly not intended to be one, which led me to ask myself:  

> How complex does an algorithm have to be before a talented researcher with expertise in both the relevant mathematics and computer science will make a significant mistake in their first release of the software?

As a corollary we might also ask, "How much less care do we put into research code not destined for release?"

This changelog clearly reflects these difficulties face well-established researchers with long publication records on these very methods.  If such individuals can make mistakes in packages, are we supposed to trust the myriad personal implementations of this and more complex algorithms that bulwark our literature today?  

Academic knowledge is currently built in the mortar and bricks of publication and citation.  Publications advance new claims built up on existing claims (and very occasionally replacing them) through citations.  It an approach that does not scale well on many fronts.  To verify information we must trace the citation chain, which grows far to quickly to for human processing and is not usually amenable to computer processing.  Yet here it is the statistical scaling that concerns me more -- a paper advances that a claim is true with a certain probability, given that the methods are implemented without error. The more publications we string together, the higher the probability that we observe false positives, but also that we observe implementation errors.  For much of research today, we need not construct the scientific argument in this manner.


Thanks to computational advances of the last several decades, public repositories of the data and the methods (such as can be implemented as software anyway), we can build on existing work by direct analysis of the data and methods, rather than treating the conclusions as given. Evidence would no longer come primarily in the highly circumstantial manner of citations to previous claims, but to direct analysis of data.  Using a common pool of data and methods would align incentives better to maintain and improve upon this infrastructure (the way major companies contribute to the underlying 'plumbing' provided by shared open source infrastructure), while there is no incentive for the literature to work in such a way.  


* [Cameron Neylon](http://cameronneylon.net/blog/whats-the-right-model-for-shared-scholarly-communications-infrastructure), and link in my comment.  




