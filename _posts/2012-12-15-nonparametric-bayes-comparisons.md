---
layout: post
categories: ecology
tag: nonparametric-bayes

---


## Notes on structure of examples

Externalized code so that different example scripts call identical commands for fitting and plotting to avoid duplication of code. Example scripts tend to be pretty text poor at the moment, would probably benefit by better descriptions in the markdown. May still involve redundant and potentially out of date descriptions though. 

Currently, externalized code for GP comparison experiments is in [gaussian-process-control.R](https://github.com/cboettig/nonparametric-bayes/blob/526b54b09e23f550198863741bce9e9cb52e9325/inst/examples/gaussian-process-control.R), and is called by [may79-example.Rmd](https://github.com/cboettig/nonparametric-bayes/blob/cac79bcc42433a6b8720d5d4c5824c57a850a56c/inst/examples/may79-example.Rmd), [myer-example.Rmd](https://github.com/cboettig/nonparametric-bayes/blob/cac79bcc42433a6b8720d5d4c5824c57a850a56c/inst/examples/myer-example.Rmd), and [reed-example.Rmd](https://github.com/cboettig/nonparametric-bayes/blob/cac79bcc42433a6b8720d5d4c5824c57a850a56c/inst/examples/reed-example.Rmd). 


Also fixed [knitcitations](https://github.com/cboettig/knitcitations) to at least include citations in markdown files. 


## Performance of GP compared to Ricker on an underlying Allee model


### Using stationary data only 


![Inferred GP](/assets/figures/2012-12-15-f42127cba3-gp-plot.png) 

![plot of policy functions](/assets/figures/2012-12-15-f42127cba3-policy_plot.png) 

![fish stock dynamics](/assets/figures/2012-12-15-f42127cba3-sim-fish.png) 

![harvest dynamics](/assets/figures/2012-12-15-f42127cba3-sim-harvest.png) 

(see [myer-example.md](https://github.com/cboettig/nonparametric-bayes/blob/a3aad15b159aae10264e39ccf3cbe0cdb8aec279/inst/examples/myer-example.md) for code and more graphs & details)

### Using more data 


![Inferred GP](/assets/figures/2012-12-15-003da6e98e-gp-plot.png) 

![plot of policy functions](/assets/figures/2012-12-15-003da6e98e-policy_plot.png) 

![plot of sim-fish](/assets/figures/2012-12-15-003da6e98e-sim-fish.png) 

![plot of sim-harvest](/assets/figures/2012-12-15-003da6e98e-sim-harvest.png) 

(from [earlier myer-example.md](https://github.com/cboettig/nonparametric-bayes/blob/a1bc09a4a7a2edabbd63916416db6b095d1ead6b/inst/examples/myer-example.md))

## Comparing GP to estimated Ricker on BH dynamics: 

GP performs well, but Ricker performs adequately as well: [reed-example.md](https://github.com/cboettig/nonparametric-bayes/blob/cac79bcc42433a6b8720d5d4c5824c57a850a56c/inst/examples/reed-example.md) (shows an example with stationary data). 

![plot of chunk gp-plot](/assets/figures/2012-12-15-8b057f1f24-gp-plot.png) 

![plot of chunk policy_plot](/assets/figures/2012-12-15-8b057f1f24-policy_plot.png) 

![plot of chunk sim-fish](/assets/figures/2012-12-15-8b057f1f24-sim-fish.png) 

![plot of chunk sim-harvest](/assets/figures/2012-12-15-8b057f1f24-sim-harvest.png) 


## Other advances

Approaches shown above address a variety of issues as well:

* Compares to a Ricker estimated by MLE ([#8](https://github.com/cboettig/nonparametric-bayes/issues/8))
* Considers fewer non-stationary observations, but include 0,0 as observation ([#13](https://github.com/cboettig/nonparametric-bayes/issues/13))
* Includes scrap value ([#10](https://github.com/cboettig/nonparametric-bayes/issues/10)), though this does not guarentee no fishing under non-persistence estimation

A few next steps:

* measurement error should be introduced in the simulations ([#11](https://github.com/cboettig/nonparametric-bayes/issues/11))
* Evaluate GP performance under larger noise conditions. ([#14](https://github.com/cboettig/nonparametric-bayes/issues/14))

See issues log for further issues to explore and more details on closed issues. See commit log for full details, this entry summarizes progress over the latter half of the week. 



