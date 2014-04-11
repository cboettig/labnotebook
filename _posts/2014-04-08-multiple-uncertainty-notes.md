---
layout: post
category: ecology
tags:
- multiple-uncertainty


---




Growth Noise Only
------------------

Run: 

```bash
matlab -nodesktop < testing.m > testing.log
```

Results from running [testing.m](http://github.com/cboettig/multiple_uncertainty/tree/master/inst/matlab/testing.m):

- log normal noise
- `sigma_g = 0.2`
- Other noise set to zero.  
- Coarse grid `0:5:150`
- (See linked code all parameters)



![Growth noise only](http://cboettig.github.com/multiple_uncertainty/carl.svg)

measurement Noise only
--------------------------

- Code: [measurement_uncertainty.m](http://github.com/cboettig/multiple_uncertainty/tree/master/inst/matlab/measurement_uncertainty.m)
- `sigma_m = 0.5` 
- Other noise set to zero.  
- Fine grid `0:1:150`
- (See linked code all parameters)


![measurement noise only](http://cboettig.github.com/multiple_uncertainty/unif_0.5_fine_measurement.svg)



Implementation Noise only
--------------------------

- Code: [implementation_uncertainty.m](http://github.com/cboettig/multiple_uncertainty/tree/master/inst/matlab/implementation_uncertainty.m)
- `sigma_i = 0.5`
- Other noise set to zero.  
- Fine grid `0:1:150`
- (See linked code all parameters)


![Implementation noise only](http://cboettig.github.com/multiple_uncertainty/unif_0.5_fine_implementation.svg)





-----------------------


- Thinking about the best way to embed SVGs in the notebook, see [docs/21](https://github.com/ropensci/docs/issues/21)
- Thoughts on date metadata, see [docs/20](https://github.com/ropensci/docs/issues/20)



