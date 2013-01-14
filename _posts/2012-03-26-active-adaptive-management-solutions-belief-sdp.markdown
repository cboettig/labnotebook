---
comments: true
date: 2012-03-26 14:46:52
layout: post
slug: active-adaptive-management-solutions-belief-sdp
title: 'Active adaptive management solutions: Belief SDP'
redirects: [/wordpress/archives/4371, /archives/4371]
categories:
- ecology
tags:
- pdg-control
---

Have finally gotten my active adaptive management solutions working.

The active adaptive management solution learns very quickly and rather monotonically which model is correct, even when models differ by small amounts and the initial belief is heavily skewed to the wrong model.  I've implemented examples with Myers model, but in this parameter space the allee effect is well below the Reed escapement level of the alternative Beverton Holt model, so it doesn't exert itself.





  * A case of [choosing between to Beverton Holt models with very similar parameters](https://github.com/cboettig/pdg_control/blob/c5f69be6e51849a2be7850239f6397136f949ceb/inst/examples/model_uncertainty.md).  Some delay occurs before a given replicate observes an event unlikely to have come from the wrong model, and then it quickly adjusts its beliefs.  

![delay](http://farm7.staticflickr.com/6109/7018813563_d8ca8eb756_o.png)



  * [Choosing between Beverton Holt and Myers Allee model](https://github.com/cboettig/pdg_control/blob/fd9852313efe0fa9ea9233539a1e2fcb77983a13/inst/examples/model_uncertainty.md).  Allee model is correct even though our initial belief doubts it.  The algorithm quickly corrects this.  

![allee](http://farm7.staticflickr.com/6111/7018879281_b2bc4ea6a2_o.png)



  * Perhaps the [most dramatic example I have so far](https://github.com/cboettig/pdg_control/blob/c1481a071bed3496413328eb148b28138ccb0f55/inst/examples/model_uncertainty.md) comes from a mistake in my model specification, whereby what I intended to be the correct model was actually a terribly optimistic model.  The algorithm quickly realized that it would do best to chose what I had provided as the wrong model, which was actually closer to the truth than my faulty specified true model.






![corrected](http://farm8.staticflickr.com/7102/7018850545_5562557904_o.png)
![belief](http://farm7.staticflickr.com/6113/6872744460_b1976cd8f6_o.png)





$$ S = \frac{\alpha S ^ {\delta}}{1 + S^{\delta}/K} $$
$$ 1 + S^\delta/K = \alpha S ^ {\delta-1} $$
$$ K - K \alpha S ^ {\delta-1} + S{^\delta} $$
for $ \delta = 2 $
$$S = \frac{1}{2} \left( \alpha K \pm \sqrt{\alpha^2 K^2 - 4 K}\right) $$





Cases where risk of collapse is real, learning is fast, but model uncertainty isn't the challenge.  Compare outcomes starting with [wrong](https://github.com/cboettig/pdg_control/blob/d0cd7ca379dfc30e67363442189ab57adfa8058a/inst/examples/model_uncertainty.md) and [right](https://github.com/cboettig/pdg_control/blob/ff049e1f623413e1438555aec63ddbe65dec6d8f/inst/examples/model_uncertainty.md) initial belief.  Learning takes place in the first step, but many populations crash by chance anyhow.  

![right assumption](http://farm8.staticflickr.com/7231/7019134197_76f3c00e80_m.jpg)
![wrong initial assumption](http://farm8.staticflickr.com/7046/7019126361_c3a712b982_m.jpg)



