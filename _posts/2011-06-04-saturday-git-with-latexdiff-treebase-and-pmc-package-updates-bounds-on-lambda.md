---
comments: true
date: 2011-06-04 21:27:30
layout: post
slug: saturday-git-with-latexdiff-ropensci-and-pmc-package-updates-bounds-on-lambda
title: 'Saturday: git with latexdiff, TreeBASE and PMC package updates, bounds on
  lambda'
redirects: [/wordpress/archives/1895, /archives/1895]
categories:
- evolution
tags:
- code-tricks
---

## bounds on lambda:


Updated the pmc wrappers for fit_continuous to pass bounds on lambda to the bootstrapping Monte Carlo functions.  Settled on passing all options explicitly after quite a bit of effort. Looking for way to pass a function all of it's arguments as a named arguments in a list; statscicomp list suggested do.call() function; quite brilliant.

Considering user workflow for wrappers.  Conceptually, makes sense for user to run the standard package fit routines first, and then pass the results to pmc.  Added support to pass the fit, rather than refit, to create fitContinuous object of the pmc package.

Revised method for wrapping PMC capability around existing functions (given a fit method and a simulation method).  A bit cumbersome still, as requires a couple user-defined functions, but at least faster for me to write wrappers, if not likely simple enough for most users to write their own wrappers.  Construction is explained in the in-code documentation of pmc_model.R, but easily illustrated with some simple examples (also in pmc_ex.R)


```R

# use the pmc_model to define a function that fits under "pureBirth" and simulates under "sim.bd.taxa"
pureBirth_fit <- function(fit_input){
 pmc_model(pureBirth, sim.bd.taxa,
 fit_input = fit_input,
 data_name = "x",
 function(m) list(n = length(m$fit_input$x), numbsim=1,
 lambda=m$fit_results$r1, mu=0, frac = 1,
 complete = FALSE, stochsampling = FALSE),
 function(x) branching.times(x[[1]][[1]]),
 function(fit_results) fit_results$LH )
 }

require(pmc)
data(geospiza)
fit_input = list(x=branching.times(geospiza$geospiza.tree))
m <- pureBirth_fit(fit_input)
x <- simulate(m)
m2<-update(m,x)
print(loglik(m2))

```


Note that then simulate, update, and loglik methods and work.   getParameters() returns all results of the fit method, which should be fixed (will create way too many copies of the data).

Started writing these for several of the common fit methods, discovered many of them do not have corresponding "simulate" methods available.  Also found many features of these packages that drive me a bit crazy. Not that I don't do this out of laziness, hope to better before I release my packages:


### my list of common faux pas in packages:





	
  * Don't pollute the namespace. Don't export functions in NAMESPACE not intended for use. Use IMPORTS instead of DEPENDS if your package requires other packages. Not to call anything out, but for instance, laser just exports all functions with exportPattern("^[[:alpha:]]+", and then adds "Internal" to the documentation of these functions. If they are internal, don't export them.

	
  * When returning a fit object, return all the function inputs as well (model used, data, etc). Ideally as an object with an assigned type and methods associated with it as well. laser, geiger, and others often return very simple list objects without this information.

	
  * Keep all function options of the utilities you use available to the user. The most common example here is that bothers me endlessly is the optim method, used by almost all of the packages, which for some reason all prefer the bounded box method and don't allow the user to alter this. Hitting these bounds leads to a fair fraction of the confusion on the r-sig-phylo list regarding the behavior of one of these functions, and is usually completely unnecessary.

	
  * likelihood based methods should always include methods to simulate under the process modeled. (medusa, many of the laser fits, etc don't have this capacity).

	
  * Write as a separate function the likelihood method passed to optim. This makes it easy to extend to other methods.


Ooh, things we'd never do in phylogenetics: daily testing of software ([buildbot](http://trac.buildbot.net/), [googletest](http://code.google.com/p/googletest/))


## git and latexdiff:


Spent way too long working out how to checkout the current commit and the previous commit of a tex file for a latex-diff.  checkout without specifying a branch means you end up with detached head, on a  "no-banch", which I couldn't seem to merge back to master.  Checking out a copy while specifying a branch avoids this.  (revert might work too?)


```bash

mkdir tmp
cp file.tex tmp/ #keep a copy to diff against
git checkout -b test master~1 file.tex # checkout onto a separate branch
latexdiff file.tex tmp/file.tex > diff.tex #
pdflatex diff.tex #
git checkout master # switch back to master
git-branch -D test # remove the test branch

```


Initialize an empty repository on webserver (note we need --bare if we want to start things off by pushing to this).


```bash

on the server: git init --bare .

```


then give it a name and push the master branch to the server:


```bash

git remote add dreamhost cboettig@server:/path/to/dir/
git push -u dreamhost master

```



## TreeBASE RR test case?


Exploring reproducible research with TreeBASE on the Evolution paper that just appeared (Derryberry _et. al._ 2011).  Character data is supposed to be morphobase.org, but don't see it.  Maybe it hasn't posted yet?

Step one: See article in Google Reader reporting a beautiful phylogeny.

Step two: grab tree into R and run analyses:


```r

> require(treebase)
> search_treebase("Derryberry", "author") -> a
> metadata(a[[1]]$S.id)

> plot(a[[1]])


```


A beautiful time-calibrated tree of 297 taxa.

Step 3: read paper, repeating all of the author's analyses as we go.

Looking at testing the authors conclusions based on laser and medusa against treepar run, but haven't navigated treepar's rather verbose, unformatted output yet.

## References


- Derryberry E, Claramunt S, Derryberry G, Chesser R, Cracraft J, Aleixo A, Pérez-Emán J, Remsen Jr. J and Brumfield R (2011).
"Lineage Diversification And Morphological Evolution in A Large-Scale Continental Radiation: The Neotropical Ovenbirds And Woodcreepers (Aves: Furnariidae)."
*Evolution*, **65**.
<a href="http://dx.doi.org/10.1111/j.1558-5646.2011.01374.x">http://dx.doi.org/10.1111/j.1558-5646.2011.01374.x</a>.
