---
category: open-science
tags: blog

---

> **Editorial note:** The following is slightly edited text from my post to R-devel discussing this issue, which I first drafted here.

There seems to be some question of how frequently changes to software packages result in irreproducible results. I am sure that research using functions like `glm` and other functions that are shipped with base R are quite reliable; and after all they already benefit from being versioned with R releases (as Jeroen has argued).

In my field of ecology and evolution, the situation is quite different.  Packages are frequently developed by scientists without any background in programming and become widely used, such as [geiger](http://cran.r-project.org/web/packages/geiger/), with 463 papers citing it and probably many more using it that do not cite it (both because it is sometimes used only as a dependency of another package or just because our community isn't great at citing packages).  The package has changed substantially over the time it has been on CRAN and many functions that would once run based on older versions could no longer run on newer ones.  It's dependencies, notably the phylogenetics package ape, has changed continually over that interval with both bug fixes and substantial changes to the basic data structure.  The ape package has 1,276 citations (again a lower bound).  I suspect that correctly identifying the right version of the software used in any of these thousands of papers would prove difficult and for a large fraction the results would simply not execute successfully. It would be much harder to track down cases where the bug fixes would have any impact on the result.  I have certainly seen both problems in the hundreds of Sweave/knitr files I have produced over the years that use these packages.

Even work that simply relies on a package that has been archived becomes a substantial challenge to reproducibility by other scientists even when an expert familiar with the packages (e.g. the original author) would not have a problem, as the informatics team at the Evolutionary Synthesis center recently concluded in an exercise trying to reproduce several papers including my own that used a package that had been archived (odesolve, whose replacement, deSolve, does not use quite the same function call for the same `lsoda` function).

New methods are being published all the time, and I think it is excellent that in ecology and evolution it is increasingly standard to publish R packages implementing those methods, as a scan of any table of contents in "methods in Ecology and Evolution", for instance, will quickly show.  But unlike `glm`, these methods have a long way to go before they are fully tested and debugged, and reproducing any work based on them requires a close eye to the versions (particularly when unit tests and even detailed changelogs are not common). The methods are invariably built by "user-developers", researchers developing the code for their own needs, and thus these packages can themselves fall afoul of changes as they depend and build upon work of other nascent ecology and evolution packages.

Detailed reproducibility studies of published work in this area are still hard to come by, not least because the actual code used by the researchers is seldom published (other than when it is published as it's own R package).  But incompatibilities between successive versions of the 100s of packages in our domain, along with the interdependencies of those packages might provide some window into the difficulties of computational reproducibility.  I suspect changes in these fast-moving packages are far more culprit than differences in compilers and operating systems.


