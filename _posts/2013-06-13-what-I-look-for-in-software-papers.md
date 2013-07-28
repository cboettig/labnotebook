---
layout: post
title: "What I look for in 'Software Papers'"
subtitle: "pet peeves and faux pas"
category: ecology
tags: 
- blog

---


**Update** Thanks to the rich discussion in the comments and beyond,
I've revised my thoughts on this somewhat, as I discuss in [this more
recent post](/2013/07/09/reviewing-software-revisited.html).  

I am more and more frequently reviewing 'software papers:' which I
define as publications whose primary purpose is to publicize a piece
of scientific software and provide a traditional research product
with hopes that it will receive citations and recognition from other
researchers in grant and job reviews.  To me this feels very much like
hacking the publication recognition system rather than the ideal way to
recognize and track the role of software in research communities, but a
very practical one in the current climate.  I have written two myself,
so I have been on both ends of this issue. In this post, I share what
I look for in such papers and what omissions I see most frequently.

Reviewing software 
------------------

If we are going to employ this hack of the publication system for
software, we should at least use it to maximal advantage.  As a reviewer,
I feel that means reviewing not just the submitted manuscript but the
software itself.  If we can agree on nothing else, we as a community
should at least be able to say:

> my review of a software paper is a review of the software

 I assume most other authors, reviewers and editors on this content share
 this implicit assumption, but I'd love to hear first hand from anyone
 else.  For instance: as an editor, what would you do if your reviewers
 only commented on the paper directly and not on the software distributed?


We are not really taught to review software, any more than we are
taught to write it in the first place.  Most journals offer little
guidance on this  (though see the Journal of Open Research Software
[guidelines for peer review of
software](http://openresearchsoftware.metajnl.com/peer-review/), all
though they are still rather minimal.)  In the absence of a culture on
software reviewing, I thought I would lay out my own perspective with
the hope of hearing feedback and push back from others. Perhaps through
such dialogs we can develop clearer expectations for this rapidly
expanding genre.



Reviewing the software paper 
---------------------------


I don't include "to document" the software as a purpose, since none do so
very comprehensively, and besides, documentation belongs in the software,
not in a journal. "Publicize" usually includes some motivating examples
that could convince many readers that the software does something useful
for them without too much effort.  As such, I expect the paper to:

* provide the journal's audience with a clear motivation for why the
package is useful, * and have at least one functioning "wow" example
that I can run (by copy-paste) and understand without difficulty
(e.g. without referring to code comments or the package manual to
understand the function calls and their arguments).

This is an intentionally low bar that I hope helps promote these kinds of
contributions.   Despite this, papers frequently fail the copy-paste test
or the plain text explanations of the function calls.  Come on people.
Meanwhile, I try to focus the rest of my review on the software itself.



My partial list of criteria
----------------------------

As I am almost always reviewing R packages, the software already
meets some very basic standards required by submission to
CRAN: dependencies and license stated, built-in documentation,
passing some minimal automatic checks, etc.  (See the [CRAN
Policies](http://cran.r-project.org/web/packages/policies.html)
and the [Writing R Extensions
Manual](http://cran.r-project.org/doc/manuals/R-exts.html) for details).
This is great, as it clears the first few hurdles of installation,
etc. without much fuss, but still provides a bar that is by itself
unacceptably low for published scientific software. Here is a list of
the things I see that most often frustrate me.  This isn't intended as
a style-guide or a comprehensive list of best practices, just my own
pet peeves. I have somewhat tongue-in-cheek labeled them by severity 
of the review I might give; which like any other use of these terms is more of a 
measure of how annoyed I am then anything else.  Critiques and suggestions welcome.


### Edit:

The comments from other reviewers, authors, and editors have been fantastic,
thank you all.  I particularly appreciate the opportunity to have reviewing 
styles critiqued, something that does not happen in normal peer review.  

Just a note on my headings here. I do not see any of these things as
"gatekeeping requirements" and have intentionally omitted the option of
"_Reject_".  I would reject such a paper for methodological flaws, etc.,
but not for any of the reasons on my list below. The list is intended
only to improve, not prevent, software publication.

I believe any of the decisions below typically result in a revision
to the same journal, that authors judiciously choose how to respond to
reviewer comments guided by the editor's own feedback, and that it is
ultimately the editor's decision whether any of this is relevant. `</edit>`


"Reject and resubmit" 
--------------------


### Automatic tests

A scientific R package _must must must_ have some automated tests that are
run by `R CMD check`.  Even if further development of the package doesn't
break anything (most likely only if further development doesn't happen),
changes to the package dependencies could still break things, and so it
is crucial to have a mechanism in place to detect these problems when
they arise.  For code that runs quickly, the simplest way to do this is
through the examples  in the documentation.  I don't expect all scientific
software to have a complete test suite with 100% coverage covering all
the weird things that can happen if a user passes in a matrix when the
function expects a data frame or has some unanticipated missing values,
etc. Just some tests to make sure the basic examples execute and I'll
be happy. Longer running functions or those that need calls to external
web resources shouldn't be run in the examples (too much of a burden for
CRAN's automatic testing) so they should be marked `dontrun` and put in
a separate test suite or vignette as it says in the manual.

### Passing optional arguments

I see authors write functions like this all the time:

```r
f <- myfunction(f, p){ 
  #  stuff
  o <- optim(f, p)
  #  stuff
}
```

calling an existing library function like `optim` that has a whole host of
very useful optional arguments that have a significant impact on how the
algorithm functions. Whenever you a rich function like `optim`, please
have the courtesy to make it's arguments available to future users and
developers through your function call. Yes, most users will just want
the default arguments, (or your default arguments, if different), and
that can be handled just fine by providing default values as optional
arguments.  R has a fantastic mechanism for this exact issue: the `...`
argument. The above code could be fixed simply by using:

```r
f <- myfunction(f, p, ...){ 
  #  stuff
  o <- optim(f, p, ...)
  #  stuff
}
```

which works just they way you think it would. If you have more than one
such function (ask yourself if you can write shorter functions first
and then) pass optional arguments as lists,

```r
f <- myfunction(f, p, optim_options, fn2_options){
  # stuff
  o <- do.call(optim, as.list(c(f, p, optim_options)))
  # stuff
  b <- do.call(fn2, fn2_options)
  # stuff 
}
```
arguments can also be extracted with `list(...)$arg1` etc. 

A converse of this issue is not providing default arguments where
it might be natural to do so.  This does not bother me so much, as
it is probably useful to force the user to think how many iterations
`n` are appropriate for their problem rather than just assuming that
`100` is good because it is the default.  The only time this case is
annoying is when the argument will not be changing -- such as a user's
authentication token to access a web resource.  Don't make me manually
pass the token to every function in the library please.


### Development site and bug tracker

I would really like to see a link to the software development page, such
as r-forge or Github.  The primary asset in this context is pointing
reviewers to an address with a bug tracking system where issues can be
assigned ticket numbers and readers can transparently see if a package
is being actively maintained.  A reader who comes across the paper years
later who has only an email address that may or may not work has little
way to determine what the latest version of the code is, whether it is
actively maintained, or whether earlier versions that may have been in
used in previous publications suffered from any significant bugs.

### Cite your dependencies!

We write software papers with the sometimes vain hope that they will
be cited by users, so authors of such papers should at least follow
these best practices themselves. R includes a native mechanism
for providing citations to packages, `citation(packagename)`,
including the information for any software paper published along
with it.  Be sure to add your own software papers to the `CITATION`
file.  More information can be found in my post on [Citing R
packages](http://purl.org/cboettig/2012/03/20/citing-r-packages.html).


"Major Revisions"
---------------

These are other things that commonly frustrate me, but fall on a bit
more of a continuum of style rather than gross oversights.  As such I'm
not sure that any one of these things would justify rejection.

### Functionalize the code

Style guides will tell you to keep functions short, not more than a screen
or 20 lines.  Breaking large functions into a series of smaller functions
and documenting those smaller functions -- even if they are only used
internally -- is a great help to a reviewer trying to understand what
a function is supposed to do and also test that it does what it says.
Anyone building the code base later (most often yourself) will appreciate
the reusable modules.

### Stable, clean, and complete return objects

An extension of providing optional arguments to functions is to
also provide access to all of their return information.  To extend
the example from wrapping `optim`, this would involve returning the
convergence information.  Using object classes and helper functions
for return objects helps keep code stable and lets users leverage
existing code for similar objects, such as fitting or plotting
routines. More discussion on this topic based on my own experiences
in the post, [we need more object oriented design in comparative
methods](http://carlboettiger.info/2013/04/23/we-need-more-object-oriented-design-in-comparative-methods.html#comment-878249659)

### State a license

Because CRAN requires this through the DESCRIPTION file, R package
authors rarely neglect this entirely.  A sometimes misconception is that
because R itself is primarily dual-licensed under GPL-2 and GPL-3 that
R packages must use a GPL license due to the "viral" clause of the GPL.
This clause only applies if you are modifying existing GPL functions
directly and is not a requirement for R packages, which recognize a
large array of licenses.  My own recommendation for authors seeking to
maximize the impact of  their work is to use MIT, BSD (2 clause), or
CC0 license for the package.  CC0 has the advantage of being suitable
for and data or documentation included, but authors should do there
homework and decide what is best for them.



"Minor Revisions"
----------------


Consistent use of coding style, good documentation, clear examples,
intelligent reuse of code, and other best practices are all areas in
which any work could improve. While we can all become better developers
by highlighting these issues in our reviews, they are probably best
developed over time and in dialog with the user community.  I also put
anything extending the scope of functionality into this category --
I do not have any concept of minimal contribution as long as the code
meets the criteria above.  Meanwhile, there's always a few pet peeves I
just cannot help mentioning. Here's one which is particular to R packages
and so commonly overlooked.


### IMPORTS not DEPENDS

Many developers overlook that package dependencies that provide functions
your functions will use internally should be listed as under IMPORTS
rather than DEPENDS.  This keeps the users namespace cleaner and avoids
collisions of functions having the same name. Use DEPENDS only for those
packages whose functions will be used by the end user as well.


------------------------------------------------------------------------------


If you are an author, editor, or reviewer of R software packages, what are your pet peeves? 



[^1]: I listed some of these complaints at the end of a post almost exactly 2 years ago, see [faux pas](http://carlboettiger.info/2011/06/04/saturday-git-with-latexdiff-treebase-and-pmc-package-updates-bounds-on-lambda.html).  As I continue to see many of the same issues I believe these are relatively common mistakes. 

