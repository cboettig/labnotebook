---
layout: post
category: ecology
tags:
- nonparametric-bayes

---


Trying to find a better way to summarize outputs of simulations,

![](http://farm6.staticflickr.com/5448/9021275460_cbc5de534d_o.png)

Heavy over-plotting makes the simulation trajectories themselves hard to read, even with transparent curves.  Instead, we can plot the cumulative profit (technically should be discounted first):

![](http://farm6.staticflickr.com/5334/9019048845_1e55f47129_o.png)

We can normalize these profits as a fraction of the theoretical optimum (true), providing a comparison that is less dependent on model parameters. 

![](http://farm4.staticflickr.com/3672/9093236637_273d3f3974_o.png)


We can then attempt to plot these on a single plot, either as stacked histograms:

![](http://farm6.staticflickr.com/5531/9093236713_f4737d525e_o.png)

or stacked density plots:

![](http://farm6.staticflickr.com/5328/9093236773_168c3a160b_o.png)


Even after (or because of) some tuning of binwidth I'm not sure I'm happy.  Will probably go with the histogram.  The density plot fails when distribution is purely a delta function, giving a uniform distribution instead (and is thus maximally wrong); this can be avoided by adding a small jitter.  


* Code: see complete code [nonparametric-bayes/fc6365](https://github.com/cboettig/nonparametric-bayes/blob/fc63651f1b1ef44b0b53817d35351a11997c6ce8/inst/examples/BUGS/external-chunks.R) 


```r
## @knitr Figure3
ggplot(sims_data) + 
  geom_line(aes(time, fishstock, group=interaction(reps,method), color=method), alpha=.1) +
    scale_colour_manual(values=colorkey, guide = guide_legend(override.aes = list(alpha = 1)))


## @knitr profits
Profit <- sims_data[, sum(profit), by=c("reps", "method")]
tmp <- dcast(Profit, reps ~ method)
#tmp$Allen <- tmp[,"Allen"] + rnorm(dim(tmp)[1], 0, 1) # jitter for plotting
tmp <- tmp / tmp[,"True"]
tmp <- melt(tmp[2:dim(tmp)[2]])
actual_over_optimal <-subset(tmp, variable != "True")


## @knitr Figure4 
ggplot(actual_over_optimal, aes(value)) + geom_histogram(aes(fill=variable)) + 
  facet_wrap(~variable, scales = "free_y")  + guides(legend.position = "none") +
  xlab("Total profit by replicate") + scale_fill_manual(values=colorkey)

ggplot(actual_over_optimal, aes(value)) + geom_histogram(aes(fill=variable), binwidth=0.1) + 
  xlab("Total profit by replicate")+ scale_fill_manual(values=colorkey)

ggplot(actual_over_optimal, aes(value, fill=variable, color=variable)) + 
  stat_density(aes(y=..density..), position="stack", adjust=3, alpha=.9) + 
  xlab("Total profit by replicate")+ scale_fill_manual(values=colorkey)+ scale_color_manual(values=colorkey)
```



Misc
----


- Via Noam.  [Interesting](http://snikolov.wordpress.com/2012/11/14/early-detection-of-twitter-trends/)

- Richard interview

- [scholarly markdown](https://github.com/scholmd/scholmd/wiki/Todo-list-from-workshop)

- Exchange with Martin on [links are citations](http://blog.martinfenner.org/2013/06/17/what-is-scholarly-markdown/#comment-934745570) **Edit**: it appears comments have been lost, but see discussion on the follow-up post, [citations in scholarly markdown](blog.martinfenner.org/2013/06/19/citations-in-scholarly-markdown/).  

- Wow, the scaling unit `em` in LaTeX, CSS, etc. actually comes from the width of the character `M`, dating back to printing-press era, when that character was used to define the spacing [quadratone](http://tex.stackexchange.com/questions/119068/meaning-of-quad?newsletter=1&nlcode=50792%7ca76d)
