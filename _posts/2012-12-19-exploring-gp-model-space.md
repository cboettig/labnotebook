---
layout: post
category: ecology
tag: nonparametric-bayes

---

Trying to think about a more systematic way to go about varying the parameters: the underlying parametric model has 3 parameters for the stock-recruitment curve's deterministic skeleton, plus growth noise. (My first exploratory phase has been just to try different things. See my [various tweaks in the history log](https://github.com/cboettig/nonparametric-bayes/commits/master/inst/examples/myer-example.md) Clearly time to be more systematic about both running and visualizing the various cases.)

Should I just choose a handful of parameter combinations to test? (Trying to think of a way to do this that is easy to summarize -- at least I can summarize expected profit under each set). Presumably, for each set of these parameters, I'd want a few (many?) stochastic realizations of the calibration/training data.

Would it be worth digging up some real-world data-sets and base the selection of underlying model parameters on them?

Then there's a variety of nuisance parameters: grid size, discount rate, price of fish (non-dimensionalization eliminates that one I guess), cost to fishing (and whether the cost is on effort or harvest, whether linear or quadratic, etc), harvest grid size / possible constraints on maximum or minimum allowable levels for the control; length of the calibration period (and related dynamics if we use any of the variable fishing effort models you showed me today).

Additionally there's the MCMC-related nuisance parameters -- parameters for the priors, possibly hyperpriors, and the MCMC convergence analysis (selecting burn-in period -- currently 2000 steps out of 16000, etc) . Also the distributional shapes for the priors, and perhaps more meaningfully, the GP covariance function (using Gaussian for simplicity, but might want to look at Matern, and the various linear + Gaussian covariances).


## New and progressing issues

-   [Vary harvest policy during the observation
    stage](https://github.com/cboettig/nonparametric-bayes/issues/19)
-   [Add prior & posterior graphs (on same plot) to standard analysis
    (i.e.
    gaussian-process-control.R)](https://github.com/cboettig/nonparametric-bayes/issues/18)
-   [GP process plots should show with and without nugget
    variance](https://github.com/cboettig/nonparametric-bayes/issues/17)
-   [examples with non-stationary dynamics (e.g. Ricker with
    oscillations)](https://github.com/cboettig/nonparametric-bayes/issues/16)
-   [evaluate GP under large noise
    conditions](https://github.com/cboettig/nonparametric-bayes/issues/14)
-   [Characterize and develop a strategy for inferred GP that are not
    self-sustaining](https://github.com/cboettig/nonparametric-bayes/issues/12)




## from the commit log today

- prior/posterior plots added to the BH-Ricker example.  Comparable but non-optimal performance by GP. [06:07 pm 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/f1711a171c62005e88a17af13a7ad3e697ae382e)
- oscillating ricker still does not give decent solutions [05:45 pm 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/19c32b33a15c675c8bf900f24962aee4a6ade31f)
- shows posteriors and priors of hyperparameters [05:38 pm 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/4ce05b91910168114c86a417ec56de925de94969)
- fixed minor typo in calc of posterior distribution plots #18 [05:15 pm 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/01d0f47bcce6aa977f79f27cb8a980eef04d4673)
- plotting for posteriors and priors added #18 [04:13 pm 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/ab9cfac258cfdc7c888c95473329f048e32a8ec3)
- replicate [02:22 pm 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/ae91163f2e8c4eb5094913908f49e722cff52656)
- time to start writing [09:16 am 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/aef1d1ac8af8b7a49bcc4f8d13b397c587805087)
- Ah, good. With a bit more data, a very nice example of how GP can avoid problems of a structurally inaccurate parametric approach (Myers vs Ricker). [09:15 am 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/a8ea0c17c1a4ed4ca8ab51bebb75a9c98ec32564)
- more data going up to positive equilibrium, better but still does not avoid crash [08:29 am 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/325786ba1798c0f888da59b584af67e4a0117e42)
- An interesting example -- seems to work despite being calibrated on a crashing dataset. [08:08 am 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/b88842a2537eff45c9b383f04a4ffc0a126e3fe7)
- With smaller K, GP cannot quite determine a proper policy [07:37 am 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/a462d4165b92a6c226e02460bd83d48acae7232f)
- try different dynamic parameters on Myers (lower K) [05:59 am 2012/12/19](https://github.com/cboettig/nonparametric-bayes/commit/36a9985baf70df0d020a7a509490650d9bcd6f80)


### Misc: ropensci

* resolved some outstanding issues on rfigshare ([rfigshare/issues?state=closed](https://github.com/ropensci/rfigshare/issues?state=closed))
