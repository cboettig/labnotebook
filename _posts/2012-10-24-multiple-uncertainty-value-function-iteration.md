---
layout: post
categories: ecology
tags: [decision-theory, pdg-control]

---



### Multiple Uncertainty algorithm

Define each of the transition matrices:

```r
    D <- matrix(NA, nrow=length(x_grid), ncol=Tmax)  
    P <- outer(x_grid, h_grid, profit)
    F <- outer(x_grid, f(x_grid, 0, p), pdfn, sigma_g)
    M <- outer(x_grid, x_grid, pdfn, sigma_m)
    I <- outer(h_grid, h_grid, pdfn, sigma_i)
``` 

Probably row-normalize each:

```r
rownorm <- function(M) t(apply(M, 1, function(x) x/sum(x))
```

(Note the transpose is needed since the silly function of a vector turns the column into a row.  Not an issue of margin 2)


If we have no uncertainty in measurement or implementation, then the algorithm is:

```r
    V <- P
    for(t in 1:Tmax){
      D[,(Tmax-t+1)] <- apply(V, 1, which.max)
      V <- P + delta * F %*% V %*% D[, (Tmax-t+1)]  
    }
    D
```

With uncertainty

```r    
Ep <- M %*% P %*% I
U <- t(M) %*% F %*% M 
V <- Ep
  for(t in 1:Tmax){
    D[,(Tmax-t+1)] <- apply(V, 1, which.max)
    V <- Ep + delta * U %*% V %*% I %*% D[, (Tmax-t+1)]  
  }
```


### Description

** rambling thinking while working out the above **

The [October 1st entry](http://www.carlboettiger.info/2012/10/01/multiple-uncertainty.html) derives the rule for updating the state (measured stock), 

$$ Y_{t+1} = \mathbb{F} \mathbb{M} \mathbb{I}_h \vec Y_t, $$ 

but this isn't sufficient to complete the value iteration. Recall from the Bellman recursion,

$$V_t = \max_h \operatorname{E}\left( \Pi(Y_t, h_t) + V(Y_{t+1}, h_{t+1}) \right) $$

In the final timestep with no scrap value, we assert that the vector of values for each possible state, $\vec V_T = {0}$.  The previous year is then the first year that can have profits, given by $\Pi(Y_{T-1}, h_{T-1})$.  Of course $Y_{T-1}$ is unknown, but is given by the recursion in (1). 

Our strategy in discrete space is to work backwards from $T$, keeping track of the $h$ that maximizes the value-to-go for each possible state.  So at $T-1$, we put each possible state $y$ and each possible havest $h$ into $\Pi(y,h)$ and select the $h$ that maximizes the profit.  In the case of a deterministic harvest and a lack of measurement error this first iteration is trivial: harvest what you see $h=y$ (unless $h$ is bounded or there is a cost on effort), yielding the value $V_{T-1}$ for each state $y$ is $\Pi(y,y)$.  When profits are proportional to harvest, up to a constant this is simply $y$.  

For a generic profit function that may have a cost on effort, we must store the map of which $h$ is optimal for each $y$.  In discrete space, call this the decision vector $D_{T-1}$ where the indices correspond to the states $y$ and the values correspond to the harvest (or harvest index) that is optimal for that state, and we write $\Pi(y_{T-1}, D_{T-1}(y_{T-1}))$ 

If there is uncertainty in either implementation of the harvest or measurement of the stock, or both, then we must integrate over this in determining the optimal $h$.  The expected profit derived from choosing a harvest quota $q$ and having measured a stock at $y$ is given by  

$$ \Pi(y,q) = \int \int \Pi(x,h) P(x) dx P(h) dh $$

In matrix form, if $\mathbb{P}$ is the matrix of profits where element $p_{ij} = \Pi(x_i, h_j)$ and vector $\vec H$ with elements $H_i$ give the probability of harvesting $h_i$ fish given the quota $q$, then $\mathbb{P} \vec H$ is a vector of profits for each $x_i$.  Representing distribution in the measurement similarly as $\vec X$, the integration for the expected profit is $\vec X^T \mathbb{P} \vec H$ (giving the scalar value $\Pi(y,q)$).  

We can store & lookup $X$ using a matrix whose columns give $\vec X$ for each value $y$, and similarly for $H$ given $q$. These are our matrices $\mathbb{M}$ (each row is a fixed observed $y$, maps true $x$ into observed $y$, elements $P_m(y, x)$) $\mathbb{I}$ (mapping quota $q$ (columns) to implemented harvest $h$, elements $P_I(h_i, q_j)$) from before.  Then we can write $\operatorname{E}(\Pi(x,h) | y,q)$ as a matrix resulting from the product of matrices:

$$\tilde{\mathbb{P}} =  \mathbb{M} \mathbb{P} \mathbb{I} $$


In the next iteration, $T-2$, we realize that our choice of $h$ impacts the value we could get a time $T-1$ as well. In choosing the harvest quota in this interval we must also consider what value it introduces in the $T-1$ interval.  We already have the matrix above giving the profits for each $y$ and $h$, we just need to transition from the space of the current $y$ to the future $y$ through application of the transition matrix $T: y_t \to y_{t+1}$.  $F: x_t \to x_{t+1}$, $F(x_{t+1}, x_t)$, $M: x \to y$, $I: q \to h$, so 

$$\mathbb{T} = M^T F M \tilde{P} I D_t $$


