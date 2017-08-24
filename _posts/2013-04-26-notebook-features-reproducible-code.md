---
title: "Notebook features: reproducible code"
layout: post
category: open-science
tags: 
- notebook-technology
- blog

---

I now use the dynamic documentation software called
[knitr](http://yihui.name/knitr) to write most entries that shore results
and figures. The code to replicate the results is included automatically,
ensuring that what I say I did and what code I actually ran to get the
results are consistent.  Though I have written about knitr before, both regarding
its [use in my notebook](http://carlboettiger.info/2012/03/21/knitr-github-and-a-new-phase-for-the-lab-notebook.html) and 
[in my manuscripts](http://carlboettiger.info/2012/04/07/writing-reproducibly-in-the-open-with-knitr.html),
here I provide a quick summary of how a reader might actually reproduce
a figure or result they come across in the notebook, as well as some of 
the possible problems involved.  



As the code required for any given analysis can be quite involved, it 
is not pratical to provide free-standing scripts in this way.  Instead,
I write the algorithms as functions provided by an R package dedicated 
to the project, e.g. [nonparametric-bayes](http://github.com/cboettig/nonparametric-bayes), [multiple-uncertainty](http://github.com/cboettig/multiple_uncertainty),
or [warning-signals](http://github.com/cboettig/earlywarning), which is version-managed on Github.  The code 
displayed in the post can then be limited to the specific calls to 
analysis, data manipulation, and plotting functions unique to the 
exploration shown, without repeating the code for all algorithms involved.

The code for the analyses is also stored on github using the same 
dynamic documentation approach with knitr.  These scripts are found
in the `inst/examples` directory of my packages.  This approach allows
a given analysis to evolve with my research in a more tractable way than
simply pasting updated copies as successive notebook entries.  The
notebook entries then become a place for me to synthesize the results
of a script.  


Though the package functions are usually backwards-compatible, proper 
reproducibility is only attained by having the version of the package 
from time of the result.  This is easily accomplished by the seemless
integration of Github and R using the devtools package. Consider a figure
from a page of the notebook, such as the final histogram plot from [this entry](http://www.carlboettiger.info/2012/12/20/results-comparing-gp-to-parametric.html).  The entry links to the script responsible for the figure,
[https://github.com/cboettig/nonparametric-bayes/blob/9d5cd1f027bdfe5f356dce83756726c95a6fcdd8/inst/examples/myers-exploration.md](https://github.com/cboettig/nonparametric-bayes/blob/9d5cd1f027bdfe5f356dce83756726c95a6fcdd8/inst/examples/myers-exploration.md)

We can install the entire research compendium at exactly the state it was at 
the time of the analysis using the hash (long chain of seemingly random characters, 
see the (upcoming) entry on [hashes]()) using the clever `devtools` R package,

```r
install_github("nonparametric-bayes", "cboettig", "9d5cd1f027bdfe5f356dce83756726c95a6fcdd8") 
```

We can then copy and paste the code linked from the figure to replicate
the results.  This provides a fast and effective way replicate the
work appearing in or linked to any entry.  More importantly perhaps,
this approach also allows one to repeat any given analysis with the most
recent version of an algorithm and compare the results, since the package
structure provides a logical seperation between algorithm and analysis.
In practice such fine-grained control and invistigation is more important
than simply being able to regenerate what has already been done without
any further input.


This is not entirely failsafe. The package may depend on
other packages, which themselves may have changed.  For my use cases, it
is a deal more reliable than running the current version of a package
that is actively changing during my research.  Readers interested
in even more robust replication and verification should take a look
at Roger Peng's package `stashR` package and associated publications
<span class="showtooltip" data-html="true" title="<p>Eckel S and Peng RD (2012). stashR: A Set of Tools for Administering SHared Repositories. R package version 0.3-5."><a href="http://CRAN.R-project.org/package=stashR">Eckel & Peng (2012)</a></span> .


## References


- Sandy Eckel, Roger Peng,   (2012) stashR: A Set of Tools for Administering SHared Repositories.  [http://CRAN.R-project.org/package=stashR](http://CRAN.R-project.org/package=stashR)


