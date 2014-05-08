---
layout: post
category: open-science
tags:
- blog
- reproducible-research
- labnotebook
---


For a while now most of my active research is developed through `.Rmd`
scripts connected to a particular project repository (something I discuss
at length in [deep challenges with knitr workflows](http://www.carlboettiger.info/2014/05/05/knitr-workflow-challenges.html)). In the [previous
post](http://www.carlboettiger.info/2014/05/06/steps-to-a-more-portable-workflow.html) I discuss creating a `template` package with a more transparent
organization of files, such as moving manuscripts from `inst/doc/` to
simply `manuscripts/`.  This left these exploratory analysis scripts in
`inst/examples` in a similarly unintuitive place.  Though I like having
these scripts as part of the repository (which keeps everything for
a project in one place, as it were), like the manuscript they aren't
really part of the R package, particularly as I have gotten better at
creating proper unit tests in place of just rerunning dynamic scripts
occasionally.

I've also been nagged by the idea of having to always just link to
these nice dynamic documents from my lab notebook. Sure Github renders
the markdown so that it's easy enough to see highlighted code and
figures etc., but it still makes them seem rather external.  Occasionally
I would copy the complete `.md` file into a notebook post, but this
divorced it of it's original version history and associated `.Rmd`
source.

One option would be to move them all directly into my lab notebook,
`.Rmd` files and all.  This would integrate the scripts more nicely
than Github's own rendering, matching the URL and look and feel
of my notebook. It would also allow for javascript elements such as MathJax
equations, Google Analytics, and Disqus that are not possible when
only linking to an `.md` file on Github.

In the recent [ropensci/docs](https://github.com/ropensci/docs) project
we are exploring a way to have Jekyll automatically compile (potentially
with caching) a site that uses `.Rmd` posts and deploy to Github
all using `travis`, but we're not quite finished and this is
potentially fragile particularly with the hundreds of posts in
this notebook. Besides this, the notebook structure is rather temporally
oriented, (posts are chronological and reflected in my URL structure)
while these scripts are largely project-oriented. (Consistent use of
categories and tags would ameliorate this).


### Embedding images in `.Rmd` outputs

A persistent challenge has been how best to deal with images created by
these scripts, some of which I may run many times. By default `knitr`
creates `png` images, which as binary files are ill suited for committing
to Github, and which could bloat a repository rather quickly.  For
a long while I have used custom hooks to push these images to `flickr`,
(see [flickr.com/cboettig](http://flickr.com/cboettig)), inserting the
permanent flickr URL into the output markdown.

Recently Martin Fenner convinced me that `svg` files would both render
more nicely across a range of devices (being vector graphics), and
could be easily committed to Github as they are text-based (XML) files,
so that reproducing the same image in repeated runs wouldn't take
up any more space.  We can then browse a nice version history of the
any particular figure, and this also keeps all the output material together,
making it easier to archive permanently (certainly nicer than my old
archiving solution using data URIs.). Lastly, `svg` is both web native,
being a standard namespace of HTML5, and potentially interactive, as the
[SVGAnnotation](http://www.omegahat.org/SVGAnnotation/) R package illustrates.  So, lots of advantages in using `svg`
graphics.

Using `svg` files also bring some unique challenges.  Unlike when `png`
files are added to Github, webpages cannot directly link them since
Github enforces rendering them as text instead of an image through its
choice of HTML header, for security reasons. This means the only way
to link to an `svg` file on Github is to have that file on a `gh-pages`
branch, where it can be rendered as a website.  A distinct disadvantage
of this approach is that while we can link to a specific version of
any file on Github, we see only the most recent version rendered
on the website created by a `gh-pages` branch.

On the other hand, having the `svg` files on the `gh-pages` branch further
keeps down the footprint of the project `master` branch.  This leads
rather naturally to the idea that the `.Rmd` files and their `.md`
outputs should also appear on the `gh-pages` branch.  This removes them
from their awkward home in `inst/examples/`, and enables all the
benefits of custom CSS, custom javascript, and custom URLs that we
don't have on Github's rendering.

To provide a consistent look and feel, I merely copied over the `_layouts`
and `_includes` from my lab notebook, tweaking them slightly to
use the assets already hosted there. I add custom domain name for the
all my `gh-pages` as a sub-domain, `io.carlboettiger.info` [^1], and now instead of having script
output appear like so:

[nonparametric-bayes/inst/examples/gaussian-process-basics.md](https://github.com/cboettig/nonparametric-bayes/blob/7dd8fc444cb9d20d839286eac8068b3099ea9b6a/inst/examples/gaussian-process-basics.md)

I have the same page rendered on my `io` sub-domain:

[io.carlboettiger.info/nonparametric-bayes/gaussian-process-basics.html](http://io.carlboettiger.info/nonparametric-bayes/gaussian-process-basics.html)

with its mathjax, disqus, matching css, URL and nav elements.

Landing pages
-------------

An obvious extension of this approach is to grab a copy of the repository
README and rename it `index.md` and add a yaml header such that it serves
as a landing page for the repository.  A few lines of Liquid code
can then generate the links to the other output scripts, as in this example:

[io.carlboettiger.info/nonparametric-bayes](http://io.carlboettiger.info/nonparametric-bayes/)


Template
--------

I have added a `gh-pages` branch with this set up to my new `template` repository,
with some more [basic documentation and examples](http://io.carlboettiger.info/template/README).


[^1]: There's no need to use a different sub-domain than the rest of my
website, other than that it would require my notebook be hosted on
the [cboettig.github.com](https://github.com/cboettig/cboettig.github.com)
repo instead of [labnotebook](https://github.com/cboettig/labnotebook).
However I prefer keeping my hosting on the repository I already have,
and it also seems a bit unorthodox to host all my repositories on my
main domain.  In particular, it increases the chance for URL collisions
if I create a repository with the same name as a page or directory
on my website.  Having gh-pages on the `io` sub-domain feels like just
the right amount of separation to me.






