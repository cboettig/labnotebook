---
title: Reflections on the Mozilla Science Code Review Pilot
layout: post
category: open-science
tags: 
- blog

---

I was recently interviewed a _Nature_ senior reporter [Erika Check Hayden](http://twitter.com/erica_check) on the subject of the scientific [code review project](http://kaythaney.com/2013/08/08/experiment-exploring-code-review-for-science/) being conducted by [Mozilla Science Lab](https://wiki.mozilla.org/ScienceLab).  The piece appears in this week's issue, [Hayden 2013](http://doi.org/10.1038/501472a "Mozilla plan seeks to debug scientific code").  [My blog post](http://carlboettiger.info/2013/06/13/what-I-look-for-in-software-papers.html) sharing my own approach to code review is mentioned at the beginning of the article, though it is rather Roger Peng's comments at the end that have stirred [some interesting discussion](https://twitter.com/Erika_Check/status/382911015358181376/photo/1).  

Roger raises two concerns. First, that increased scrutiny will discourage researchers from sharing code, (which, right or wrong, remains a voluntary choice in most journals):

> One worry I have is that, with reviews like this, scientists will be even more discouraged from publishing their code

and second, that code review does not focus on what matters mosts:  

> We need to get more code out there, not improve how it looks

(Erika provides a bit more context to Roger's comments below).  

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/ctitusbrown">@ctitusbrown</a> <a href="https://twitter.com/cboettig">@cboettig</a> <a href="https://twitter.com/kaythaney">@kaythaney</a> <a href="https://twitter.com/nickbarnes">@nickbarnes</a> see whole <a href="https://twitter.com/simplystats">@simplystats</a> quote on prof. code review discouraging sharing <a href="http://t.co/pNQWT9Safz">pic.twitter.com/pNQWT9Safz</a></p>&mdash; Erika Check Hayden (@Erika_Check) <a href="https://twitter.com/Erika_Check/statuses/382911015358181376">September 25, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

The _Nature_ News piece thus nails a central tension in the community between promoting higher standards for code (A position exemplified in an earlier _Nature_ column titled ["Computational Science ... Error: Why scientific programming does not compute"](http://doi.org/10.1038/467775a "Merali 2010, Nature"), and more recently in _Science_ by [Joppa _et al._ 2013](http://doi.org/10.1126/science.1231535 "Joppa et al. 2013, 'Troubling Trends in Scientific Software Use'"), which explicitly calls for peer review of scientific software) vs promoting more widespread sharing of software (as exemplified by Nick Barnes piece in the same issue, ["Publish your computer code: it is good enough"](http://doi.org/10.1038/467753a "Barnes 2010, Nature"). 

The arguments made in each of the perspectives are excellent, and should be required reading for anyone interested in the subject.  In addition to the shorter comment by Barnes, I also recommend the more recent _Nature_ perspective, [The Case for Open Computer Programs](http://doi.org/10.1038/nature10836 "Ince et al. 2012, Nature"), which lays out the argument and modest practical recommendations (that have largely been ignored as far as I can tell) just brilliantly.  In particular, I think they nail the issue of why describing the algorithm or providing pseudo-code is not a satisfactory description of the method.

However, I also think the tension between review and sharing is somewhat artificial.  While each of these positions emphasizes the need to share source-code, the call for code review by Merali, Joppa et al (or in my own blog post mentioned earlier), focus on _scientific software_ aimed at reuse by others.  The concerns voiced in Roger Peng's comments and echoed by Nick Barnes focus on another class of code entirely -- code associated with a particular research publication that would primarily serve only to document and support those results, rather than be readily adapted to other uses.  


<blockquote class="twitter-tweet"><p><a href="https://twitter.com/cboettig">@cboettig</a> <a href="https://twitter.com/ctitusbrown">@ctitusbrown</a> <a href="https://twitter.com/kaythaney">@kaythaney</a> but far more important to get code out than to get it &quot;right&quot;, IYSWIM.</p>&mdash; Nick Barnes (@nickbarnes) <a href="https://twitter.com/nickbarnes/statuses/382746748135174144">September 25, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>



### Classes of Code: Snippets vs Software

For me, the crux of these concerns lies in the difference between "software papers"[^1] and papers which merely use code in some element of the methodology.  The Mozilla study focused exclusively on code appearing in the full-text of publications in PLoS Computational Biology.  Though I am pleased to see the Science Lab tackle the issue of software review and bring the expertise of their professional software developers to bear on scientific code, this is perhaps not the kind of code I would have chosen to focus on (something I shared with the team early on in seeing the announcement).  

Without knowing which papers are included it is of course difficult to say to much.  But knowing that the code appears in the full text of the papers themselves, we can assume that it is not a complete software package intended for reuse by other researchers.  Using code within the body of a manuscript implies the intent to communicate methodology more concisely and precisely than might be done in prose; in much the same manner that we use equations in place of prose.  This is an important development in scientific communication, but is also rather distinct from the use of code in other contexts, in which the code itself is meant to be read primarily by machines. It is code that is already intended to help _explain_.  

Code included in appendices to scientific papers is meant rather to _document_ exactly what has been done, in a manner that assists replication, and may require considerable effort to decipher exactly what is being done.  Instead, it merely supports the more readable but less precise description and potentially the pseudo-code that would appear in the body text.  

Code intended for reuse as research software (in software papers) is another class entirely.  Ostensibly, the user never needs to see the code itself, but only interact with the user interface or end-user functions (API) provided.  Code that is written clearly and concisely still has value -- helping identify bugs and facilitating future researcher-developers extending the software, but most of it's functionality can be accessed and assessed without looking at the source. I think it is in this kind of review that we as a researcher-developer community could learn the most from the Mozilla software engineering experts.  

I believe the most important focus of code review is in scientific software rather than in code snippets.  And in reviewing software, I think all of the most important elements do not actually involve reading the source code at all (as I discuss in my [revised position on reviewing software papers](http://carlboettiger.info/2013/07/09/reviewing-software-revisited.html)), but rather in establishing that the software behaves as expected and follows software development practices that make it more sustainable, such as hosting in a software repository, version control, or example input and output.  

### Code vanity?

Roger's second comment appears more dismissive of code review than I think it actually is:

> "We need to get more code out there, not improve how it looks."

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/kaythaney">@kaythaney</a> <a href="https://twitter.com/ctitusbrown">@ctitusbrown</a> yup, &#39;pretty&#39; is dismissive terminology, though possibly short-hand for &#39;human-readable&#39; not just &#39;machine-readable&#39;</p>&mdash; Carl Boettiger (@cboettig) <a href="https://twitter.com/cboettig/statuses/382905327013728256">September 25, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Most modern languages include [syntactic sugar](http://en.wikipedia.org/wiki/Syntactic_sugar): ways of expressing commands that are more easily interpretable to human readers.  For instance, in C, `a[i]` is syntactic sugar for `*(a+i)`.  Higher-level languages are in some ways all sugar around existing lower-level libraries.[^2]  Like good mathematical notation or good prose, this is not just about being 'pretty', but being more effective in communicating with humans. Certainly this is something we can improve upon as researchers, but it is perhaps not the best starting point.   



### Share first, fix later

If code review should apply to all levels of code or be reserved for scientific software may still be an open question. What we should be able to agree on is in the publishing of code in the first place: 

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/cboettig">@cboettig</a> <a href="https://twitter.com/kaythaney">@kaythaney</a> <a href="https://twitter.com/nickbarnes">@nickbarnes</a> I think code sharing should be mandatory *shrug*. It&#39;s part of the methods. I reject papers w/o it.</p>&mdash; Titus Brown (@ctitusbrown) <a href="https://twitter.com/ctitusbrown/statuses/382903924253929472">September 25, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>


It continues to surprise me how few journals require code deposition.  _Science_ explicitly [adopted a new policy in 2011](http://doi.org/10.1126/science.1203354) stating

> _Science_ is extending our data access requirement listed above to include computer codes involved in the creation or analysis of data

which asks that the data be placed in a appropriate permanent repository or otherwise placed in the supplementary materials (see [information for authors](http://www.sciencemag.org/site/feature/contribinfo/prep/gen_info.xhtml#dataavail)).  

Yet I have not seen code provided for any analysis I have read in Science since 2011.  Either we have a very different understanding of what it means to use computer codes in the analysis of data or _Science_ grossly neglects its own policy.[^3] Not to pick on them of course, few other journals have explicitly adopted such a policy.  


<blockquote class="twitter-tweet"><p>.<a href="https://twitter.com/cboettig">@cboettig</a> <a href="https://twitter.com/kaythaney">@kaythaney</a> <a href="https://twitter.com/nickbarnes">@nickbarnes</a> As one of my grad students said to me, &quot;I don&#39;t understand why &#39;must share code&#39; is a radical opinion.&quot;</p>&mdash; Titus Brown (@ctitusbrown) <a href="https://twitter.com/ctitusbrown/statuses/382904483102982145">September 25, 2013</a></blockquote>


Nick Barnes suggests that this alone may be enough to improve code quality:

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/cboettig">@cboettig</a> <a href="https://twitter.com/ctitusbrown">@ctitusbrown</a> <a href="https://twitter.com/kaythaney">@kaythaney</a> require sharing. Pride will then rapidly lead to review and other improvement techniques.</p>&mdash; Nick Barnes (@nickbarnes) <a href="https://twitter.com/nickbarnes/statuses/382755320143282176">September 25, 2013</a></blockquote>

Certainly it will help, though not enough if the state of open source scientific software is any indication (Nick does acknowledge a rather geological notion of 'rapid').  Smaller codes used in particular analyses will certainly feel this pressure more, as they will be easier to scrutinize.     


### So what might we learn from the Mozilla Code review?

Focusing on code appearing in-line in papers certainly addresses a different beast than large scientific software packages intended for reuse.  As Roger observed, we will likely learn that scientists aren't software engineers.  We may learn how to use code to communicate more effectively.  We may learn some lessons that apply for larger codebases involved in scientific software, but I think there the problem are often outside of the individual lines of code themselves and arise from other development practices.

Still, learning how to do code review at all would be an invaluable start.  As the discussion on my own post on the subject made clear, we researchers have no training in this practice.  The Mozilla study would give the first taste.  I only hope they turn there attention next to larger scientific software that lives outside of the publications themselves and is intended at re-purposing and reuse.  Meanwhile, I also hope journals will become more serious about recognizing code as methods, as they have started to do with data.  



[^1]: which I define as papers primarily aimed at promoting the reuse of a particular codebase and providing an indexed citation target to credit the work.

[^2]: It is frequently argued that ideal code should be 'self-documenting', with syntax so precise that no other explanation of the function is necessary.  While I think this is an admirable ideal, it should never be a substitute for actually providing prose documentation as well.  I find we too easily decieve ourselves as to just how self-documenting our own code really is (it's all so obvious at the time, right?).  

[^3]: From my reading it appears that _Science_ requirements are intentionally too vague on this issue, stating: "All computer codes involved in the creation or analysis of data must also be available to any reader of Science." It is unclear if 'available on request' is considered appropriate for code, though it is explicitly not acceptable for data: "we have therefore required authors to enter into an archiving agreement, in which the author commits to archive the data on an institutional Web site, with a copy of the data held at Science", and the editorial makes it clear that "the data access requirement ... includes computer codes".  Meanwhile all studies involving 'requests for data' have shown a return rate of substantially less than a 100% (usually less than 20%, e.g. [this recent study](http://doi.org/10.1371/journal.pbio.1001636)).  If that was a viable option we could just publish abstracts and have papers available on request too.  If you need to know who wants your data, why not do the same for papers?   

