---
layout: post
category: multiple_uncertainty
tags:
- multiple_uncertainty


---


## Multiple uncertainty

Handling variation in different grids.  Cleaned up a bunch of transpose
expressions in the code and make sure that dimensions are always
properly aligned.  Now problem can be solved on arbitrarily different
grid discritizations for stock $x$, observed stock $y$, harvest $h$
and quota $q$.  See [multiple_uncertainty.m](https://github.com/cboettig/multiple_uncertainty/blob/61e34979df93617e6229a6031ea624934acbe93c/inst/matlab/multiple_uncertainty.m) and example calls in
[testing.m](https://github.com/cboettig/multiple_uncertainty/blob/61e34979df93617e6229a6031ea624934acbe93c/inst/matlab/testing.m)

Taking a look a how we handle normalization when some of the
probability density falls outside the discritized space.  Currently we
just renormalize, which distributes the weights over all non-zero
weighted points.  Might be more reasonable to map all that probability
to the boundary, though this is tricky.  I've taken a stab at this
based on only normalizing the resulting matrix without knowing the
underlying pdf, which has some challenges.  See unused function:
[norm_pile_bdry.m](https://github.com/cboettig/multiple_uncertainty/blob/61e34979df93617e6229a6031ea624934acbe93c/inst/matlab/norm_pile_bdry.m)

Also added line to enforce the assumption that quota should not
exceed assessment estimate, though certainly it is sometimes optimal
that it should when either implementation or measurement are uncertain.
This seems easiest to enforce by just setting those terms in the value
matrix to zero:

```matlab
 V = tril(V);
````

(see in code, [#L111](https://github.com/cboettig/multiple_uncertainty/blob/61e34979df93617e6229a6031ea624934acbe93c/inst/matlab/multiple_uncertainty.m#L111))


### lognormal

![](http://cboettig.github.com/multiple_uncertainty/lognormal_multiple_uncertainty.svg)


### Uniform

![](http://cboettig.github.com/multiple_uncertainty/multiple_uncertainty.svg)

### Comparisons

Took a quick look at Paul's code yesterday.  He does enforce the quota <= assessment value, which while a logical constraint, is also trivially sub-optimal for some certain measurement and implementation uncertainty.

It also looks like he has a very coarse grid for the shocks, which I don't quite understand.  It looks like each of the uncertainties is defined as a set of weights over only 7 points; I'm not quite sure why that is so low when he uses quite a fine grid for the state space and action space.  I define my shocks over the same grid as the state space.

His approach looks quite interesting: he enumerates all possible combinations of state-action pairs and computes the expected reward at each of these pairs ahead of time as part of the model statement, as a sum over all possible measurement and implementation shocks:


```matlab
R=0;
for i=1:length(zi)      % Grid size for implementation error
  for j=1:length(zm)    % Grid size for measurement error
    R=R + harv(X(:,1) / zm(j), X(:,2), zi(i)) * pm(j) * pi(i);
  end
end
```

Which might be read as:

$$ \sum_i \sum_j \min \left(\textrm{assessed stock} / \textrm{measurement grid}_j,  \textrm{quota} * \textrm{implementation grid}_i\right)   * \textrm{measurement shock}_j * \textrm{implementation shock}_i $$

(Not clear to me why assessed stock is divided by the grid.)

He also computes these grids for the uncertainty, ee=rectgrid(zg,zi,zm,zm), where zg is the growth uncertainty grid, etc.  Again I like this, as it seems like a nice abstraction of the uncertainty process, but I can't quite penetrate what this does but he uses it to create the transition matrix, P, through some g2P function I haven't looked at.  Also not sure why zm appears twice, though perhaps it is related to handling both the current and predicted stock sizes (after all, the M matrix appears twice in my equations too).

For a lark I tried setting the uncertainty grids to match the state space grid, all having 100 points.  This has been running overnight...

Anyway, it looks clever and I which I had a better idea of how he was setting up the model, and what discretizations and assumptions were being made.
