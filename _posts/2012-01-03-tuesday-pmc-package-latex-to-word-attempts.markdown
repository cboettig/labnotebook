---
comments: true
date: 2012-01-03 18:49:10
layout: post
slug: tuesday-pmc-package-latex-to-word-attempts
title: 'Tuesday: pmc package, latex to word attempts'
redirects: [/wordpress/archives/3557, /archives/3557]
categories:
- evolution
---

Back from Oz.


## Evolution submission: Latex to word


Final submission needs editable copy.  No great solutions for latex to word, despite quite a few options:



	
  * tex2rtf is a fast solution to get something, but not successful on images or equations.  Ended up going with this after all.

	
  * pandoc is a generic converter _to_ many types, but has only partial support for latex input.  Does okay on text, but fails on even simple things like italics and natbib citations

	
  * lyx sounded like a promising solution, as lyx has a OpenDocument export option.  Unfortunately I could only get a blank .odt out.

	
  * tex4ht doesn't work out of the box (though[ a lot of work](http://ubuntuforums.org/showthread.php?t=1033441) might get around this)


```bash
mk4ht oolatex file.tex
```




	
  * lots of ways to go to html, or pdf into word, but all seem lossy.  More possible solutions on Q&A's [askubuntu](http://askubuntu.com/questions/82634/how-to-convert-tex-into-odt) and [tex](http://tex.stackexchange.com/questions/4145/workflow-for-converting-latex-into-open-office-ms-word-format), from which many of these suggestions came as well.  Still no robust solutions.  Why don't we all just use html these days?




### pmc


Revised the front-end for this package entirely over the break. Adding some polish, cleaning up the package, and writing a new vignette for the update today.


##### A few random notes





	
  * Need a commented command for Vignette to pass R CMD check that gives the vignette a title
 

```latex
%\VignetteIndexEntry{Using PMC}
```



	
  * sorting out the vignette with the updated examples, using knitr (thank goodness for caching, geiger performance sucks).

	
  * Comment out the parallelization for generality?




## Misc





	
  * Website configuration: cloudflare



	
  * Mendeley duplicate bibtex entries are very annoying.  A [hack](http://pleasemakeanote.blogspot.com/2010/06/deleting-duplicate-bibtex-entries-from.html) solution.  Vote for [this issue on the bug list](http://feedback.mendeley.com/forums/4941-mendeley-feedback/suggestions/699640-fix-bibtex-library-bugs-update-and-remove-duplica).



	
  * Hmm..., interesting: [live-r ](http://www.live-r.com/)


