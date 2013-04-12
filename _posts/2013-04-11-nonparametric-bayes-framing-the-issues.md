---
layout: post
published: false
categories: ecology
tags:
- nonparametric-bayes


---


## Marc meeting: nonparametric-bayes manuscript

Very good meeting today going over some big picture considerations in the presentation of the nonparametric-bayes manuscript with Marc.  (Also see new entries in issues log on nonparametric-bayes.)  Make it clear that we are making a point rather than providing a tool.  Focus on the tipping point context rather than the general management context.  

* Comparison against a parametric Bayesian model ([40](https://github.com/cboettig/nonparametric-bayes/issues/40))
* Comparison against an active learning parametric model facing a tipping point ([41](https://github.com/cboettig/nonparametric-bayes/issues/41))
* Marc pointed me to `r citet("10.1139/f85-132", "citesAsAuthority")` which I've amazingly not read yet, but is one of the best examples of where additional model "realism" leads to lower performance, which should justify it being a classic to the canon of theoretical ecology literature.  


## Implementation of the Bayesian state-space model for comparison

Started on #40 this afternoon.  For simplicity/clarity, building off of the very similar problem by `r citet("", "usesMethodFrom")`



## More on the exit time problem 

* Alan pointed me to earlier work of `r citet("http://dx.doi.org/10.1137/0136043", "discusses")` 
* Also, an electronic version of Don Ludwig's article: `r citet("http://link.springer.com/chapter/10.1007/978-1-4684-4106-2_14", "usesMethodFrom")`

## Warning signals Reading

* Alan pointed out `r citet("/10.1371/journal.pone.0062033", "reviews")` on warning signals in PLoS ONE today.  A very nice piece!  It's quite useful how it show that the early warning signal can appear in unmonitored variables (e.g. juvenile dynamics) or in variables without adequate noise to provide a signal. Kind of funny that they pitch it as a counterexample to the conjecture that early warning signals are universal, since even Scheffer has avoided that word, and it's not really a counterexample given  the caveat of some process noise and complete observability of the system people have so far assumed (while your work with Derin is a more conclusive counter-example by going beyond fold bifurcations)...  Anyway, good examples. We need a better understanding of warning signals in this multi-dimensional context at large.  

* Recently Noam pointed out `r citet("10.1073/pnas.1220161110", "discusses")`, which looks like a nice spatial warning signal example (with the classic patterns, rather than the `r citet("10.1007/s12080-011-0149-6", "containsAssertionFrom")` pattern), but haven't had time for a closer read yet.   

## Other reading

* Trying to get a hold of `r citet("10.1139/f81-094", "discusses")` as well.  A tough day for reading with the UCSC subscription access down due to a "power outages"

* Interesting preprint on advice for data reuse, `r citet("10.7287/peerj.preprints.7", "discusses")`

### Misc and code-tricks

* My knitr scripts are not executing in parallel with snow/snowfall packages(?)  Parallelizes fine when run chunk by chunk.  (e.g. [example with snowfall](https://github.com/cboettig/earlywarning/blob/8bf907c21f8eb0f69f6995a94d21ab0eac6e214a/inst/examples/example.Rmd)).  Knitr runs parallel fine with `multicore`.  Weird.  

* An interesting puzzle on knitr list today: wrangling crazy ascii tables in `Hmisc::summary.function`.  A good solution would just rewrite the class's `print` method to be a table object (e.g. compatible with `xtable` and `pander::pandoc_table`), but instead we can hack the ascii, adjusting the options that are passed to `print.char.matrix`: 

* Created a [PURL](http://purl.org) persistent identifier for the notebook [purl.org/globalecology/lab-notebook](http://purl.org/globalecology/lab-notebook).  Existing public top level domain. Waiting for approval for my own top-level domain (cboettig).  

```{r}
library(Hmisc)
df = data.frame(Age = round(rnorm(100, 50,15)), Sex = rep(c("M", "W")))
out <- summary.formula( ~ Age + Sex, data = df, method = "reverse")
print(out, hsep= '|', csep='|', vsep='-', left.border=FALSE, top.border=FALSE)
```

## References

```{r results="asis", echo=FALSE}

```

