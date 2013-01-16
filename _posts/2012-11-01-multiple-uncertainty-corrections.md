---
layout: post
category: ecology
tags: [multiple-uncertainty, decision-theory]
updated: 2012-11-09

---


Consider a stock $x_t$ at time $t$ that recruits stochastically following harvest $h_t$ from the escaped population ($s_t := x_t - h_t$), $x_{t+1} = z_g f(s_t)$, where $z_g$ is a multiplicative stochastic shock to the growth.  We imagine the decision maker sets a policy determining the harvest quota $q_t$ each year, which is implemented as the real harvest with some error $z_i$, $h_t = z_i q_t$.  Before setting a quota, the decision maker assesses the stock $y_t = z_m x_t$, so $y$ is a noisy measurement of the true stock $x$.  The decision maker seeks to maximize the expected present-value of profits $\Pi(x_t,h_t)$ that are a function of both the actual stock $x$ and the realized harvest $h$ over some long term period $T_{\textrm{max}}$ subject to some discount rate $\delta$,

$$ max_{\{q_1 \ldots q_{t_{\textrm{max}}} \}} \sum_{t=1}^{t=t_{\textrm{max}}} \operatorname{E}\left( \Pi(x_t,h_t) \right) $$


## Discrete formulation

We consider this problem in a discrete state space where $y$ and $x$, $q$ and $h$ all take values on grids of $n_y$, $n_x$, $n_q$, and $n_h$ points respectively.  

* Let $\mathbf{P}$ be the $n_x$ by $n_h$ matrix of all possible profits in a time step, as given by $\Pi(x_i, h_j)$, where rows represent possible stock sizes and columns possible harvests.  

* Let $\mathbf{M}$ be the row-normalized $n_y$ by $n_x$ matrix whose elements are $z_m(y_i, x_j)$, the probability of observing a stock size $y_i$ from a true size $x_j$.  

* Let $\mathbf{I}$ be the row-normalized $n_h$ by $n_q$ matrix whose elements are $z_i(h_i, q_j)$, the probability of implementing a harvest $h_i$ given a quota $q_j$ **Edit**: I had been created in the code as $n_q$ by $n_h$, so had to be transposed.  

* Let $\mathbf{F}_q$ be the tensor of row-normalized $n_q$ $n_x$ by $n_x$ transition matrices given by $z_g(x_j,  \sum_i \sum_j f(x_i, h_j) \mathbf{M}[y_k, x_i] \mathbf{I}[h_j, q_l] )$.  By summing over the uncertainty in measurement and implementation, $\mathbf{F}_q$ is in the space of observed state $y_t$ into the true stock at the next timestep $x_{t+1}$, given quota $q$.  We transfer into the future measured state through another application of $\mathbf{M} \mathbf{F}_q$.  

* The profits expected given a measurement of the stock $y$ for a quota $q$ are $\sum_j \sum_i \Pi(x_i, h_j) p(x_i | y) p(h_j | q)$.  Hence the matrix of expected profits for each possible combination of $y_i$ and $q_j$ is given by the matrix product $\mathbf{M} \mathbf{P} \mathbf{I} =: \mathbf{Q}$

* Let $\mathbf{V}_t$ be the $n_y$ by $n_q$ matrix at time $t$ giving the value of choosing quota $q_j$ having observed stock $y_i$ and having selected the optimal $q_{t+1} \ldots q_{t_{\textrm{max}}}$, that is: 

$$ \mathbf{V}_t = \mathbf{Q} + \delta \mathbf{V}_{t+1}(y_t) $$

* Let $\vec{v}_t$ be the $n_y$ vector with the maximum value of the each row (i.e. for each state $y_i$) of the matrix $\mathbf{V}_t$, and
* let $\vec{d}_t$ be the $n_y$ vector whose elements give the column number (e.g. the $j$ determine the choice $q_j$) of the quota that corresponds to that value.  

Thus $\operatorname{max}_q V_t(y_t) = v_t$.  Starting from the final timepoint, we know the ending value $v_T$ as a function of the ending state $y_T$.  The probability of ending up in each possible state for $y_T$, given a choice of quota $q$ and the current state $y_{T-1}$ is given by the transition matrix $\mathbf{M}\mathbf{F}_q$. The Bellman recursion becomes 

$$ \mathbf{V}_t[,q] = \mathbf{Q}[,q] + \delta \mathbf{M} \mathbf{F}_q v_{t+1} $$



### R code algorithm:

```r
    Ep <- M %*% P %*% I
    V <- Ep
    for(t in 1:Tmax){                                 
      D[,(Tmax-t+1)] <- apply(V, 1, which.max)        
      v_t <- apply(V, 1, max)                        
      V <- sapply(1:n_h, function(j){               
        Ep[,j] + (1-delta) * M %*% F[[j]] %*% v_t  
      })
    }
    D
```

Where 

```r  
    P <-  outer(x_grid, h_grid, profit) 
    M <- rownorm( outer(x_grid, x_grid, pdfn, sigma_m) )
    I <- rownorm( outer(h_grid, h_grid, pdfn, sigma_i) )
```

F is a bit more complicated:

```r    
    F <- lapply(1:n_h, function(q){  
      t(sapply(1:n_x, function(y){
        out <- numeric(n_x)
        mu <- sum(sapply(1:n_x, function(x)
          f(x_grid[x],h_grid,p) %*% 
            I[q,] *  # Implementation error
            M[x,y])) # Measurement error
        if(mu==0)
          out[1] <- 1
        else 
          out <- dlnorm(x_grid/mu, 0, sigma_g)
        out/sum(out)
      }))
    })
```




Something seems to be a mistake, since the optimal policy under uncertainty does not make sense: 


![policy function under each source of uncertainty](http://farm8.staticflickr.com/7132/8158258480_972c8543e6.jpg)

[example script](https://github.com/cboettig/pdg-control/blob/bbef99ec43c75ff1dca959c1511b44c5159f4f4c/inst/examples/mult_uncertainty_test.md)


**Updated Edit**


![](data:image/png;base64,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) 

[See notes on code changes inline](https://github.com/cboettig/pdg-control/commit/954cea9310063150bb42567b19caa272b34d32c2)
