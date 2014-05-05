---
layout: post
category: open-science

---


> **Editorial Note:** Scratchpad in replying to issues raised by the NESCent reproducibility exercise that included my prosecutor's fallacy paper.  See more developed version of this disucssion in the package issues log:

- [#1](https://github.com/cboettig/prosecutors-fallacy/pull/1)
- [#2](https://github.com/cboettig/prosecutors-fallacy/issues/2)
- [#3](https://github.com/cboettig/prosecutors-fallacy/pull/3)

--------

@hlapp Thanks for the bug reports; I think there are quite a few good illustrations of the challenges in sharing code here go beyond ["Publish your code, it's good enough"](), despite the importance of that message.  If you haven't seen it, you might be interested in joining the thread SWC started on that topic.

I should probably flush these out into further issues, but (not surprisingly) the problems go deeper than these issues.

- the `odesolve` package has since been removed from CRAN, as it is obsoleted by the deSolve package (see [page](http://cran.r-project.org/web/packages/odesolve/index.html)).  Unfortunately, the function API changes slightly in the lsoda function in deSolve, so this fix requires (a little easy) manual intervention.

- As I think you figured out, this package / paper grew out of my earlier work on the [earlywarning](https://github.com/cboettig/earlywarning) package, and at the beginning was a branch of that package.  I've fixed the deSolve issue in earlywarning, but forgot to do so here.  I made it a separate package once it was clear this line of investigation led to a completely different paper.

- This package should depend on `earlywarning` package, not duplicate it.
- This creates an added challenge in versioning, since when all the functions are together, it is sufficient to go back to the SHA at the time of publication to get the functions in their original form, while leaving them into a separate package we would have to capture two SHAs.  R's dependency mechanisms don't handle this as well, particularly when relying on github.


- Presumably it would depend on the version of `earlywarning` in the master branch, which should ideally maintain a backwards-compatible API and have tests to catch when it doesn't

- I should be better at tagging the SHA at the time of publication, and possibly relying on branches to distinguish different versions.

- For instance, I started exploring further directions such as `bayeswarning.R` on the `prosecutor` branch of the `earlywarning` package.  The DESCRIPTION file was never recompiled on that branch, hence the install error in #1 .  (The install also gives a further warning since `devtools` has since changed the argument from `branch` to `ref`, since it now supports giving an arbitrary SHA instead of just a branch name).  The `bayeswarning.R` functions should have never been added to that branch (hey, it was just the branch that was currently active and I was exploring quickly), and should now be deleted, as they represent a different exploration.  I'm happy to see I actually did create a branch for that.  [https://github.com/cboettig/earlywarning/tree/bayesian/R](https://github.com/cboettig/earlywarning/tree/bayesian/R)


Obviously there is a desire to maintain the original code base used in the paper, as well as to provide downstream updates, but a simple version SHA is not be sufficient. (I could also be better at tagging the SHA at time of publication, etc).

I'm not sure the best way to reflect that provenance, but it introduces challenges either way.

- While there are example scripts with example outputs a plenty, there's no actual unit tests in either `earlywarning` or `prosectors-fallacy`.

- I doubt either `earlywarning` or `prosectors-fallacy` pass `R CMD check`, the basic requirement for a CRAN package, at this time.

- travis integration could clearly help, though the burden of keeping every bit of software one has ever written up-to-date when dependencies change as fast and as dramatically as they do in R (CRAN makes no requirements not to break your API when updating a package, and asserting a particular version of a package dependency, instead of >=, is not
