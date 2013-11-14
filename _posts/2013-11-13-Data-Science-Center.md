---
title: Do we need a culture of Data Science in Academia? 
published: false
category: open-science
tags: 
- blog

---


On Tuesday the [Whitehouse Office of Science and Technology Policy](http://www.nitrd.gov/nitrdgroups/index.php?title=Data_to_Knowledge_to_Action) announced the creation of a $37.8 million dollar initiative to promote a "Data Science Culture" in academic institutions, funded by the [Gordon and Betty Moore Foundation](http://www.moore.org/newsroom/press-releases/2013/11/12/%20bold_new_partnership_launches_to_harness_potential_of_data_scientists_and_big_data), [Alfred P. Sloan Foundation](http://www.sloan.org/fileadmin/media/files/press_releases/datascience.pdf), and hosted in centers at the universities UC Berkeley, University of Washington, and New York University. Sadly, these announcements give little description of just what such a center would do, beyond repeating the usual the hype of  "Big Data."  The NY Times [Bits](http://bits.blogs.nytimes.com/2013/11/12/program-seeks-to-nurture-data-science-culture-at-universities) blog is typical of this shallow hype in opening with a graphic of 'sentiment analysis' that conveys no meaning whatsoever. 

<!--Include that sentiment-analysis image? -->

Fernando Perez, a research scientist at UC Berkeley closely involved with the process, paints a rather more provocative picture in his own acknowledgingly biased perspective on [what this iniative might mean by a "Data Science Culture."](http://blog.fperez.org/2013/11/an-ambitious-experiment-in-data-science.html).  Rather than motivating the need for such a Center merely by expressing terabytes in scientific notation, Perez focuses on something not mentioned in the press releases. In his view, the objective of such a center stems from the observation that: 

> the incentive mechanisms of academic research are at sharp odds with the rising need for highly collaborative interdisciplinary research, where computation and data are first-class citizens

Rather than staking out some call for adding a [fourth pillar](http://research.microsoft.com/en-us/collaboration/fourthparadigm/) alongside traditional research paradigms, Perez is taking aim the established pillars themselves.  His list of problems to be tackled by this Data Sciene Initiative includes some particularly catching references to issues that have raised themselves on Dynamic Ecology before:  


> people grab methods like shirts from a rack, to see if they work with the pants they are wearing that day

> methodologists tend to only offer proof-of-concept, synthetic examples, staying largely shielded from real-world concerns

> An incentive structure that favors individualism, hyper-specialization and "novelty" to a toxic extreme

> While academia punishes all the behaviors we need, industry rewards them handsomely. We have a new form of brain drain we had never seen before at this [scale](http://jakevdp.github.io/blog/2013/10/26/big-data-brain-drain). 


Well that's a different tune than the usual big data hype[^1]. While press releases speak of 'new science', Perez takes aim at existing science. Are such charges really justified inside our own domain of ecology? If so, (how) will a Data Science center address them?


#### Sloppy statistics?

Recent work ([Joppa et al. (2013) _Science_](http://doi.org/10.1126/science.1231535)) has indeed shown that most ecologists select methods software guided primarily by concerns of fashion (in other words, whatever everybody else uses). Selecting methodology without regard either to the implementation or appropriateness to the questions at hand drives the fear of misuse and misinterpretation of statistical methods. The argument goes that if hierarchical Bayesian inference software wasn't so readily available, fewer people would be making mistakes; a position memorably [articulated by Jim Clark](http://press.princeton.edu/titles/8348.html) that we "handing guns to children", and reflected in Ecology Forum pieces with titles such as [Living Dangerously with big fancy models](http://doi.org/10.1890/10-1124.1) and [Are exercises like this a good use of anybody's time?](http://doi.org/10.1890/10-0052.1). While certainly it is unjustified to condemn whole disciplines because some are careless, such literature would suggest that concerns about appropriate methodology are common place.  Has this situation been made worse or better because complicated methodology can now be implemented in software?  


#### Buggy code?

It appears that those publishing the methods aren't helping either. Unreliable, inextensible and opaque computational implementations act both as barriers to adoption and validation.  Unmaintained software can make it difficult or impossible to replicate or extend previous results.  Your writer received substantial push-back from authors, editors and reviewers when [suggesting we raise the bar](http://carlboettiger.info/2013/06/13/what-I-look-for-in-software-papers.html) on the review of methodological implementations. Trouble with scientific software has been well recognized by the literature (e.g. [Merali (2010), _Nature_](http://doi.org/10.1038/467775a), [Inces et al. (2012), _Nature_](http://doi.org/10.1038/nature10836)), the news ([Times Higher Education](http://www.timeshighereducation.co.uk/news/save-your-work-give-software-engineers-a-career-track/2006431.article)) and funding agencies ([National Science Foundation](http://www.nsf.gov/pubs/2013/nsf13525/nsf13525.htm)).  Again it is too easy to condemn all scientific software based on anecdote alone.  Is this indeed an area of widespread concern for Ecology, or a more minor problem?


Personally I would answer "better" to the first question and "yes" to the second, but I think the answers Perez hints at are far more intriguing.  I am curious how other ecologists feel they do or do not measure up.  


#### education or incentives?

Perez intriguingly juxtaposes these issues of methods and implementation against issues of academic incentives and "Data Science Culture." Typically, discussing either the misapplication of statistical methods or the sorry state of "research-grade" software merely raises a call for better training and education (see each paper cited above). While education will no doubt be a theme of this initiative as well, Perez suggests the "Data Science Culture" initiative is thinking more like an economist[^2] than like a school-teacher; seeking to change incentives behind what we do:


> "The creation of usable, robust computational tools, and the work of data acquisition and analysis must be treated as equal partners to methodological advances or domain-specific results,"  

This raises two important questions which are worth tackling in the context of ecological research:

1. _Would increased incentives for data acquisition and data publication address to some extent the misuse and misinterpretation of statistical methods?_

2. _Would changing incentives to better acknowledge methodological advances improve the quality, reliability, and extensibility of research software?_  


To both questions, I would answer with a qualified "yes".  

While data publication does little to prevent misinterpretation, such mistakes or limiting assumptions become both easier to correct and less damaging. Programmatic access to raw data and computational libraries of statistical tools could make it easy to repeat or alter the methods chosen by the original authors, allowing the consequences of these mistakes to be both understood and corrected. Meanwhile the entire contribution of the original authors is not undermined by a simple oversight, but can still be recognized for the value in the design, execution, and assembly of the data, etc.  Certainly this does not solve the problem, but at the end of the day, all science must rest on data.  

<!-- Data scales in a way that publications do not.  Given a single paper on a topic, it is much easier to read the conclusion than replicate it from the data.  Given 1000 papers on the topic vs having the underlying data in a standardized form, it becomes easier to replicate the analyses. -->
<!-- It's not just about big data and new questions, but letting those 4 people in your sub-sub-domain who will actually read your paper from cover to cover actually analyze the same data set you did, rather than always talking past one another.  -->

<!-- eek, tangent..!  -->
I am rather more concerned about changing incentives for software. While widespread recognition of its importance will no doubt help bring us faster software, fewer bugs and more user-friendly interfaces, it may do more harm than good.  Promotion of software as a product can lead to empire-building, for which ESRI's ArcGIS might be a poster child. The scientific concepts become increasingly opaque, while training in a conceptually rich academic field gives way to more mindless training in the user interface of a single giant software tool.  I believe that good scientific software should be modular -- small code bases that can be easily understood, inter-operable, and perform a single task well (the Unix model).  This lets us build more robust computational infrastructure tailored to the problem at hand, just as individual Lego bricks may be assembled and reassembled.   Unfortunately, I do not see how recognition for software products would promote small modules over vast software platforms, or interoperability with other software instead of an exclusive walled garden. 

<!-- include image of lego brick tower?-->


#### Data Science

In raising these questions, Perez brings the role of a Data Science Institute down from the clouds of superficial pattern-finding in astronomically large data sets that bear no resemblance to what most of us work on, and places front and center the challenges of designing, selecting, implementing and interpreting the richer statistical analyses we face each day. In the process of bolstering the data and methodology upon which we base research today, we may open up the doors to bigger science tomorrow.  




[^1]: Probably for reasons discussed [recently on Dynamic Ecology](http://dynamicecology.wordpress.com/2013/11/07/the-one-true-route-to-good-science-is/comment-page-1/#comment-20373) about politicians and dirty laundry. 

[^2]: keeping with the Dynamic Ecology blog tradition of "half-baked analogies to economics."

