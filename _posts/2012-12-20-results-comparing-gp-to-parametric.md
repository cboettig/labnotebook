---
layout: post
category: ecology
tags: nonparametric-bayes

---

Comparison of the Gaussian process inference to the true optimum and a parametric estimate.   

![](/assets/figures/2012-12-20-23-12-06-60abafd424-unnamed-chunk-22.png) 

Comparison across 100 simulations under the policies inferred from each approach show the nearly optimal performance of the GP and the tragic crashes introduced by the parametric management.  

![](/assets/figures/2012-12-20-23-12-07-60abafd424-unnamed-chunk-23.png)


## Sensitivity analysis

Working through an exploratory sensitivity analysis to see GP performance over different parameters.  

* [Example from 32 replicates ](https://github.com/cboettig/nonparametric-bayes/blob/6aba5dce46370c600351eff270a76a664dacc7db/inst/examples/myers-exploration.md)

Distribution of yield over replicates shows the parametric model performing rather poorly, while most of the GP replicates perform nearly optimally.  

![](/assets/figures/2012-12-20-23-13-46-60abafd424-unnamed-chunk-3.png)

* [smaller noise](https://github.com/cboettig/nonparametric-bayes/blob/60abafd4242b3840454b3a138a428a1c633e73fd/inst/examples/myers-exploration.md):

![](/assets/figures/2012-12-20-22-57-55-96ad28dd6e-unnamed-chunk-3.png)

[larger growth-rate parameters](https://github.com/cboettig/nonparametric-bayes/blob/9d5cd1f027bdfe5f356dce83756726c95a6fcdd8/inst/examples/myers-exploration.md):

![](/assets/figures/2012-12-20-20-50-42-3f7bd6aa34-unnamed-chunk-3.png)



## from the commit log

- smaller r, shows GP outperform parametric estimate [09:21 am 2012/12/21](https://github.com/cboettig/nonparametric-bayes/commit/6aba5dce46370c600351eff270a76a664dacc7db)
- small noise. works well. [11:01 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/60abafd4242b3840454b3a138a428a1c633e73fd)
- GP performs poorly with weak noise prior (nugget) when not conditioned on 0,0 [10:45 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/96ad28dd6edfbcec720b77fe645719fa673dd44a)
- less successful with higher noise level [09:10 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/0fdaadb9b57715390e149b3c182b8115ff036960)
- Ah here we go! with a decent allee effect model, the results are much clearer! [08:52 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/9d5cd1f027bdfe5f356dce83756726c95a6fcdd8)
- strange Ricker Allee example -- even true model doesn't harvest successfully [08:37 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/3f7bd6aa349d23aa7aeb28b772b9b32b5d7645b1)
- delta 1.5, r 1.3 K 4.5 [08:17 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/ee54f02a6d81ca0e89395837666055f4f6d1bcb0)
- higher K value results in better persistence in general, not always outperforming parametric model though. [07:57 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/db67f4ccb4f185b3000bbe6a93d770490e027593)
- harvest, and then escaped population recruits; comparable [07:09 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/8e5a4cd1abe38671fb884855bae3babac7d4802d)
- shorter OptTime and lower initial state do not much change the fraction that fail to persist [06:31 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/1130545ef69d6b6e064ca3a0360ee905c0a2b32d)
- Sensitivity analysis over replicates shows mixed results [05:35 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/e823ed12ef20d5c6dcbd04540bb957bf33116cab)
- fixed bug (had Ef and V in gp_transition_matrix) [05:18 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/8307de6858cc9fe067d7c86c31ce93a91862f75e)
- still crashing [05:01 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/44c19ba3882ce5a419c63d13c61a1b63377d051b)
- more iterations [04:34 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/61aeba3dd05033f6b9184a145035cf9708dbc18a)
- corrected iterations [04:28 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/278d66f2af22eada8d704b87a20738aba874ceb4)
- cpu=8 for running on one.ucdavis [02:21 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/4adf814f23c90b4d415e5580e776f07bb1f5f355)
- unique seeds for parallel computing [02:11 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/9a79a72650d3bfbb9768853f9132cd5dec6f88d6)
- 30 replicates with full graphs [02:03 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/88d4295e217bc6b52e23c19f4094b2a85cb61bfb)
- avoid external source call, print plots [12:49 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/fd14d9146826c529b6ce0a1912feffd839d37261)
- trying methods for looping over replicates efficiently [12:38 pm 2012/12/20](https://github.com/cboettig/nonparametric-bayes/commit/edee0e6ef100702ed3f420dc2c0d47a691b52d3f)


## next goals/issues

- \#22 [Minor modifcations for the replicate comparisons](https://github.com/cboettig/nonparametric-bayes/issues/22) 
- \#20 [Compare against correct parametric model with parameters estimated from the data](https://github.com/cboettig/nonparametric-bayes/issues/20) 
- \#19 [Vary harvest policy during the observation stage](https://github.com/cboettig/nonparametric-bayes/issues/19) 
- \#17 [GP process plots should show with and without nugget variance](https://github.com/cboettig/nonparametric-bayes/issues/17) 


