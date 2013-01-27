---
layout: post
published: false

---

Dear John,

I have read with interest the manuscript of the book "Dynamic Report Generation with R and knitr" and highly recommend it for publication.  

> 1. Who would find this type of book useful? Can you describe a kind of book that is needed in this area? Will the book serve as a reference, textbook, or both?
        
This book would serve primarily as a reference and an independent tutorial.  While it is unlikely that a course would be based on directly on the book, instructors may recommend this text to students as there are few definitive introductions to this topic available. There is a rapidly growing interest in the topic of dynamic documentation and reproducible research (e.g. Peng 2011, Science, 10.1126/science.1213847), in the R language for statistical computing.   The knitr package itself has already garnered a substantial user base across a range of statistical and life science applications, and is ripe for a comprehensive reference and text such as this one.  
        
> 2.  Would you recommend any changes in the contents that would make this book more useful?
        
Overall the coverage and organization of the manuscript is excellent.  I would not suggest any major revisions to its structure at this time.       
        
> 3. Please explain why you do or do not regard the manuscript as technically correct, clearly written, and at an appropriate level of difficulty. What are its strengths and weaknesses? You may comment on the manuscript; if you do so, please separate the marked pages.
        
        
The manuscript is technically accurate, clearly written and appropriately referenced.  
        
 I have a few minor comments: 

* Page 54: The first mention of roxygen comes without definition or context.  This is particularly unfortunate as the book would do well to track roxygen back to doxygen and the literate programming tradition that also lead to Sweave and knitr discussed in the introduction, and distinguish between the one that has become the in-code lterate programming tool for R (roxygen) and the other that has morphed into the topic of this book, dynamic documentation.  

* Page 57: A clearer distinction between code formatting and code decoration (e.g. highlighting) would be useful.  The former has a much longer history of formal guidelines.  Also, certain tools responsible for syntax highlighting are more syntax aware than others; for instance, I believe the highlighter used for the LaTeX highlighting is aware of what special terms are defined as functions in R, and are capable of correctly highlighting custom functions, while certain HTML highlighters must merely guess from syntax use.  

* Page 81: Query not shown that generates the list output.  Seems to be inconsistent with earlier examples where such queries are shown.  

* Page 141: Codebox overflows slightly.

* Page 147: Mentions Windows and Linux users.  While the mention of Linux is appreciated and subsumes the Mac case, readers might prefer Macs be mentioned explicitly?  

* Page 150: While supporting Jekyll liquid code blocks was very useful when the feature was first introduced, since Jekyll 0.12.0 this use seems slightly more antiquated, as redcarpet is now supported natively with automatic recognition of the Github flavored markdown delimiters used throughout the text.  
        
It's greatest weakness is the fast-moving nature of its subject.  The technology and software described here are cutting edge and completely up to date at this time.  While users should be able to continue to rely on this material as an introduction to the methods and tools discussed here, it is likely that important new capabilities will be added in the future that are not covered in this book.  It is likely that online documentation and potentially later versions of the book could help address such changes as they occur.   
       
> 4. What other books are available on this subject? Do they have any particularly strong or weak features? Does this book offer any significant advantages?
        
There are no other books on this subject that I am aware of.  Certainly there are no books describing the knitr system in particular, but even the larger topic of dynamic documents has few texts at this level.  
        
> 5. Please explain why you would or would not recommend publication. If you would, what are the most important changes that should be made before publication?
        
I would strongly recommend this for publication.   This is an important contribution in an area that is a hot topic and rapidly expanding interest.  Any researcher making regular use of R will find this an essential and accessible introduction to dynamic documentation, furthering the trend already started by the original launch of this package into a more widespread adoption of dynamic documentation. Meanwhile, I believe even advanced users of knitr will discover something new in reading this book.  I, for instance, have followed and used knitr since its early development but was unaware of the support for data URIs embedding images, which is absolutely brilliant.  

The original Sweave system had several limitations that impeded more widespread adoption, including the dependency on LaTeX, the lack of certain features like highlighting and caching and the difficulty of intelligently extending them, or support for animations and the web-native formats of markdown and HTML.  


