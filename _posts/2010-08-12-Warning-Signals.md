---
layout: post
tags: [warning-signals]
categories: [ecology]
title: Warning Signals
---






 








-   Reworking code to allow standard format for:

1.  evaluating likelihood, -- **Done**
2.  fitting by maximum-likelihood, -- **Done**
3.  simulating, -- **Done**
4.  bootstrapping
5.  plotting models and bootstrap results.

changePt.sim, changePt.lik implemented.

\

#### Function Behavior notes

-   R's mle function wants a named list.

-   Updated parameter handling of OU.lik to allow parameters in
    alpha,theta,sigma format or theta1, theta2, theta3 format, as either
    lists or numerics, named or unnamed. Type handling in each function
    isn't helping the speed, but optimization will have to wait.

\

-   *Note:* Considered allowing for a generalized change-point function,
    taking two separate models and splitting them over a changepoint. No
    obvious way to handle which parameters are global and which are
    local when the models can differ in their parameter structure
    though, so not simply generalizable and abstract.

### Logic for model analysis

Collection of different models, each with a suite of associated methods.
Current models are:

1.  OU
2.  Warning, a linear change in alpha
3.  ChangePt, a discrete jump in alpha

Methods

1.  simulate
2.  evaluate likelihood
3.  fit by likelihood
4.  bootstrap parameter estimates
5.  bootstrap model choice (Neyman-Pearson)
6.  plotting functions for: simulation, parameter bootstrap, model
    choice, model value fit expected value over time-series

#### Challenges

Trouble getting convergence for maximum likelihood fits to simulation
results. By throwing inf log likelihood with out-of-bounds parameters
(should really set a limit epsilon rather than zero on alpha/sigma
values using "L-BFGS-B" method) can avoid hard errors in optim, but mle
throws hard errors and optim complains about convergence: "ERROR:
ABNORMAL\_TERMINATION\_IN\_LNSRCH", a convergence error of 52 in
"L-BFGS-B" method.

\

\

