---
layout: post
category: evolution
tags:
- adaptive-dynamics

---

**editorial note**: These notes pre-date the formal start of my online
laboratory notebook, [Feb 2 2010: The Lab Notebook Goes Open](http://carlboettiger.info/2010/02/02/The-Lab-Notebook-Goes-Open-.html)
and were adapted from a LaTeX document in which I kept notes on this topic
during my summer at [IIASA](http://www.iiasa.ac.at/).  Lacking a proper notebook then, documents
like this one were updated periodically and occassionally branched into
new ones.  The post date represents the last time the 
LaTeX document was edited in the course of that research. 



Extinction Probabilities
========================

Gardiner (1985).

We consider single-step birth death models for the majority of this
work. Though they will become multidimensional in later parts of the
work, as we deal with multiple species or explicit environmental
changes, for the time being we will focus on the one-dimensional
bith-death process. The Markov process is defined over positive
integers, $n \in \mathbb{Z}^+$, and will sometimes be assumed to be
bounded above by some integer $N$. The process is determined by two
state-dependent rates, $b(n)$ and $d(n)$, as depicted here: 


![](http://farm4.staticflickr.com/3723/9624787798_6899d87bc1_o.png)


The process is specified by the Master equation:

$$\frac{\partial P(n,t)}{\partial t} = b(n-1)P(n-1,t)+d(n+1)P(n+1) - \left( b(n) + d(n)  \right) P(n)
\label{mastereq}$$

and approximated by the method of Kurtz (1971) or van Kampen's linear
nois expansion as:

$$\frac{\partial P(\tilde n,t)}{\partial t} = - \underbrace{\frac{\partial \left( b(\tilde n)-d(\tilde n) \right)}{\partial \tilde n}}_{A(\tilde n) } \frac{\partial}{\partial \tilde n} \tilde n  P(\tilde n,t)+ \underbrace{\frac{b(\tilde n)+ d(\tilde n)}{2} }_{B(\tilde n)/2} \frac{\partial^2}{\partial \tilde n^2} P(\tilde n)
\label{forward}$$

Note that $n\to \tilde n$ where $\tilde n \in \mathbb{R}$ has become a
continuous value in the limit of large system size. The coefficients
$A(x)$ and $B(x)$ are the jump moments $\partial_x \alpha_{1,0}(x)$ and
$\alpha_{2,0}(x)$ in the van Kampen expansion. This expression is known
as the forward Kolmogrov equation. Its solution is a Guassian, with mean
and variance given respectively by

$$\begin{aligned}
\frac{\mathrm{d}x }{\mathrm{d}t} &= b(x)-d(x) \nonumber \\
\frac{\mathrm{d}\sigma^2}{\mathrm{d}t} &= A(x) \sigma^2 + B(x)
\label{moments}\end{aligned}$$

Related to  is the backward Kolmogrov equation which we use for
first-passage time problems:

$$\frac{\partial P(\tilde n,t)}{\partial t} = A(\tilde n) \frac{\partial}{\partial \tilde n}  P(\tilde n,t)+ \tfrac{1}{2}  B(\tilde n)\frac{\partial^2}{\partial \tilde n^2} P(\tilde n)
\label{backward}$$

From this we have the first passage time starting at $x$ across an
absorbing boundary $a < b$ given $b$ is reflecting:

$$T(x) = 2 \int^x_a \frac{\mathrm{d}y}{\psi(y)} \int_y^b \frac{\psi(z) }{B(z)} \mathrm{d}z
\label{firstpassage}$$

where we define the integrating factor

$$\exp\left( \int_a^y \mathrm{d}x \left[ \frac{2 A(x)}{B(x)} \right] \right)
\label{integrating factor}$$

It is useful to work these results out for some familiar models.

### Levins Model

We first consider the Levins model:

$$\begin{aligned}
b(n) &= c n \left( 1 - n/K \right) \nonumber \\
d(n) &= e n
\label{levins}\end{aligned}$$

$K$ is the number of patches, and also the convenient measure of system
size. In the limit of large $K$, $\tilde n = \tfrac{n}{K}$ represents
the fraction of occupied patches, and we have the coeffients:

$$\begin{aligned}
& A(\tilde n) = c(1-2 \tilde n)-e \\
& B(\tilde n) = c \tilde n (1 - \tilde n) + e \tilde n\end{aligned}$$

By way of  we have the equilibrium mean and variance:

$$\begin{aligned}
& \langle \tilde n \rangle = 1-\frac{e}{c} \\
& \langle (\tilde n - \langle \tilde n \rangle )^2 \rangle = \frac{e}{c}\end{aligned}$$

### Logistic Model

A closely related model is the logistic with the following
interpretation:

$$\begin{aligned}
& b(n) = r n \\
& d(n) = \frac{r n^2}{K}\end{aligned}$$

Which has mean and variance both equal to $K$, and coefficents:

$$\begin{aligned}
& A(x) = r  - \frac{2 r x}{K} \\
& B(x) = rx + \frac{rx^2}{K}\end{aligned}$$
