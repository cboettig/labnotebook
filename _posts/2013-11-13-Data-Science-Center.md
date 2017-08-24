---
layout: post
title: Do we need a culture of Data Science in Academia? 
category: open-science
tags: 
- blog

---

Just my draft copy of a [Guest blog post](http://dynamicecology.wordpress.com/2013/11/25/do-we-need-a-culture-of-data-science-in-academia-guest-post/) I wrote for Dynamic Ecology.  


---------------------



On Tuesday the [Whitehouse Office of Science and Technology Policy](http://www.nitrd.gov/nitrdgroups/index.php?title=Data_to_Knowledge_to_Action) announced the creation of a $37.8 million dollar initiative to promote a "Data Science Culture" in academic institutions, funded by the [Gordon and Betty Moore Foundation](http://www.moore.org/newsroom/press-releases/2013/11/12/%20bold_new_partnership_launches_to_harness_potential_of_data_scientists_and_big_data), [Alfred P. Sloan Foundation](http://www.sloan.org/fileadmin/media/files/press_releases/datascience.pdf), and hosted in centers at the universities UC Berkeley, University of Washington, and New York University. Sadly, these announcements give little description of just what such a center would do, beyond repeating the usual the hype of  "Big Data."  

Fernando Perez, a research scientist at UC Berkeley closely involved with the process, paints a rather more provocative picture in his own perspective on [what this initiative might mean by a "Data Science Culture."](http://blog.fperez.org/2013/11/an-ambitious-experiment-in-data-science.html)  Rather than motivating the need for such a Center merely by expressing terabytes in scientific notation, Perez focuses on something not mentioned in the press releases. In his view, the objective of such a center stems from the observation that: 

> the incentive mechanisms of academic research are at sharp odds with the rising need for highly collaborative interdisciplinary research, where computation and data are first-class citizens

His list of problems to be tackled by this Data Science Initiative includes some particularly catching references to issues that have raised themselves on Dynamic Ecology before:  

<!--
> - An incentive structure that favors individualism, hyper-specialization and "novelty" to a toxic extreme
--> 

> - people grab methods like shirts from a rack, to see if they work with the pants they are wearing that day

> - methodologists tend to only offer proof-of-concept, synthetic examples, staying largely shielded from real-world concerns

Well that's a different tune than the usual big data hype[^1]. While it is easy to find anecdotes that support each of these charges, it is more difficult to assess just how rare or pervasive they really are. Though these are not new complaints among ecologists, the solutions (or at least antidotes) proposed in a Data Science Culture given a rather different emphasis.  At first glance, the Data Science Culture sounds like the more familiar call for an interdisciplinary culture, emphasizing that the world would be a better place if only domain scientists learned more mathematics, statistics and computer science.  It is not.  


##### the problem, part 1: [statistical machismo](http://dynamicecology.wordpress.com/2012/09/11/statistical-machismo/)?  

As to whether ecologists choose methods to match their pants, we have at least some data beyond anecdote. A survey earlier this year by Joppa et al. [(2013) _Science_](http://doi.org/10.1126/science.1231535)) has indeed shown that most ecologists select methods software guided primarily by concerns of fashion (in other words, whatever everybody else uses). The recent expansion of readily available statistical software has greatly increased the number of shirts on the rack.  Titles in _Ecology_ reflect the trend of rising complexity in ecological models, such as [Living Dangerously with big fancy models](http://doi.org/10.1890/10-1124.1) and [Are exercises like this a good use of anybody's time?](http://doi.org/10.1890/10-0052.1)).  Because software enables researchers to make use of methods without the statistical knowledge of how to implement them from the ground up, many echo the position so memorably [articulated by Jim Clark](http://press.princeton.edu/titles/8348.html) that we "handing guns to children."  This belittling position usually leads to a call for improved education and training in mathematical and statistical underpinnings (see each of the 9 articles in another [_Ecology_ Forum](http://doi.org/10.1890/08-1402.1) on this topic), or the occassional wistful longing for a simpler time.  

##### the solution, part 1: data publication?  

What is most interesting to me in Perez's perspective on the Data Science Institute in an emphasis on changing _incentives_ more than changing _educational_ practices.  Perez characterizes the fundamental objective of the initiative as a _cultural shift in which_ 

> "The creation of usable, robust computational tools, and the work of data acquisition and analysis must be treated as equal partners to methodological advances or domain-specific results"  

While this does not tackle the problem of misuse or misinterpretation of statistical methodology head-on, I believe it is a rather thought-provoking approach to mitigate the consequences of mistakes or limiting assumptions. By atomizing the traditional publication into such component parts: data, text, and software implementation, it becomes easier to recognize each for it's own contributions.  A brilliantly executed experimental manipulation need not live or die on some minor flaw in a routine statistical analysis when the data is a product in its own right.  Programmatic access to raw data and computational libraries of statistical tools could make it easy to repeat or alter the methods chosen by the original authors, allowing the consequences of these mistakes to be both understood and corrected. In the current system in which access to the raw data is rare, statistical mistakes can be difficult to detect and even harder to remedy. This in turn places a high premium on the selection of appropriate statistical methods, while putting little selective pressure on the details of the data management or implementation of those methods. Allowing the data to stand by itself places a higher premium on careful collection and annotation of data (e.g. the adoption of metadata standards). To the extent that misapplication of statistical and modeling approaches could place a substantial error rate on the literature ([Economist](http://www.economist.com/news/briefing/21588057-scientists-think-science-self-correcting-alarming-degree-it-not-trouble?fsrc=scn/tw_ec/trouble_at_the_lab), [Ioannidis 2005](http://doi.org/10.1371/journal.pmed.0020124)), independent data publication might be an intriguing antidote. 

<!--
Data scales in a way that publications do not, even (or rather, especially) within a particular sub-domain.  Given a single paper on a topic, it is much easier to read the conclusion than replicate it from the data.  Given 1000 papers on the topic vs having the underlying data in a standardized form, it becomes easier to replicate the analyses. Surely that would just lead to nonsense, given the idiosyncrasies of each different experiment that were never meant to be compared in that way?  Surely only by carefully reading not only each paper, but each supplement, can we really understand what was done well enough to replicate or re-analyze it?  Yet we cite papers as if they have demonstrated something in far more generality than all that.   

-->

##### the problem, part 2: junk software 

As Perez is careful to point out, those implementing and publishing methods aren't helping either. Unreliable, inextensible and opaque computational implementations act both as barriers to adoption and validation.  Trouble with scientific software has been well recognized by the literature (e.g. [Merali (2010), _Nature_](http://doi.org/10.1038/467775a), [Inces et al. (2012), _Nature_](http://doi.org/10.1038/nature10836)), the news ([Times Higher Education](http://www.timeshighereducation.co.uk/news/save-your-work-give-software-engineers-a-career-track/2006431.article)) and funding agencies ([National Science Foundation](http://www.nsf.gov/pubs/2013/nsf13525/nsf13525.htm)). While it is difficult to assess the frequency of software bugs that may really alter the results (though see Inces et al.), designs that will make software challenging or impossible to maintain, scale to larger tasks or extend as methods evolve are more readily apparent.  Cultural challenges around software run as deep as they do around data.  When Mozilla's Science Lab [undertook a review of code](http://doi.org/10.1038/501472a) associated with scientific publications, they took some criticism from other [advocates](http://simplystatistics.org/2013/09/26/how-could-code-review-discourage-code-disclosure-reviewers-with-motivation/) of publishing code.  I encountered this first hand in replies from authors, editors and reviewers on my own blog post [suggesting we raise the bar](http://carlboettiger.info/2013/06/13/what-I-look-for-in-software-papers.html) on the review of methodological implementations. Despite disagreement about where that bar should be, I think we all felt the community could benefit from clearer guidance or consensus on how to review papers in which the software implementation plays an essential part and contribution.  


##### the solution, part 2: software publication? 

As in the case of data, educational practices are the route usually suggested to address better programming practices, and no doubt these are important.  Once again though, it is interesting to think how a higher incentive on such research products might also improve their quality, or at least facilitate distilling the good from the bad from the ugly, more easily. Yet in this case, I think there is a potential downside as well.   

###### Or not? 

While widespread recognition of its importance will no doubt help bring us faster software, fewer bugs and more user-friendly interfaces, it may do more harm than good.  Promotion of software as a product can lead to empire-building, for which ESRI's ArcGIS might be a poster child. The scientific concepts become increasingly opaque, while training in a conceptually rich academic field gives way to more mindless training in the user interface of a single giant software tool.  I believe that good scientific software should be modular -- small code bases that can be easily understood, inter-operable, and perform a single task well (the Unix model).  This lets us build more robust computational infrastructure tailored to the problem at hand, just as individual Lego bricks may be assembled and reassembled.   Unfortunately, I do not see how recognition for software products would promote small modules over vast software platforms, or interoperability with other software instead of an exclusive walled garden. 

<!-- include image of lego brick tower?-->


#### So, change incentives _how_?

If this provides some argument as to why one might want to change incentives around data and software publication, I have said nothing to suggest how.  After all, as ecologists we're trained to reflect on the impact a policy would have, not advocate for what should be done about it.  If the decision-makers agree about the effects of the given incentives, then choosing what to reward should be easier.  


<!--
#### Data Science Culture is Data Sharing Culture? 

In raising these questions, Perez brings the role of a Data Science Institute down from the clouds of superficial pattern-finding in astronomically large data sets that bear no resemblance to what most of us work on, and places front and center the challenges of designing, selecting, implementing and interpreting the richer statistical analyses we face each day. In the process of bolstering the data and methodology upon which we base research today, we may open up the doors to better, faster, and bigger science tomorrow.  

-->


[^1]: Probably for reasons discussed [recently on Dynamic Ecology](http://dynamicecology.wordpress.com/2013/11/07/the-one-true-route-to-good-science-is/comment-page-1/#comment-20373) about politicians and dirty laundry. 

[^2]: keeping with the Dynamic Ecology blog tradition of "half-baked analogies to economics."

