---
layout: post
category: open-science
tags: workflow

---

## Some thoughts on collaborating with markdown / dynamic document workflow

Collaborating on manuscripts with other researchers when not writing in
MS Word has been a perpetual nuisance for those of us not using Word (no
doubt the others might say the same). When I first began writing papers I
worked in LaTeX, and at that time I collaborated largely with others who
already knew TeX (e.g. my mentors), so this wasn't much of a problem.
While moving my workflow into markdown has simplified collaborations
with (often junior) researchers who know markdown better than tex, it
has managed to make the potential for mismatches even greater, as it
creates a barrier for both co-authors working in LaTeX as well as those
working in Word.

This has always been more of a nuisance than a real problem. I've usually
just sent co-authors some derived copy (e.g. a pdf, or sometimes creating
a Word or TeX document from the markdown using pandoc and sending that).
This means I have to transcribe or at least copy and paste the edits,
though that's never all that time consuming a process.

I still have high hopes that RStudio's `rmarkdown` format will make it
practical for co-authors to edit and compile my `.Rmd` files directly.
Meanwhile, a mentor who frequently uses LaTeX in collaborating with
Word users suggested a much simpler solution that has proven very
pratical for me so far.


### A simple solution

Based on his suggestion, I just paste the contents of the `.Rmd` file
into a Word (well, LibreOffice) document and send that. Most collaborators
can just ignore the code blocks and LaTeX equations, etc, and edit
the text directly.  I send the compiled pdf as well for the figures
and rendered equations.  A collaborator cannot easily re-compile their
changes, but I can by copy-pasting back into the `.Rmd` file. They can
track changes via Word, and I can track the same changes through the
version control when I paste their changes back in. It's not perfect,
but it's simple.


# Challenges in submission systems

## transparent figures

I use semi-transparent graphs to show ensemble distributions of stochastic trajectories.  First, a quick example as to why:



```r
ggplot(sims_data) +
  geom_line(aes(time, fishstock, group=interaction(reps,method), color=method), alpha=0.1) +
  scale_colour_manual(values=colorkey, guide = guide_legend(override.aes = list(alpha = 1))) +
  facet_wrap(~method) + guides(legend.position="none")
```

![](http://io.carlboettiger.info/nonparametric-bayes/replicates.svg)



Statistical summaries can get around this approach, but don't really reflect the true rather binary nature of the ensemble (that some trajectories go to zero while others remain around a constant level):

```r
ggplot(sims_data) +

  stat_summary(aes(time, fishstock), fun.data = "mean_sdl", geom="ribbon", fill='grey80', col='grey80') +
  stat_summary(aes(time, fishstock, col=method), fun.y = "mean", geom="line") +

#  geom_line(aes(time, fishstock, group=interaction(reps,method), color=method), alpha=0.1) +
  scale_colour_manual(values=colorkey, guide = guide_legend(override.aes = list(alpha = 1))) +
  facet_wrap(~method) + guides(legend.position="none")
```

![](http://io.carlboettiger.info/nonparametric-bayes/replicates-stat-summary-sdl.svg)


Tweaking the statistical definitions can remove the more obvious errors from this, but still give the wrong impression:


```r
mymin <- function(x) mean(x) - sd(x)
ggplot(sims_data) +

  stat_summary(aes(time, fishstock), fun.y = "mean", fun.ymin = "mymin", fun.ymax="max", geom="ribbon", fill='grey80', col='grey80') +
  stat_summary(aes(time, fishstock, col=method), fun.y = "mean", geom="line") +

#  geom_line(aes(time, fishstock, group=interaction(reps,method), color=method), alpha=0.1) +
  scale_colour_manual(values=colorkey, guide = guide_legend(override.aes = list(alpha = 1))) +
    facet_wrap(~method) + guides(legend.position="none")
```

![](http://io.carlboettiger.info/nonparametric-bayes/replicates-stat-summary.svg)



### Technical challenges in submitting transparent figures

All this works great with R+ggplot2, generating svg versions shown here
or in generating pdfs for the final manuscript.  Try and upload those
pdfs to manuscriptcentral though (or arXiv, actually) and they will
render improperly or not at all.  What ever happened to the "portable"
in "portable document format"? (Note that submission systems can take
EPS/PS, though we'd need to change our LaTeX flavor for it, but R's
graphic devices for those formats don't seem to support transparency.

It seems the problem for pdfs arises from different versions (thanks
to Rich FitzJohn for figuring this out, I would never have managed).
Transparency is natively supported in pdf >= 1.4, while in earlier versions
it is just emulated. R can generate pdfs in 1.3 (using `dev.args = list(version="1.3")`
as the knitr chunk option), but unfortunately, ggplot promotes pdfs to version 1.4:

```
Saving 7 x 6.99 in image
Warning message:
In grid.Call.graphics(L_lines, x$x, x$y, index, x$arrow) :
  increasing the PDF version to 1.4
```
I'm not quite clear what part of the ggplot command triggers this, as some
ggplot figures do render in version 1.3.  To add one more gotcha, RStudio's
`rmarkdown` by default runs pdfcrop which also promotes the pdfs to version 1.4.

It seems that pdf 1.5 works however -- opening the v1.4 pdf in inkscape and saving
as v1.5 seems to do the trick.  (the current R version seems to be 1.7, though
R supports up to 1.4).  This is the route I took for the time being with
mansucriptcentral, though frustrating that it requires a step external to the
`rmarkdown::render` process.


They can also take TIFF for graphics (though (pdf)LaTeX can't). I
suppose one could submit jpg/png images as supplementary files for the
tex compilation, which would have been a workable solution if annoying
to use rasters when a vector graphic is preferred (and much smaller --
I can't understand why manuscriptcentral takes 10^4 times as long to
upload a document as arXiv or other platforms).





