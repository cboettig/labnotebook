---
layout: bootstrap
title: wrightscape
subtitle: example
category: phylogenetics
---



<pre>
require(wrightscape)
require(ggplot2)
require(reshape)
data(labrids)
</pre>






<pre>
traits <- c("open", "kt")
regimes <- two_shifts 
</pre>







<pre>
nboot <- 50
cpu <- 16
</pre>







<pre>
require(snowfall)
sfInit(parallel=TRUE, cpu=cpu)
</pre>



<pre>
R Version:  R version 2.14.1 (2011-12-22) 

</pre>



<pre>
sfLibrary(wrightscape)
</pre>



<pre>
Library wrightscape loaded.
</pre>



<pre>
sfExportAll()
</pre>





Fit all models, then actually perform the model choice analysis for the chosen model pairs



<pre>
fits <- lapply(traits, function(trait){
	multi <- function(modelspec){ 
	 multiTypeOU(data = dat[[trait]], tree = tree, regimes = regimes, 
			    model_spec = modelspec, control = list(maxit=8000))
	}
	bm <- multi(list(alpha = "fixed", sigma = "global", theta = "global")) 
	ou <- multi(list(alpha = "global", sigma = "global", theta = "global")) 
	bm2 <- multi(list(alpha = "fixed", sigma = "indep", theta = "global")) 
	a2  <- multi(list(alpha = "indep", sigma = "global", theta = "global")) 
	t2  <- multi(list(alpha = "global", sigma = "global", theta = "indep"))

  mc <- montecarlotest(bm2,a2, cpu=cpu, nboot=nboot)
  bm2_a2 <- list(null=mc$null_dist, test=mc$test_dist, 
    lr=-2*(mc$null$loglik-mc$test$loglik))
  mc <- montecarlotest(bm,ou, cpu=cpu, nboot=nboot)
  bm_ou <- list(null=mc$null_dist, test=mc$test_dist, 
    lr=-2*(mc$null$loglik-mc$test$loglik))
  mc <- montecarlotest(bm,bm2, cpu=cpu, nboot=nboot)
  bm_bm2 <- list(null=mc$null_dist, test=mc$test_dist, 
    lr=-2*(mc$null$loglik-mc$test$loglik))
  mc <- montecarlotest(ou,bm2, cpu=cpu, nboot=nboot)
  ou_bm2 <- list(null=mc$null_dist, test=mc$test_dist,
    lr=-2*(mc$null$loglik-mc$test$loglik))
  mc <- montecarlotest(t2,a2, cpu=cpu, nboot=nboot)
  t2_a2 <- list(null=mc$null_dist, test=mc$test_dist, 
    lr=-2*(mc$null$loglik-mc$test$loglik))
  mc <- montecarlotest(bm2,t2, cpu=cpu, nboot=nboot)
  bm2_t2 <- list(null=mc$null_dist, test=mc$test_dist,
    lr=-2*(mc$null$loglik-mc$test$loglik))
  list(brownie_vs_alphas=bm2_a2, brownie_vs_thetas=bm2_t2,
       thetas_vs_alphas=t2_a2, bm_vs_brownie=bm_bm2,  
       bm_vs_ou=bm_ou, ou_vs_brownie=ou_bm2)
})
</pre>







<pre>
save(list=ls(), file="focal_examples.rda")
</pre>




Clean up the data



<pre>
names(fits) <- traits
dat <- melt(fits)
names(dat) <- c("value", "type", "comparison", "trait")
</pre>







<pre>
r <- cast(dat, comparison ~ trait, function(x) quantile(x, c(.10,.90)))
subdat <- subset(dat, abs(value) < max(abs(as.matrix(r))))
</pre>






<pre>
ggplot(subdat) + 
  geom_boxplot(aes(type, value)) +
  facet_grid(trait ~ comparison, scales="free_y") 
</pre>

![plot of chunk unnamed-chunk-9](http://farm8.staticflickr.com/7095/7066176003_574f96cacd_o.png) 




<pre>
save(list=ls(), file="~/public_html/data/focal_examples.rda")
</pre>




