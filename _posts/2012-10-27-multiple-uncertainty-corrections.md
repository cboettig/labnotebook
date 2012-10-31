---
layout: post
published: false

---


Consider a stock $x_t$ at time $t$ that recruits stochastically following harvest $h_t$ from the escaped population ($s_t := x_t - h_t$), $x_{t+1} = z_g f(s_t)$, where $z_g$ is a multiplicative stochastic shock to the growth.  We imagine the decision maker sets a policy determining the harvest quota $q_t$ each year, which is implemented as the real harvest with some error $z_i$, $h_t = z_i q_t$.  Before setting a quota, the decision maker assesses the stock $y_t = z_m x_t$, so $y$ is a noisy measurement of the true stock $x$.  The decision maker seeks to maximize the expected present-value of profits $\Pi(x_t,h_t)$ that are a function of both the actual stock $x$ and the realized harvest $h$ over some long term period $T_{\textrm{max}}$ subject to some discount rate $\delta$,

$$ max_{\{q_1 \ldots q_{t_{\textrm{max}}} \}} \sum_{t=1}^{t=t_{\textrm{max}}} \operatorname{E}\left( \Pi(x_t,h_t) \right) $$


## Discrete formulation

We consider this problem in a discrete state space where $y$ and $x$, $q$ and $h$ all take values on grids of $n_y$, $n_x$, $n_q$, and $n_h$ points respectively.  

* Let $\mathbf{P}$ be the $n_x$ by $n_h$ matrix of all possible profits in a time step, as given by $\Pi(x_i, h_j)$, where rows represent possible stock sizes and columns possible harvests.  

* Let $\mathbf{F}$ be the row-normalized $n_x$ by $n_x$ transition matrix given by $z_g(x_j,  f(s_i))$ 

* Let $\mathbf{I}$ be the row-normalized $n_h$ by $n_q$ matrix whose elements are $z_i(h_i, q_j)$, the probability of implementing a harvest $h_i$ given a quota $q_j$

* Let $\mathbf{Q}$ be the $n_h$ by $n_x$ by $n_x$ tensor mapping escapement level $s_i$ from (recruited) stock size $x_j$ and havest intensity $h_k$, $p(s_i | x_j, h_k)$, which is given by $s_i == max(x_j - h_k, 0)$. Multiplying the matrices $Q_{s_i} I$ generates the equivalent tensor in the space $(s_i, x_j, q_k)$ (quota instead of harvest).  

* Let $\mathbf{M}$ be the row-normalized $n_y$ by $n_x$ matrix whose elements are $z_m(y_i, x_j)$, the probability of observing a stock size $y_i$ from a true size $x_j$.  

* The profits expected given a measurement of the stock $y$ for a quota $q$ are $\sum_j \sum_i \Pi(x_i, h_j) p(x_i | y) p(h_j | q)$.  Hence the matrix of expected profits for each possible combination of $y_i$ and $q_j$ is given by the matrix product $\mathbf{M} \mathbf{P} \mathbf{I} =: \mathbf{P}_e$

* Let $\mathbf{V}_t$ be the $n_y$ by $n_q$ matrix at time $t$ giving the value of choosing quota $q_j$ having observed stock $y_i$ and having selected the optimal $q_{t+1} \ldots q_{t_{\textrm{max}}}$, that is: 

$$ \mathbf{V}_t = \mathbf{P}_e + \delta \mathbf{V}_{t+1}(y_t) $$

* Let $\vec{v}_t$ be the $n_y$ vector with the maximum value of the each row (i.e. for each state $y_i$) of the matrix $\mathbf{V}_t$, and
* let $\vec{d}_t$ be the $n_y$ vector whose elements give the column number (e.g. the $j$ determine the choice $q_j$) of the quota that corresponds to that value.  

Thus $\operatorname{max}_q V_t(y_t) = v_t$.  Starting from the final timepoint, we know the ending value $v_T$ as a function of the ending state $y_T$, but have to re-express this value in terms of the previous state to calculate $V_{T-1}$ (e.g. we need $V_T(y_{T-1})$, but we have only $\operatorname{max}_q V_T(y_T)$.  This calculation requires that we go from the vector space of $y_T$ to that of $y_{T-1}$.  The transition matrix $F$ is our rule for updating between timesteps.  Unfortunately, $F$ operates in the space of true stock $x_t \to x_{t+1}$ rather than measured stock $y$, so we must first move into the vector space of observed variables.  Actually, we have quite a lot of transitions to do.  

To start, we know the optimal value $v_t$ we can get in observing state $y_T$ (from $P_e(y_T)$).  The probability of observing $y_T$ when the true stock is $x_T$ is given by $\mathbf{M}^T$. $M(x_1, y_1) v_T[y_1] +  M(x_1, y_2) v_T[y_2] + \ldots $

We need to express $V_{t+1}$, the value for each possible state $y(t+1)_i$ we might observe, in terms of each possible currently observed state $y(t)_i$ and currently possible control measure $h_t$.   


As $F$



