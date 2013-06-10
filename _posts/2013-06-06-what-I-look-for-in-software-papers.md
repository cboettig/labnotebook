---
title: "What I look for in 'Sofware Papers'"
subtitle: "pet peeves and faux pas"


---


I am more and more frequently reviewing 'software papers:' which I define as publications whose primary purpose is to publicize a piece of scientific software and provide a traditional research product with hopes that it will receive citations and recognition from other researchers in grant and job reviews.  To me this feels very much like hacking the publication recognition system rather than the ideal way to recognize and track the role of software in research communities, but a very pratical one in the current climate.  I have written two myself, so I have been on both ends of this issue. 

I don't include "to document" the software as a purpose, since none do so very comprehensively, and besides, documentation belongs in the software, not in a journal. "Publicize" usually includes some motivating examples that could convince many readers that the software does something useful for them without too much effort.  As such, I expect the paper to provide the journal's audience with a clear motivation for why the package is useful, and at least one functioning "wow" example that I can run and understand without difficulty. This is a low bar, though still often missed in round 1, that I hope will encourage these kinds of contributions.  But that is not why I am writing this post.


I see papers about software packages primarily as invitations to review the software itself, not just the paper. I assume most other authors, reviewers and editors on this content share this implicit assumption, but I'd love to hear first hand from anyone else.  When I review software, there are some pet peeves or faux pas that I see appear again and again, so I thought I'd take a moment to write them out here.  (If you end up with a copy-paste of this at some later date, my apologies but I got tired of writing the same thing over and over again.  And if it's not signed, then someone else also got tired of writing the same thing over and over again.)

As I am almost always reviewing R packages, the software already meets some very basic standards required by submission to CRAN: dependencies and license stated, built-in documentation, passing some minimal automatic checks, etc.  (See the [CRAN Policies]() and the [Writing R Extensions Manual]() for details).  This is great, as it clears the first few hurdles of installation, etc without much fuss, but still provides a bar that is by itself unacceptably low for published scientific software. Here is a list of the things I see that most often frustrate me, which range from rather minor pet peeves to absolutely essential elements. 

### Automatic tests

A scientific R package _must must must_ have some automated tests that are run by `R CMD check`.  Even if further development of the package doesn't break anything (most likely only if further development doesn't happen), changes to the package dependencies could still break things, and so it is crucial to have a mechanism in place to detect these problems when they arise.  For code that runs quickly, the simplest way to do this is through the examples  in the documentation.  I don't expect all scientific software to have a complete test suite with 100% coverage covering all the weird things that can happen if a user passes in a matrix when the function expects a data frame or has some unanticipated missing values, etc. Just some tests to make sure the basic examples execute and I'll be happy. Longer running functions or those that need calls to external web resources shouldn't be run in the examples (too much of a burden for CRAN's automatic testing) so they should be marked `dontrun` and put in a separate test suite or vignette as it says in the manual. 

### Passing optional arguments

I see code like this all the time:

```{r}
f <- myfunction(
```

### IMPORTS not DEPENDS

Many developers overlook that package dependencies that provide functions your functions will use internally should be listed as under IMPORTS rather than DEPENDS.  This keeps the users namespace cleaner and avoids collisions of functions having the same name.

If you are an author, editor, or reviewer of R software packages, what are your pet peeves? 


(as proposed in 



