---
layout: post
category: evolution
tags:
- adaptive-dynamics
- derivation

---

**editorial note**: These notes pre-date the formal start of my online
laboratory notebook, [Feb 2 2010: The Lab Notebook Goes Open](http://carlboettiger.info/2010/02/02/The-Lab-Notebook-Goes-Open-.html)
and were adapted from a LaTeX document in which I kept notes on this topic
during my summer at [IIASA](http://www.iiasa.ac.at/).  Lacking a proper notebook then, documents
like this one were updated periodically and occassionally branched into
new ones.  The post date represents the last time the 
LaTeX document was edited in the course of that research. 

-----------------------------------

$$\begin{aligned}
\mathrm{d}n_1 = r n_1 \left(1 -  \frac{n_1 + C(x_1, x_2) n_2}{K(x_1) } \right) \mathrm{d}t + \frac{1}{\sqrt{K_o} } \sqrt{r n_1 \left(1 +  \frac{n_1 + C(x_1, x_2) n_2}{K(x_1) } \right) } \mathrm{d}W_1\end{aligned}$$

$$\begin{aligned}
p &= \frac{n_1}{n}, \quad q = 1-p = \frac{n_2}{n} \quad n = n_1 + n_2 \\
\mathrm{d}p &= \frac{\mathrm{d}n_1}{n}, \quad \mathrm{d}q = \frac{\mathrm{d}n_2}{n} \\
\mathrm{d}n &= \mathrm{d}n_1 + \mathrm{d}n_2 = n (\mathrm{d}p + \mathrm{d}q) \end{aligned}$$

$$\begin{aligned}
\mathrm{d}p(p,n) = \alpha_1(p,n) \mathrm{d}t + \sqrt{ \alpha_2(p,n) } \mathrm{d}W_p \\
\mathrm{d}n(p,n) = \beta_1(p,n) \mathrm{d}t +  \sqrt{ \beta_2(p,n) } \mathrm{d}W_n\end{aligned}$$

$$\begin{aligned}
f_i(p) =  r p \left(1 -  n(p) \frac{p + c_{12}(1-p) }{k_i } \right) \\
g_i(p) =  r p \left(1 +  n(p) \frac{p + c_{12}(1-p) }{k_i } \right) \end{aligned}$$

$$\begin{aligned}
\alpha_1 &=  f_1(p) \\ 
\alpha_2 &= \frac{ g_1(p) }{K_0 n(p) } \\
\beta_1 &= n f_1(p) + n f_2(1-p)  \\
\beta_2 &= n*\frac{g_1(p)+g_2(1-p)}{K_0 } \end{aligned}$$

$$\begin{aligned}
\frac{\mathrm{d}}{\mathrm{d}t} \sigma_p &= 2 \partial_p \alpha_1(p,n) \sigma_p  +2\partial_n\alpha_1(p,n) \langle p n \rangle +  \alpha_2(p,n) \\
\frac{\mathrm{d}}{\mathrm{d}t} \sigma_n&= 2 \partial_n \beta_1(p,n) \sigma_n  +2\partial_p\beta_1(p,n) \langle p n \rangle +  \beta_2(p,n) \\
\frac{\mathrm{d}}{\mathrm{d}t} \langle p n \rangle &= \partial_n \alpha_1(p,n) \sigma_n  +\partial_p \alpha_1 \langle pn \rangle + \partial_p\beta_1 (p,n) \sigma_p + \partial_n \beta_1(p,n) \langle p n \rangle\end{aligned}$$

$$\begin{aligned}
\partial_p \alpha_1 &= 
\\ \partial_n \alpha_1 &=
\\ \partial_p \beta_1 &= 
\\ \partial_n \beta_1 &=\end{aligned}$$
