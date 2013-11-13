---
title: Do we need a culture of Data Science in Academia? 
published: false
category: open-science
tags: 
- blog

---




Announcements from the [Whitehouse Office of Science and Technology Policy](http://www.nitrd.gov/nitrdgroups/index.php?title=Data_to_Knowledge_to_Action), the [Gordon and Betty Moore Foundation](http://www.moore.org/newsroom/press-releases/2013/11/12/%20bold_new_partnership_launches_to_harness_potential_of_data_scientists_and_big_data), [Alfred P. Sloan Foundation](http://www.sloan.org/fileadmin/media/files/press_releases/datascience.pdf), and its host universities UC Berkeley, University of Washington, and New York University, do little more than repeat the hype of so-called "Big Data" in trumpeting the creation of a $37.8 million dollar initiative to promote a "Data Science Culture" in academic institutions. The NY Times [Bits](http://bits.blogs.nytimes.com/2013/11/12/program-seeks-to-nurture-data-science-culture-at-universities) blog is typical of this shallow hype in opening with a graphic of 'sentiment analysis' that conveys no meaning whatsoever. 

<!--Include that sentiment-analysis image? -->

Fernando Perez, a research scientist at UC Berkeley closely involved with the process, gives us a little [more insight](http://blog.fperez.org/2013/11/an-ambitious-experiment-in-data-science.html) into just what "culture" this cash is supposed to change:

> the incentive mechanisms of academic research are at sharp odds with the rising need for highly collaborative interdisciplinary research, where computation and data are first-class citizens

Perez goes on to say lots of things that don't appear in the press releases,[^1] staking out the position of not merely adding a [fourth pillar](http://research.microsoft.com/en-us/collaboration/fourthparadigm/) to existing research, but rather a call for change in existing culture and practices; including in a list of "problems" tackled by the new center: 

> people grab methods like shirts from a rack, to see if they work with the pants they are wearing that day

> methodologists tend to only offer proof-of-concept, synthetic examples, staying largely shielded from real-world concerns

> An incentive structure that favors individualism, hyper-specialization and "novelty" to a toxic extreme

> While academia punishes all the behaviors we need, industry rewards them handsomely. We have a new form of brain drain we had never seen before at this [scale](http://jakevdp.github.io/blog/2013/10/26/big-data-brain-drain). 

Well that's a different tune than the usual big data hype accompanied by superficial visualization of tweets. While press releases speak of 'new science', Perez takes aim at existing science. Are such charges really justified inside our own domain of ecology? If so, (how) will a Data Science center address them?


#### Sloppy statistics 

A recent paper in Science ([Joppa et al. (2013)](http://doi.org/10.1126/science.1231535)) showed that most ecologists really do select methods software based on fashion. ([Some](http://doi.org/10.1890/0012-9623-94.4.338) might say the same about selection of data, albeit without presenting data). The misuse and misinterpretation of statistical methods has leading Jim Clark to [speculate](http://press.princeton.edu/titles/8348.html) that we "handing guns to children", and Ecology Forum pieces with titles such as [Living Dangerously with big fancy models](http://doi.org/10.1890/10-1124.1) and [Are exercises like this a good use of anybody's time?](http://doi.org/10.1890/10-0052.1).  


#### Buggy code

Those publishing the methods aren't helping either. Unreliable, inextensible and opaque computational implementations act both as barriers to adoption and validation.  Your writer received substantial push-back from authors, editors and reviewers when [suggesting we raise the bar](http://carlboettiger.info/2013/06/13/what-I-look-for-in-software-papers.html) on the review of methodological implementations. Trouble with scientific software has been well recognized by the literature (e.g. [Merali (2010), _Nature_](http://doi.org/10.1038/467775a), [Inces et al. (2012), _Nature_](http://doi.org/10.1038/nature10836)), the news ([Times Higher Education](http://www.timeshighereducation.co.uk/news/save-your-work-give-software-engineers-a-career-track/2006431.article)) and funding agencies ([National Science Foundation](http://www.nsf.gov/pubs/2013/nsf13525/nsf13525.htm)) 


#### education or incentives?

While these are clearly not new challenges, Perez's juxtaposition of them against both the question of academic incentives and the creation of a Data Science Institute is intriguing. Discussing either the misapplication of statistical methods or the sorry state of "research-grade" software invariably raises a call for better training and education (typified by many of the links above). While education will no doubt be a theme of this initiative as well, Perez suggests the White House OSTP, Sloan and Moore place the emphasis on issues of academic culture and incentives first and foremost.  Perez characterizes this objective as:


> "The creation of usable, robust computational tools, and the work of data acquisition and analysis must be treated as equal partners to methodological advances or domain-specific results,"  

This raises two important questions which are worth tackling in the context of ecological research:

1. _Would increased incentives for data aquisition and data publication address to some extent the misuse and misintepretation of statistical methods?_

2. _Would changing incentives to better acknowledge methodological advances improve the quality, realiability, and extensibility of research software?_  


Even before we ask how such incentives might be changed, it is a useful thought experiment to explore what consequences those changes might have.  After all, addressing these challenges through incentives rather than instruction is in keeping with the Dynamic Ecology blog tradition of "loose analogies to economics."

To both questions, I would answer with a qualified "yes".  

While data publication does little to prevent misinterpretation, such mistakes or limiting assumptions become both easier to correct and less damaging. Programmatic access to raw data and computational libraries of statistical tools could make it easy to repeat or alter the methods chosen by the original authors, allowing the consequences of these mistakes to be both understood and corrected. Meanwhile the entire contribution of the original authors is not undermined by a simple oversight, but can still be recognized for the value in the design, execution, and assembly of the data, etc.  Certainly this does not solve the problem, but at the end of the day, all science must rest on data.  
<!-- Data scales in a way that publications do not.  Given a single paper on a topic, it is much easier to read the conclusion than replicate it from the data.  Given 1000 papers on the topic vs having the underlying data in a standardized form, it becomes easier to replicate the analyses. -->
<!-- It's not just about big data and new questions, but letting those 4 people in your sub-sub-domain who will actually read your paper from cover to cover actually analyze the same data set you did, rather than always talking past one another.  -->


I am rather more concerned about changing incentives for software. While widespread recognition of its importance will no doubt help bring us faster software, fewer bugs and more user-friendly interfaces, it may do more harm than good.  Promotion of software as a product can lead to empire-building, for which ESRI's ArcGIS might be a poster child. The scientific concepts become increasingly opaque, while training in a conceptually rich academic field gives way to more mindless training in the user interface of a single giant software tool.  I believe that good scientific software should be modular -- small code bases that can be easily understood, inter-operable, and perform a single task well (the Unix model).  This lets us build more robust computational infrastructure tailored to the problem at hand, just as individual Lego bricks may be assembled and reassembled.   Unfortunately, I do not see how recognition for software products would promote small modules over vast software platforms, or interoperability with other software instead of an exclusive walled garden. 

<!-- include image of lego brick tower?-->


#### Data Science

In raising these questions, Perez brings the role of a Data Science Institute down from the clouds of superficial pattern-finding in astronomically large data sets that bear no resemblance to what most of us work on, and places front and center the challenges of designing, selecting, implementing and interpreting the richer statistical analyses we face each day. In the process of bolstering the data and methodology upon which we base research today, we may open up the doors to bigger science tomorrow.  




[^1]: Probably for reasons discussed [recently on Dynamic Ecology](http://dynamicecology.wordpress.com/2013/11/07/the-one-true-route-to-good-science-is/comment-page-1/#comment-20373) about politicians and dirty laundry.  
