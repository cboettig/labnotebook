---
layout: post
categories: open-science
tags:
- blog
- reproducible-research

---

While I have made [my
workflow](http://www.carlboettiger.info/2012/05/06/research-workflow.html)
for most of my ongoing projects available on Github for some time, this
does not mean that it has been particularly easy to follow. Further,
as I move from project to project I have slowly improved how I handle
projects. For instance, I have since added unit tests (with `testthat`)
and continuous integration (with [travis-ci](http://travis-ci.org))
to my repositories, and my handling of manuscripts has gotten more
automated, with richer latex templates, yaml metadata, and simpler and
more powerful makefiles.

Though I have typically used my most recent project as a
template for my next one (not so trivial as I work on several at
a time), I realized it would make sense to just maintain a general
template repo with all the latest goodies.  I have now launched my
[template](https://github.com/cboettig/template) on Github.

I toyed with the idea of just treating the manuscript as a standard
vignette, but this would make `pandoc` an external dependency for the
package, putting an unecessary burden on `travis` and users. I settled
on creating a `manuscripts` directory in the project root folder as the
most semantically obvious place.  This is added to `.Rbuildignore` as
it doesn't fit the standard structure of an R package, but since it is
not a vignette and cannot be built with the package dependencies anyhow,
this seems to make sense to me.[^1]

The manuscript itslef is written in `.Rmd`, with
a `yaml` header for the usual metadata of authors,
affiliations, and so forth.  Pandoc's recent support for [yaml
metadata](https://github.com/cboettig/template/blob/master/manuscripts/manuscript.Rmd#L1-27)
makes it much easier to use `.Rmd` with a
LaTeX template, making `.Rnw` rather unnecessary.  [My
template](https://github.com/cboettig/template/blob/master/manuscripts/components/elsarticle.latex)
includes a custom `LaTeX` template that includes pandoc's
macros for inserting authors, affiliations, and so forth
in the correct LaTeX elements, though pandoc's [default
template](https://github.com/jgm/pandoc-templates/blob/master/default.latex)
is rather good and already has macros for most things in place (meaning
you can merely declare the layout or font in the yaml header and magically
see the tex interpret it).


I have tried to keep the `manuscripts` directory relatively clean,
placing `csl`, `bibtex`, `figures/`, `cache/` and other such files in a
`components/` sub-directory.  I have also tried to keep the `Makefile`
as platform-independent as possible by having it call little Rscripts
(also housed in `components/`) rather than commandline utilities like
`sed -i` and `wget` that may not behave the same way on all platforms.

Lastly, Ryan Batts recently convinced me that providing binary cache files
of results was an important way to allow a reader to quickly engage in
exploring an analysis without having to first let potentially long-running
code execute.  `knitr` provides an excellent way to create and manage
this caching on a code chunk by chunk level, which is also crucial when
editing a dynamic document with intensive code (no one wants to rerun your
MCMC just to rebuild the pdf). Since git/Github seems like a poor option
for distributing binaries, I have for the moment just archived the cache
on a (university) web server and added a Make/Rscript line to that can
restore it from that location.  Upon publication this cache could be
permanently archived (along with plain text tables of the graphs) and
then installed from that archive instead.

I have also added a separate [README](https://github.com/cboettig/template/blob/master/manuscripts/README.md) in the manuscripts directory
to provide some guidance to a user seeking to build the manuscript.


Examples of an active projects currently using this layout for manuscripts,
etc include [RNeXML](https://github.com/ropensci/RNeXML) and [nonparametric-bayes](https://github.com/cboettig/nonparametric-bayes/)


[^1]: Perhaps I should not have the manuscript on the master branch at all, but putting it on another branch would defeat the purpose of having it in an obviously-named directory of the repository home page where it is most easy to discover.

