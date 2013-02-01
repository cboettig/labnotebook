---
layout: post
title: Limits to the detection of early warning signals
category: ecology
tags: warning-signals my-publications

---

Our paper, _limits to the detection of early warning signals for
critical transitions_, has now [appeared in the Proceedings of the
Royal Interface](http://dx.doi.org/10.1098/rsif.2012.0125). An
open-access copy is [available under CC-by license on the
ArXiv](http://arxiv.org/abs/1204.6231).  The essence of the paper is
to bring a more model-based approach to early warning signals, while
seeking to remain as general as possible.

Without a model-based approach, it is difficult to leverage statistically
meaningful comparisons to identify what is a real warning signal and
what is just noise. We use two simple models, (a stationary OU process
and temporally heterogeneous OU process) combined with a likelihood
ratio bootstrap to do this, though other models and comparisons could
be equally promising.

The motivation for this paper comes somewhat from the appendices in
the groundbreaking work by Dakos _et al_ 2008, which compares several
potential null distributions and shows that Kendall's tau, the correlation
statistic used to identify an increase, takes on almost any value
in its range, which doesn't leave us with much information to go by.
I both wanted to confirm this distribution and see if I could improve
upon it with the model-based approach.  I was glad to see that not only
could we quantify uncertainty more precisely with the model based-approach,
but also improve upon the sensitivity relative to traditional indicators,
as seen in our ROC curves. 


My talk at ESA last year gave an introduction to these results.

<div style="width:425px" id="__ss_11357956">
<strong style="display:block;margin:12px 0 4px"><a
href="http://www.slideshare.net/cboettig/limits-to-detection-for-early-warning-signals-of-population-collapse"
title="Limits to Detection for Early Warning Signals of
Population Collapse" target="_blank">Limits to Detection for
Early Warning Signals of Population Collapse</a></strong> <iframe
src="http://www.slideshare.net/slideshow/embed_code/11357956"
width="425" height="355" frameborder="0" marginwidth="0" marginheight="0"
scrolling="no"></iframe> <div style="padding:5px 0 12px"> View more
<a href="http://www.slideshare.net/" target="_blank">presentations</a>
from <a href="http://www.slideshare.net/cboettig" target="_blank">Carl
Boettiger</a> </div> </div>

# An Open Notebook Story

This project has gone through many iterations, dead ends, and
transformations as it evolved over the past year and a half alongside
my other research projects. In the process, there's also been ample
cross-pollination of ideas from different projects.  The interplay of
these ideas unfolds in the interleaved pages of my online lab
notebook. 

Here are a few examples of this cross-pollination: Using the likelihood
ratio bootstrap as the most powerful comparison of two composite
(parameter-estimated) hypotheses first emerged in my evolutionary work
which became the paper, _Is your phylogeny informative_, while solving
the likelihood equation for the temporally heterogeneous OU process
has it's roots in my work on the evolutionary release of constraint
that became the paper _Modeling Stabilizing Selection: Expanding the
Ornstein-Uhlenbeck Model of Adaptive Evolution_ and plays a role in my
current `wrightscape` project.  These projects share a central challenge
of detecting faint signals of regime shifts from large data sets whilst
quantifying uncertainty, despite substantial differences in the details
of both model formulation and solution.

The project had several dead ends of things that sounded promising but
turn out not to work.  A few that I've been asked about since include
[solving the model inference problem in the frequency (Fourier)
space](http://www.carlboettiger.info/wordpress/archives/144)
(doesn't work because the power transform destroys the
Gaussian property of the noise), and [estimating quadratic
models (such as the canonical form for the saddle node
bifurcation)](http://www.carlboettiger.info/wordpress/archives/452)
(page forward on each if your curious). 


## The project by numbers

![floatright](http://farm9.staticflickr.com/8144/7249633810_a1cb6395bf_m.jpg)
My notebook contains [123
posts](http://www.carlboettiger.info/wordpress/archives/tag/warning-signals)
relevant to this project, tagged under `warning-signals`, dating back to
October 2010, out of a total of 388 posts. The flickr archive has [903
images](http://www.flickr.com/photos/cboettig/tags/warningsignals/)
tagged for this project, the [github
repository](https://github.com/cboettig/populationdynamics)
have seen over 40,000 lines of code, mostly in different
explorations, consisting of 64 files with commits on 74 days.
(This repository has since been split into separate repositories
for the [population dynamics simulations] and the [early warning
signals computations](https://github.com/cboettig/earlywarning).)
Simulations were run on at least four different machines, including
the 512 node cluster on campus and [NERSC's Carver supercomputing
facility](http://www.nersc.gov/users/computational-systems/carver).

# Accessing the data and code

My organizational structure has evolved over the course of this project, 
but mostly conforms to my [Github-based R-package structure](http://www.carlboettiger.info/2012/05/06/research-workflow.html)
within the [`earlywarning` repository](https://github.com/cboettig/earlywarning).
The `inst/examples` directory includes code to reproduce the analysis for
the chemostat, simulation, and glaciation data.



## References

Boettiger, C., and Hastings, A. (2012). Quantifying limits to detection of early warning for critical transitions. Journal of The Royal Society Interface, 1-29. doi:10.1098/rsif.2012.0125

Dakos, V., Scheffer, M., van Nes, E. H., Brovkin, V., Petoukhov, V., and Held, H. (2008). Slowing down as an early warning signal for abrupt climate change. Proceedings of the National Academy of Sciences, 105(38), 14308-12. doi:10.1073/pnas.0802430105

