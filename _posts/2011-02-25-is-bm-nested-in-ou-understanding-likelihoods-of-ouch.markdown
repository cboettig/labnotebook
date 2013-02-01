---
comments: true
date: 2011-02-25 20:16:37
layout: post
slug: is-bm-nested-in-ou-understanding-likelihoods-of-ouch
title: Is BM nested in OU?  Understanding likelihoods of ouch
redirects: [/wordpress/archives/1107, /archives/1107]
categories:
- evolution
---

A quick run of the example ouch code given by 
    
     ?bimac 

will produce something of a surprise for most users:

    
    
    require(ouch)
    data(bimac)
    tree <- with(bimac,ouchtree(node,ancestor,time/max(time),species))
    h1 <- brown(log(bimac['size']),tree)
    h2 <- hansen(log(bimac['size']),tree,bimac['OU.1'],sqrt.alpha=1,sigma=1)
    c("BM LogLik"=h1@loglik, "OU LogLik"=h2@loglik)
    
    BM LogLik OU LogLik
     17.33129  15.69682
    


These models are supposed to be nested, right?  Set OU's $ \alpha $ parameter to zero and you get BM, so how does it manage to do _worse_ in log likelihood?  This very data gets analyzed in the original (2004) paper(Butler & King, 2004), and the two models get the same log likelihood (Table 1).   I asked Aaron about this at Evolution last summer, and he tells me it comes from assuming the root state comes from the stationary distribution.  To quote the development log (OCHANGELOG file in pkg/inst):


> 2008-05-23 11:05  kingaa

assume that root state is a random variable drawn from the stationary distribution of the process in the regime that the root node occupies

the latter involves changes to the weight matrix, to the covariance matrix, and to the regime.spec routine


Unfortunately I'm not able to grab the version of ouch before this change was made but after the code was moved into C, as that stage wasn't committed to CRAN ([archive history](http://cran.r-project.org/src/contrib/Archive/ouch/)) and wasn't yet on [RForge](http://ouch.r-forge.r-project.org/) svn.

We can write down the likelihood of the OU model from the multivariate normal:

$$ -2 \log L = [X(T) - E(X(T))]^{\prime} V^{-1} [X(T) - E(X(T))] + N\log(2\pi) + \log(\det(V)) $$

Where the expected trait values _E(X)_ and covariance matrix _V_ are defined from $ \alpha, \sigma$ and $ \theta$ and the root state:
$$ E(X_t | X_0 ) = X_0 e^{-\alpha t} + \theta (1- e^{-\alpha t}) $$
The _i,j_ element of the covariance matrix is
$$ V_{ij} = \frac{\sigma^2}{2\alpha} (1 - e^{-2 \alpha s_{ij} }) e^{-2\alpha (t-s_{ij} )} $$
where the nodes are all measured at time t (present day) and have diverged for a time $ t-s_{ij} $ (thus shared time $ s_{ij} $ since $ X_0 $.)

Well, we can estimate $ X_0$ and $ \theta$ separately, but there's really no information to estimate these independently (and we may expect poor numerical behavior).  Clearly the best we can do is set $ X_0 = \theta$ and this reduces to $ X_0 = \theta$ as in BM model.  As the log likelihood has no absolute scale anyway, we could just say the mean is just a constant proportionality and ignore it all together, taking the likelihood from the second two terms (and saving the cost of a matrix inversion).  Clearly this is not the choice made by the current OUCH package.

Instead, the argument is that X_0 is still a parameter, which we are choosing to set $ X_0 = \theta$, and if we assume that it the root is at the stationary distribution, then we know the probability density of this assertion $ X_0 = \theta$ from the stationary normal distribution (note that in the stationary distribution samples are all independent draws with mean $ \theta$ and variance $\sigma^2/2\alpha}$) so that the probability density is:

$$\sqrt{\frac{\alpha}{\pi \sigma^2}}$$.  

I expected that subtracting the log of this quantity from the log-likelihood would give me the corrected value, but it does not:


    
    
     h2@loglik + log( h2@sqrt.alpha / sqrt(pi * h2@sigma^2))
    [1] 15.81422
    



So I'm a bit puzzled exactly where the correction comes from that makes OU score worse.  More to the point, the penalty for estimating something we're not estimating seems strange.  Why treat this as part of the likelihood at all?  

Of course the reason for treating the E(X) terms becomes more important in the multiple peaks models, where:
$$ E(X_t | X_0 ) = X_0 e^{-\alpha t} + \theta_1 (1- e^{-\alpha t_1})  + \theta_2 (1- e^{-\alpha t_2})  + \ldots $$

and so setting $ X_0 = \theta_1 $ doesn't make the term vanish.  Still, it seems unclear why this must be treated as an estimated statistic when it isn't really, any more than it is in BM.  


For that matter, the BM model in OUCH considers itself as having 2 degrees of freedom, for the root state/phylogenetic mean and the diversification rate $ \sigma$.  This is likewise unclear -- certainly it is possible to compute such a statistic as the phylogenetic mean under BM, but it's still a one-parameter model as far as likelihood estimation, where we just use the $ \det V $ to compute the likelihood (which for this model we can analytically compute the value of $ \sigma$ which maximizes this).  


[ref]Note that the command "sessionInfo()" will return the version number for attached packages.[/ref]


## References


- Butler M and King A (2004).
"Phylogenetic Comparative Analysis: A Modeling Approach For Adaptive Evolution."
*The American Naturalist*, **164**.
ISSN 0003-0147, <a href="http://dx.doi.org/10.1086/426002">http://dx.doi.org/10.1086/426002</a>.
