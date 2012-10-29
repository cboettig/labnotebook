---
layout: post
published: false

---


Consider a stock $x_t$ at time $t$ that recruits stochastically following harvest $h_t$ from the escaped population, $x_{t+1} = z_g f(x_t - h_t)$, where $z_g$ is a multiplicative stochastic shock to the growth.  We imagine the decision maker sets a policy determining the harvest quota $q_t$ each year, which is implemented as the real harvest with some error $z_i$, $h_t = z_i q_t$.  Before setting a quota, the decision maker assesses the stock $y_t = z_m x_t$, so $y$ is a noisy measurement of the true stock $x$.  The decision maker seeks to maximize the expected present-value of profits $\Pi(x_t,h_t)$ that are a function of both the actual stock $x$ and the realized harvest $h$ over some long term period $T_{\textrm{max}}$ subject to some discount rate $\delta$,

$$ max_{\{q_1 \ldots q_{t_{\textrm{max}}} \}} \sum_{t=1}^{t=t_{\textrm{max}}} \operatorname{E}\left( \Pi(x_t,h_t) \right) $$


## Discrete formulation

We consider this problem in a discrete state space where $y$ and $x$, $q$ and $h$ all take values on grids of $n_y$, $n_x$, $n_q$, and $n_h$ points respectively.  

* Let $\mathbf{P}$ be the $n_x$ by $n_h$ matrix of all possible profits in a time step, as given by $\Pi(x_i, h_j)$, where rows represent possible stock sizes and columns possible harvests.  

* Let $\mathbf{F}_h$ be the set (tensor) of $n_h$ $n_x$ by $n_x$ row-normalized transition matrices given by $z_g(x_j,  f(x_i - h))$ 

* Let $\mathbf{I}$ be the row-normalized $n_h$ by $n_q$ matrix whose elements are $z_i(h_i, q_j)$, the probability of implementing a harvest $h_i$ given a quota $q_j$.

* Let $\mathbf{M}$ be the row-normalized $n_y$ by $n_x$ matrix whose elements are $z_m(y_i, x_j)$, the probability of observing a stock size $y_i$ from a true size $x_j$.  

* The profits expected given a measurement of the stock $y$ for a quota $q$ are $\sum_j \sum_i \Pi(x_i, h_j) p(x_i | y) p(h_j | q)$.  Hence the matrix of expected profits for each possible combination of $y_i$ and $q_j$ is given by the matrix product $\mathbf{M} \mathbf{P} \mathbf{I} =: \mathbf{P}_e$

* Similarly we can construct the probability transition matrix from state $y_t$ to $y_{t+1}$ from the matrices for stochastic growth and measurement.  Let $\mathbf{U}_h$ be defined the set (tensor) of $n_q$ by $n_y$ row-normalized matrices given by the matrix product $\mathbf{M} \mathbf{F}_h \mathbf{M}^T$ 

*How does I enter correctly into this calculation?*

* Let $\mathbf{V}_t$ be the $n_y$ by $n_q$ matrix at time $t$ giving the value of choosing quota $q_j$ having observed stock $y_i$ and having selected the optimal $q_{t+1} \ldots q_{t_{\textrm{max}}}$, that is: 

$$ \mathbf{V}_t = \mathbf{P}_e + \delta \mathbf{V}_{t+1}  $$

* Let $\vec{v}_t$ be the $n_y$ vector with the maximum value of the each row (i.e. for each state $y_i$) of the matrix $\mathbf{V}_t$, and
* let $\vec{d}_t$ be the $n_y$ vector whose elements give the column number (e.g. the $j$ determine the choice $q_j$) of the quota that corresponds to that value.  




