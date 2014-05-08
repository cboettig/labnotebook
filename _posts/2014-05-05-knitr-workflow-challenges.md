---
layout: post
title: "Deep challenges to dynamic documentation in daily workflows"
category: open-science
tags:
- blog
- open-science
- workflow
- R

---

We often discuss dynamic documents such as `Sweave` and `knitr` in reference
to final products such as publications or software package vignettes.
In this case, all the elements involved are already fixed: external
functions, code, text, and so forth.  The dynamic documentation
engine is really just a tool to combine them (knit them together).
Using dynamic documentation on a day-to-day basis on ongoing research
presents a compelling opportunity but a rather more complex challenge
as well.  The code base grows, some of it gets turned into external
custom functions where it continues to change. One analysis script
branches into multiple that vary this or that.  The text and figures
are likewise subject to the same revision as the code, expanding and
contracting, or being removed or shunted off into an appendix.

Structuring a dynamic document when all the parts are morphing and moving
is one of the major opportunities for the dynamic approach, but also the
most challenging.  Here I describe some of those challenges along with
various tricks I have adopted to deal with them, mostly in hopes that
someone with a better strategy might be inspired to fill me in.



The old way
-----------

For a while now I have been using the [knitr](http://yihui.name/knitr)
dynamic documentation/reproducible research software for my project
workflow.  Most discussion of dynamic documentation focuses on 'finished'
products such as journal articles or reports.  Over the past year, I
have found the dynamic documentation framework to be particularly useful
as I develop ideas, and remarkably more challenging to then integrate
into a final paper in a way that really takes advantage of its features.
I explain both in some detail here.

My former workflow followed a pattern no doubt familiar to many:

* Bash away in an R terminal, paste useful bits into an R script...
* Write manuscript separately, pasting in figures, tables, and in-line
values returned from R.

This doesn't leave much of a record of what I did or why, which is
particularly frustrating when some discussion reminds me of an earlier
idea.


Dynamic docs: `.Rmd` files
------------------------

When I begin a new project, I now start off writing a `.Rmd` file, intermixing
notes to myself and code chunks.  Chunks break up the code into conceptual
elements, markdown gives me a more expressive way to write notes than
comment lines do.  Output figures, tables, and in-line values inserted.
So far so good.  I version manage this creature in git/Github.  Great,
now I have a trackable history of what is going on, and all is well:

1. Document my thinking and code as I go along on a single file
scratch-pad

2. Version-stamped history of what I put in and what I got out on each
step of the way

3. Rich markup with equations, figures, tables, embedded.

4. Caching of script chunks, allowing me to tweak and rerun an analysis
without having to execute the whole script.  While we can of course
duplicate that behavior with careful save and load commands in a script,
in knitr this comes for free.


Limitations to .Rmd alone
----------------------------------

1. As I go along, the `.Rmd` files starts getting too big and cluttered
to easily follow the big picture of what I'm trying to do.

2. Before long, my investigation branches.  Having followed one `.Rmd`
script to some interesting results, I start a new `.Rmd` script
representing a new line of investigation.  This new direction will
nevertheless want to re-use large amounts of code from the first file.

A solution? The R package "research compendium" approach
---------------------------------------------------------

I start abstracting tasks performed in chunks into functions, so I
can re-use these things elsewhere, loop over them, and document them
carefully somewhere I can reference that won't be in the way of what
I'm thinking. I start to move these functions into `R/` directory of an R
package structure, documenting with `Roxygen`. I write unit tests for these
functions (in `inst/tests`) to have quick tests to check their sanity
without running my big scripts (recent habit).  The package structure
helps me:

* Reuse the same code between two analyses without copy-paste or getting
our of sync
* Document complicated algorithms outside of my working scripts
* Test complicated algorithms outside of my working scripts (`devtools::check` and/or unit tests)
* Manage dependencies on other packages (DESCRIPTION, NAMESPACE),
including other projects of mine


This runs into trouble in several ways.


Problem 1: Reuse of code chunks
-------------------------------


What to do with code I want to reuse across blocks but do not want to write as a function, document, or test?

_Perhaps this category of problem doesn't exist, except in my laziness._

This situation arises all the time, usually through the following mechanism: almost
any script performs several steps that are best represented as chunks calling different
functions, such as `load_data`, `set_fixed_parameters`, `fit_model`, `plot_fits`, etc. I
then want to re-run almost the same script, but with a slightly different configuration
(such as a different data set or extra iterations in the fixed parameters).  For just
a few such cases, it doesn't make sense to write these into a single function,[^1]
instead, I copy this script to a new file and make the changes there.

This is great until I want to change something in about the way both scripts behave
that cannot be handled just by changing the `R/` functions they share.  Plotting
options are a good example of this (I tend to avoid wrapping `ggplot` calls as
separate functions, as it seems to obfuscate what is otherwise a rather semantic
and widely recognized, if sometimes verbose, function call).


[^1]: If I have a lot of different configurations, it may make sense to
wrap up all these steps into a single function that takes input data
and/or parameters as it's argument and outputs a data frame with the
results and inputs.


I have explored using `knitr`'s support for external chunk inclusion, which
allows me to maintain a single R script with all commonly used chunks,
and then import these chunks into multiple `.Rmd` files.  An example of
this can be seen in my `nonparametric-bayes` repo, where several files
(in the same directory) draw most of their code from [external-chunks.R](https://github.com/cboettig/nonparametric-bayes/blob/9232dfd814c40e3c48c5a837be110a870d8639da/inst/examples/BUGS/external-chunks.R).



Problem 2: package-level reproducibility
-----------------------------------------

_Minor/relatively easy to fix._

Separate files can frustrate reproducibility of a given commit.
As I change the functions in `R/`, the `.Rmd` file can give different results despite
being unchanged.  (Or fail to reflect changes because it is caching
chunks and does not recognize the function definitions have changed
underneath it).  Git provides a solution to this: since the `.Rmd`
file lives in the same git repository (`inst/examples`) as the package,
I can make sure the whole repository matches the hash of the `.Rmd` file:
`install_github("packagename", "cboettig", "hash")`.

This solution is not fail-safe: the installed version, the potentially
uncommitted (but possibly installed) version of the R functions in the
working directory, and the R functions present at the commit of the `.Rmd`
file (and thus matching the hash) could all be different.  If we commit
and install before every `knit`, we can avoid these potential errors
(at the cost of some computational overhead), restoring reproducibility
to the chain.

Problem 3: Synthesizing results into a manuscript
--------------------------------------------------

In some ways this is the easiest part, since the code-base is relatively
static and it is just a matter of selecting which results and figures
to include and what code is necessary to generate it.  A few organizational
challenges remain:

While we generally want `knitr` code chunks for the figures and tables
that will appear, we usually aren't interested in displaying much,
if any, of the actual code in the document text (unlike the examples
until this point, where this was a major advantage of the knitr approach).
In principle, this is as simple as setting `echo=FALSE` in the global
chunk options.  In practice, it means there is little benefit to having
the chunks interwoven in the document.  What I tend to want is having
all the chunks run at the beginning, such that any variables or results
can easily be added (and their appearance tweaked by editing the code)
as figure chunks or in-line expressions. The only purpose of maintaining
chunks instead of a simple script is the piecewise caching of chunk
dependencies which can help debugging.

Since displaying the code is suppressed, we are then left with the somewhat
ironic challenge of how best to present code as a supplement.  One option
is simply to point to the source `.Rmd`, another is to use the `tangle()`
option to extract all the code as a separate `.R` file.  In either case,
the user must also identify the correct version of the R package itself
for the external `R/` functions.

Problem 4: Branching into other projects
-----------------------------------------

Things get most complicated when projects begin to branch into other projects.
In an ideal world this is simple: a new idea can be explored on a new branch
of the version control system and merged back in when necessary, and an
entirely new project can be built as a new R package in a different repo that
depends on the existing project. After several examples of each, I have learned
that it is not so simple. Despite the nice tools, I've learned I still need
to be careful in managing my workflows in order to leave behind material that
is understandable, reproducible, and reflects clear provenance.  So far, I've
learned this the hard way. I use this last section of the post to reflect
on two of my own examples, as writing this helps me work through what I should
have done differently.


### example: warning-signals project

For instance, my work on early warning
signals dates back to the start of my [open notebook on
openwetware](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook/Stochastic_Population_Dynamics/2010/02/09),
when my code lived on a Google code page which seems to have
disappeared. (At the time it was part of my 'stochastic population
dynamics' project). When I moved to Github, this project got it's own
repository, [warningsignals](https://github.com/cboettig/warningsignals),
though after a major re-factorization of the code I moved to a new
repository, [earlywarning](https://github.com/cboettig/earlywarning).
Okay, so far that was due to me not really knowing what I was doing.

My first paper on this topic was based on the master branch of
that repository, which still contains the code required. When
one of the R dependencies was moved from CRAN I was able to
update the codebase to reflect the replacement package (see issue
[#10](https://github.com/cboettig/earlywarning/issues/10)). Even
before that paper appeared I started exploring other issues on
different [branches](https://github.com/cboettig/earlywarning/network),
with the `prosecutor` branch eventually becoming it's own paper,
and then it's [own repository](https://github.com/cboettig/prosecutors-fallacy/).

That paper sparked a comment letter in response to it, and the
analysis involved in my reply piece was just developed on the
same master branch of the prosecutor-fallacy repository. This
leaves me with a total of three repositories across four branches,
with one repo that corresponds more-or-less
directly to a paper, one to two papers, and one to no papers.

All four branches have diverged and unmerge-able code. Despite sharing and reusing
functions across these projects, I often found it better to simply
change the function on the new branch or new repo as I desired
for the new work. These changes could not be easily merged back
as they broke the original function calls of the earlier work.


Hindsight being 20-20, it would have been preferable that I had
maintained one repository, perhaps developed each paper on
a different branch and clearly tagged the commit corresponding
to the submission of each publication.  Ideally these could be merged
back where possible to a master branch. Tagged commits provide
a more natural solution than unmerged branches to deal with
changes to the package that would break methods from earlier publications.


### example: optimal control projects

A different line of research began through a NIMBioS working group
called "Pretty Darn Good Control", beginning it's digital life in
my [pdg_control](https://github.com/cboettig/pdg_control) repository. Working in different break-out
groups as well as further investigation on my own soon created
several different projects. Some of these have continue running towards
publication, others terminating in dead ends, and still others becoming
completely separate lines of work. Later work I have done in optimal
control, such [nonparametric-bayes](https://github.com/cboettig/nonparametric-bayes) and [multiple_uncertainty](https://github.com/cboettig/multiple_uncertainty)
depend on this package for certain basic functions, though both
also contain their own diverged versions of functions that first
appeared in [pdg_control](https://github.com/cboettig/pdg_control).

Because the topics are rather different and the shared code footprint
is quite small, separate repositories probably makes more sense here.
Still, managing the code dependencies in separate repositories
requires extra care, as checking out the right version of the focal
repository does not guarantee that one will also have the right version
of the [pdg_control] repository. Ideally I should note the hash of
[pdg_control] on which I depend, and preferably install that package
at that hash (easy enough thanks to `devtools`), since depending
on a separate project that is also still changing can be troublesome.
Alternatively it might make more sense to just duplicate the original
code and remove this potentially frail dependency. After all, documenting
the provenance need not rely on the dependency, and it is more natural
to think of these separate repos as divergent forks.



