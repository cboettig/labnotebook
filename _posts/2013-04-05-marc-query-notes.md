---
layout: post
category: ecology
tags:
- prosecutor

---


Interesting idea, I had a quick go at this. A related way to measure the relative number of steps in the positive direction relative to the negative direction is Kendall's tau rank correlation coefficient, which also looks at the number of increases relative to the number of decreases.

I've computed this statistic for my sample trajectories and plotted as a histogram here.  The negative skew shows the tendancy to decrease (which is the direction of the deviation I selected -- smaller population sizes)

![](http://farm9.staticflickr.com/8263/8621413072_3597b335fe_o.png)

I've also computed the ratio of steps up to steps down and histogrammed that: like the above, it shows more steps down than up, though not as dramatic as I might think by any means.  Have to think about the role of the step size between observations in formulating this perhaps. 

![](http://farm9.staticflickr.com/8113/8621413020_5d779e8b1f_o.png)

I'm quite interested in your comment about Ludwig's result that the transition occurs at about the same time as the return rate. Do you have the reference for that handy? I may try and take a look at that as well when I get some more free time to fiddle; will just need to add some additional simulations of return trajectories.

For the sake of completeness:

* [data for the trajectories is here](https://github.com/cboettig/earlywarning/blob/8418a20cabf24786b54acc51eb508e9dbf3d1b37/inst/examples/trajectories.csv)
* [code for the analysis is here](https://github.com/cboettig/earlywarning/blob/8418a20cabf24786b54acc51eb508e9dbf3d1b37/inst/examples/beer.md)



Cheers,
