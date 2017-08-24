---
comments: true
date: 2010-10-28 
layout: post
title: Red Noise (aside exercise)
redirects: [/wordpress/archives/134, /archives/134]
categories:
- ecology

---

Consider the first-order autoregressive process:
$$ X_{t+1} = \rho X_t + \sqrt{1-\rho^2}Z_t $$

Why the funny term at the end?  This comes from normalizing the variance,

$$ \begin{multline} E( (\rho X_t + \sqrt{1-\rho^2} Z_t)^2 )  =  \\
E (\rho^2 X_t^2)  + E(2 \rho X_t  \sqrt{1-\rho^2})  Z_t )  + \\
E( X_t^2 Z_t^2 (1-\rho^2) ) \end{multline}$$

by independence:

$$   = \rho^2  E(X_t^2)  + 2 \rho \sqrt{1-\rho^2}  E( X_t ) E( Z_t )  + E( X_t^2)  E(Z_t^2) (1-\rho^2)  $$

and as $E(Z_t) = 0$ and $E(Z_t^2) = 1$ then

$$   = \rho^2  E(X_t^2)  +   E( X_t^2)  \sigma^2 (1-\rho^2) = E(X_t^2) $$

and the variance is stationary, $E((X_{t+1})^2) = E((X_{t})^2)$

A nice exercise connects this to the continuous time result,

$$ dX = -\gamma X dt + dW $$  

Where the variance is again reduced by the correlation coefficient,  $E(X^2) = 1/(2\gamma)$.
