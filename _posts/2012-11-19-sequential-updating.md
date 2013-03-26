---
layout: post
tags: nonparametric-bayes
category: ecology

---


Fixed the sequential updating algorithm (avoids numerical instabilities associated with matrix inversion).  Currently defined as the function recursion:

for the covariance:

```r
C_seq <- function(X, X_prime, i){
    if(i <= 1)
          cov(X, X_prime) - mmult(cov(X,x[i]), cov(x[i], X_prime)) / as.numeric( cov(x[i], x[i]) + sigma_n^2)
            else
                  C_seq(X, X_prime,   i-1) - mmult(C_seq(X,x[i],   i-1), C_seq(x[i], X_prime,   i-1)) / as.numeric( C_seq(x[i], x[i],   i-1)  + sigma_n^2  )
}
```

for the mean:

```r
mu_seq <- function(X, i){
    if(i <= 1)
          cov(x[i], X) * (y[i]-mu[i]) / as.numeric( cov(x[i], x[i]) + sigma_n^2)
            else
                  mu_seq(X, i-1) + C_seq(x[i], X,  i-1) * (y[i]-mu[i]) / as.numeric( C_seq(x[i], x[i], i-1)  + sigma_n^2 )
}
```


Note that this needed a custom matrix multiplication to handle scalar by vector cases:

```r
mmult <- function(x,y){
  if(length(x) == 1){
    x <- as.numeric(x) 
    x * y
  } else if(length(y) == 1){ 
    y <- as.numeric(y)
    x * y
  }  else 
  x %*% y
}
```

And probably needs to be written in C at least to have any hope of scaling. See implementation in [sequential-method](https://github.com/cboettig/nonparametric-bayes/blob/e19802885c6ddf2a30807e6b3addf2b9fa3e2ff0/inst/examples/sequential-method.md)


Match is perfect (jittered to avoid overplotting the lazy way):


![Sequential vs direct calculation of the mean](/assets/figures/2012-11-19-58073767b5-unnamed-chunk-6.png) 

Now should rewrite to use a grid for the covariance matrices of each data point.  Memory intensive but should be much faster than function recursion.  


(Should also confirm variance calculation in comparison, and test on larger grid sizes)
