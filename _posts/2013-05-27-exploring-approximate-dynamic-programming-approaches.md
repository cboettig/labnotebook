---
layout: post
category: ecology
tags: 
- nonparametric-bayes
- algorithms
code: true
---


## Introductory examples in approximate dynamic programming



_Based on Powell 2006, page 97.  I try to conform to that notation throughout_.  Haven't really figured this out yet, so this is more a walk through of me thinking this out then a tutorial. My active copy of this analysis can be found in the [adp-intro](https://github.com/cboettig/nonparametric-bayes/blob/4eb6a30441f28e9cbe87690d9e098b0e068cc395/inst/examples/adp-intro.md) file of my nonparametric-bayes repo, see there for the [most recent](https://github.com/cboettig/nonparametric-bayes/blob/master/inst/examples/adp-intro.md) (or earlier) versions.  

## Setup my sample problem

First we define the Beverton-Holt stock-recruitment relationship as a function of stock size `x`, harvest `h` and parameters `p` 


```r
f <- function(x, h, p){
    A <- p[1] 
    B <- p[2] 
    s <- pmax(x-h, 0)
    A * s/(1 + B * s)
}
p <- pars <- c(1.5, 0.5)
K <- (p[1] - 1)/p[2]
sigma_g <- 0.2
```


We begin with a simulation method $X_{t+1} = f(X_t, Z_t)$.  For illustration, let us consider $f(X_t, Z_t) = Z_t \frac{a X_t}{b + X_t}$ with a = 1.5 and b = 0.5.  We define a statespace $S$



```r
S <- seq(0, 1, length=11) 
```


as a uniform grid of 11 points from 0 to 1.  
We also need a value function on the state space, $C_t(S_t)$. 
For simplicity, we set the price of harvest at unity and 
the cost of harvesting at zero, so that $C_t(S_t, x_t) = \min(x_t, S_t)$.  
($C_t$ is sometimes denoted $\mathbb{\Pi}$).  
We also need an action space $\chi_t$ of possible harvest values.  
Again for simplicity we assume that harvest can be set to any possible state size, $\chi_t \equiv S_t$,


```r
chi <- S
```




```r
T <- 10
N <- 10
```


The approximate dynamic programming algorithm will perform a finite number $N$ = 10 iterations over a window of time $T$ =10 in our example.  The algorithm can then be described as follows: 

## Algorithm (1) 


- **Step 0**

  - Initialize some value $\tilde V_t^0(S_t)$ for all states $S_t$, 
  where the superscripts denote iterations in the forward approximation.  
  As we know absolutely nothing yet to base our initial guess on, 
  we just arbitrarily set this to zero.  


```r
V <- numeric(length(S))
```

  
  - Choose some initial state $S_0^1$
  We start at some initial state for $n = 1$ (superscript) and $t = 0$ (subscript).
  The choice of initial condition may come from the problem itself, 
  otherwise we choose something arbitrarily.  


```r
S_0 <- 0.5
```


  - Set $n = 1$

- **Step 1**: Choose a sample path, $\omega^n$ (a vector of random draws)


```r
sigma <- 0.2
omega_n <- rlnorm(T, 0, sigma)
```


- ** Step 2**: For $t = 0, 1, 2, \ldots, T$, do:

  - Solve:

$$V_t(S_t) = \max_{x_t \in \chi_t} \left(C(S_t, x_t) + \gamma \sum_{s^{\prime} \in \mathcal{S}} \mathbb{P}(s^{\prime} | S_t^n, x_t) V_{t+1}^{n-1} s^{\prime} \right)$$


That is, choose action $x_t$ that maximizes the value of the next step. 


Let's start with $t=0$, $n=1$ and fix an $x_0$ from the set of $\chi$ 
(allowing the action space to be the same in each period, we can omit
the subscript on $\chi$) to get started.  We first compute $C(S_0, x_0)$.

$S_0 = S_0^1$ which we fixed in step **0b** arbitrarily at 0.5. 

The profits/costs $C(S_t, x_t)$ are the value derived by action (harvest) $x_t$ 
at state (stock) $S_t$.  Assuming a fixed price and no costs to harvesting,
this is just whichever number is smaller (since we cannot harvest more than 
the available stock,


```r
C <- function(S, X) pmin(S, X)
```


(where we have used R's vectorized form of the min function).  


This forward dynamic programming will still rely on the one-step transition
matrix, $\mathbb{P}$.  

Let's get the transition matrices for this problem, assuming log-normal noise,


```r
sdp_matrix <- determine_SDP_matrix(f, p, x_grid=S, h_grid=chi, sigma_g)
```


Which is a list of matrices, one for each harvest (action) $x_t$.  

Then we want to consider a fixed $S_t^n$ and fixed $x_t$, and take the sum of 
$\mathbb{P}(s^{\prime} | S_t^n, x_t)$ over the $s^{\prime}$, which means we want
the $x_t$ element from the list, and then we need sum over the distribution of future 
states given the current state $S_t^n$, e.g. a row of the matrix, e.g. `sdp_matrix[[x]][s,]`, 
which we (vector) multiply by $V_{t+1}^{n-1}(s^{\prime})$.

This value $V$ is of course unknown, other than our initial random guess $V_{t}^0$.  
As we step through the iterations $V_t^1$, $V_t^2$, $V_t^3$, etc., this should convgerge to
something meaningful.  

Note that the index along $S$ corresponding to $S_t^n$ is given by


```r
s <- which.min(abs(S-S_0))
```


So our maximization across $x$ just involves: 


```r
values <- 
  sapply(1:length(chi), function(x)
    C(S[s], chi[x]) + sdp_matrix[[x]][s,] %*% V
)

max_x <- which.max(values)
v_hat <- max(values)
```




Trivially, this is just the harvest level that maximizes $C$ so far (which
is just harvesting the $S_0$, since $\bar V^0_t$ begins at zero:


```r
chi[max_x]
```

```
[1] 0.5
```




- step **2b** We can now update our $\bar V^0_t$ to get $\bar V^1_t$, using the rule:

$$V_t^n(S_t) = \begin{cases} 
\hat v_t^n & S_t = S_t^n \\
\bar V_t^{n-1}(S_t) & \textrm{otherwise} 
\end{cases}$$

e.g. use our maximum value for the case of the state we just considered $S_t = S_t^n$, otherwise leave $V_t$ unchanged.  Our new $V$ is thus:


```r
V[s] = v_hat
```




- step **2c**  Compute $S^n_{t+1} = S^M(S_t^n, x^n_t, W_{t+1}(\omega^n))$

We compute the next state using our `max_x` for $x^n_t$, our random samples 
and the transition function...


```r
S_1 <- omega_n[1] * f(S_0, chi[hat["x_nt"]], p)
```

- **Step 3** Let $n = n+1$. if $n < N$, go to step 1


## Putting this all together as a recursive algorithm


```r
N <- 5000 # iterations
M <- 20 # gridsize 
Tmax <- 5 # Time horizon

gamma <- 0.95 # Discount
# f (defined above) 
# p  (defined above)

sigma_g <- 0.5 # larger variation in random draws helps
chi <- seq(0, 1, length.out = M)
S <- seq(0, 1, length.out = M)

sdp_matrix <- determine_SDP_matrix(f, p, x_grid=S, h_grid=chi, sigma_g)

V <- matrix(1, M, Tmax)  # A* strategy
# Fails to explore at matrix(0, M, Tmax)
# consider: # V <- matrix(rep(chi, Tmax), nrow=M) # 
# V[,1] <- chi   # fails to explore if it doesn't have at least some non-zero values

C <- function(S, X) pmin(S, X)
S_0 <- 0.5 
alpha <- 1 # learning rate


for(n in 1:N){
  
  omega_n <- rlnorm(Tmax, 0, sigma_g)
  S_current <- S_0 #runif(1,0,1) # explores faster when this is random

  for(t in 1:Tmax){
    # index of the state we're considering
    s <- which.min(abs(S-S_current)) 
    
    # Find the action maximizing the value
    values <- sapply(1:length(chi), function(x)
      C(S[s], chi[x]) + gamma * sdp_matrix[[x]][s,] %*% V[,t])
    hat <-  c(x_nt = which.max(values), v_nt = max(values))

    # Update value V as mixture of new value and previous value
    V[hat["x_nt"], t] <- (1 - alpha) * V[hat["x_nt"],t] + alpha * hat["v_nt"] 
    
    # Advance the state in time along random path  
    S_current <- omega_n[t] * f(S_current, chi[hat["x_nt"]], p)

  }
}
```


for comparison: the SDP solution


```r
opt <- find_dp_optim(sdp_matrix, S, chi, 70, 0.5, C, 1-gamma, reward=0)
opt$V
```

```
 [1] 0.000 7.173 7.375 7.496 7.584 7.653 7.710 7.760 7.810 7.860 7.910
[12] 7.960 8.010 8.060 8.110 8.160 8.210 8.260 8.310 8.360
```



### Problems arising from the discretization

Note that after the first iteration, $n=1$, the value matrix $V$ is no
longer all zeros.  There is a single state, $S = S_0 =$ 0.5, at which we
have value.  That value is lost if we set harvest $x$ too high, since
we know we will not then end up in that state -- from whence comes the
incentive to consider future value.  Unfortunately, the value exists
only if we hit that state exactly -- all other states are assumed to
have zero value still.

### Additional problems

We no longer have the loop-over-all-states problem, but we face several
new or remaining issues:

1. We still require the use of the one-step transition matrix, with
the equally troublesome sum over all states 
$\sum_{s^{\prime}\in S} \mathbb{P}(s^{\prime} | S_t^n, x_t)$.  
We will fix this by approximating
the transitions in step 2b using random draws as well.

2. We only update the values of states we visit.  We still need a way
to estimate the value of states we have not visited.

3. Worse, we might not visit states that seem bad relative to states we
have visited. This is particularly atrocious in this example.  Since we
initialize the value of all states at 0, the algorithm prefers to harvest
all stock from the current state rather than risk a transition into a
state starting at 0. There is no convergence guarentee that we will ever
escape this cycle of avoiding states we have not seen. We can alter the
initial guess of the value of course, and we could alter the starting
condition to better explore.





## Extensions 

The rest of the ADP development is designed to tackle each of these
issues.  This algorithm gives very poor performance, but very flexible
skeleton on which to extend features that have made ADP such a successful
approach for impossibly large problems.

### Stochastic value function sampling 

Dealing with problem 1:
 
$$V_t(S_t) = \max_{x_t \in \chi_t} \left(C(S_t, x_t) + \gamma \sum_{\hat \omega \in \hat \Omega^n_{t+1}} p_t+1(\hat \omega) \bar V_{t+1}^{n-1} (S_{t+1}) \right)$$

```r
    V[hat["x_nt"], t] <- (1 - alpha) * 
                         V[hat["x_nt"],t] + 
                          alpha * hat["v_nt"] 
```




### Decreasing the state space size

* Aggregation
* Continuous Value function approximations
* Using the post-decision state variable (improves dealing with the expectation calc)



### Initialization problem 

* We do not explore if we are too pessimistic about value of visiting other states.  Start optimisitc: AI's A* alogrithm (synchronous)
* Asynchronous updating -- randomly sampling starting variables
* RTDP (Real Time Dynamic Programming -- not necessarily what it sounds like) external rule determines which states we visit


### Learning

* The concepts of learning and the trade-off between exploration and exploitation are already built-in to the forward algorithm.  








### Using Non-stochastic transition information only, step **2b** can be written as: 


Taking $x_0$ as the smallest harvest, $\min(\chi)$ = 0 and 
evaluating $C(S_0,X_0) = \min(S_0, X_0)$ gives us 0,
rather trivially.  
The next terms depend on the value $\tilde V^0_1(s^{\prime})$ for 
all $s^{\prime} \in S$, which we have no idea about.  Fortunately we have
assumed a value for each of these in step 0a.  

We must also come up with some values for the probability
$\mathbb{P}(s^{\prime} | S_1^0, x_1)$ for each state, given our current
state $S_1^0$ and considered action $x_1$.  This is more straight forward,
since it is determined by our one-step transition function (without 
simulation - recall that the single step transition is given exactly).   


To do so, we evaluate the argument for each value in our action 
space, $x_t \in \chi_t$,

```r
s <- S_0
C <- function(S, X) pmin(S, X)
arg <- sapply(chi, function(x) C(s, x) + f(S, x, p) %*% V)
x_nt = which.max(arg)
v_nt = max(arg)
V[x_nt] = v_nt
```

