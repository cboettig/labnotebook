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


------------------------------------------------------------------------

We consider the classic adaptive dynamics model for evolutionary
branching under competition for a limiting resource by Dieckmann and
Doebeli (1999). The population dynamics of $N(x,t)$ individuals each
with focal trait $x$ are given by a continuous time birth-death process
with rates

$$\begin{aligned}
b(N) = & r \nonumber \\
d(N) = & r \frac{\sum_yN(y,t)C(x,y)}{K(x)} .\label{general_logistic}\end{aligned}$$

The focal trait $x$ can be thought of as some continuous phenotypic
variable, such as beak size, which affects resource consumption. Niche
differences driving speciation arise from differences in this trait. In
the model, $K(x)$ is the resource kernel which determines the
equilibrium population density and $C(x,y)$ is a the competition kernel,
describing the relative change in death rate of individuals of type $x$
due to competition by individuals of type $y$. Given $C(x,x)=1$, the
equilibrium density of a monomorphic population is $N^{\ast}(x)=K(x)$.
We assume the following Gaussian forms,

$$K(x)=K_0e^{-x^2/(2\sigma_k^2)}, \label{K}$$

and

$$C(x,y)=e^{-(x-y)^2/(2\sigma_c^2)}, \label{C}$$

where $\sigma_k$ and $\sigma_c$ are scale factors for the resource
distribution and competition kernels respectively. $\sigma_c$ can be
though of as the niche size. We focus on the case $\sigma_k>\sigma_c$,
for which the model has an evolutionary branching point at $x=0$

The evolutionary dynamics are specified only at the phenotypic level: We
assume that with probability $\mu$ an individual birth results in a
mutant offspring, and that the mutant trait is chosen from a Gaussian
distribution centered at the trait value of the parents and with a
variance $\sigma_{\mu}^2$.

Consider a population of two coexisting types, characterized by traits
$x_1$ and $x_2$ respectively. The birth and death rates of each
population are then given by expression  . We'll assume that the
populations can coexist, that is $(x_1, x_2)$ falls into the coexistence
region $P_2$; *i.e.* that $C(x_1,x_2)K(x_2) /K_1(x_1) < 1 $ and
$C(x_1, x_2) K(x_1)/K(x_2) < 1$. This guarentees that each population
has a positive expected growth rate when rare. However, because the
population is composed of finitely many discrete individuals, there is
still a chance that either type will be lost to chance; to demographic
stochasticity. We whish to characterize the expected waiting time for
such an event to occur.

To do so, we will switch first into density and then frequency, to
obtain a one-dimensional expression we can solve exactly. We will then
use the Arhennius approximation to obtain a closed form solution. First,
we will replace the discrete number of individuals $N$ with the
macroscopic, continuous variable $n$, representing the mean *density* of
individuals; $N/A$, where $A$ is the area in which $N$ individuals are
found. For suitably large $A$, we will be able to accurately describe
$n$ with a coupled stochastic differential equation for each population.
By changing variables once more into the frequency of one type,
$p = n_1/(n_1+n_2)$ and $n = n_1 + n_2$, we are able to do a timescale
seperation to focus on the dynamics in a single variable, $p$.

The master equation that describes the probability of observing $N_i$
individuals of type $i$ is given by,

$$\begin{aligned}
\frac{\mathrm{d}}{\mathrm{d}t} P(N_1,t) &= (\text{E}_1 - 1) r N_1 \frac{N_1 + C(x_1, x_2) N_2}{K(x_1) }P(N_1) + (\text{E}_1^{-1} - 1)r N_1 P(N_1) \nonumber \\
\frac{\mathrm{d}}{\mathrm{d}t} P(N_2,t) &= (\text{E}_2 - 1) r N_2 \frac{N_2 + C(x_2, x_1) N_1}{K(x_2) }P(N_2) + (\text{E}_2^{-1} - 1)r N_2 P(N_2)
\label{mastereq}\end{aligned}$$

where $\text{E}_i^k$ is the step operator taking
$f(N_i) \to f(N_{i+k})$. We apply van Kampen's expansion of the master
equation to linear order to recover the following stochastic
differential equation (Itô equation)

$$\begin{aligned}
\mathrm{d}n_1 = r n_1 \left(1 -  \frac{n_1 + C(x_1, x_2) n_2}{K(x_1) } \right) \mathrm{d}t + \frac{1}{\sqrt{K_o} } \sqrt{r n_1 \left(1 +  \frac{n_1 + C(x_1, x_2) n_2}{K(x_1) } \right) } \mathrm{d}W_1
\label{sde}\end{aligned}$$

and $n_2$ similarly. Switching into the variables for frequency,
$p = n_1/n$ and $n = n_1+n_2$ and simplying notation by
$C(x_1, x_2) = c_{12}$ and $K(X_i) = k_i$:

$$\begin{aligned}
\mathrm{d}p &= r p \left(1 -  n(p) \frac{p + c_{12}(1-p) }{k_1 } \right) \mathrm{d}t + \frac{1}{\sqrt{K_o n(p)} } \sqrt{r p \left(1 +  n(p)\frac{p + c_{12} (1-p) }{k_1 } \right) } \mathrm{d}W_1  \label{freq_sde} \\
n(p) &=  \frac{k_1 k_2}{k_2 p^2 + (k_1+k_2) c_{12} p (1-p) + k1 (1-p)^2 }, \end{aligned}$$

where we have set the dynamic equation for $n(p)$ to equilibrium. The
extinction probability $u(p,t)$ for this expression is given by the
Backwards equation for the generator,

$$\frac{\mathrm{d}}{\mathrm{d}t} u(p,t) = \underbrace{r p \left(1 -  n(p) \frac{p + c_{12}(1-p) }{k_1 } \right)}_{A(p)} \partial_p u(p,t) + \tfrac{1}{2} \underbrace{\frac{1}{K_o n(p) } r p \left(1 +  n(p)\frac{p + c_{12} (1-p) }{k_1 } \right)}_{B(p)} \partial_p^2 u(p,t) 
\label{u}$$

with the boundary conditions $u(0,t) = 1$ and $u(1,t) = 1$ being
absorbing.

Assuming that type 1 is the rare mutant invader, we can solve this
explicitly for small $p$, and particularly for the case of exactly one
new mutant. After some rearrangement we can rewrite this as

$$\begin{gathered}
\frac{\mathrm{d}}{\mathrm{d}t} u(p,t) = \left( rp \left( 1-\frac{n c_{12}}{k_1} \right) - \frac{r n}{k_1} p^2 (1 - c_{12} )\right)  \partial_p u(p,t) \\
+ \left( rp \left(1+\frac{n c_{12}}{k_1}\right)  + \frac{r n }{k_1} p^2 (1 - c_{12} ) \right) \frac{\partial_p^2 u(p,t)}{2K_0 n}\end{gathered}$$

Note then for $p$ small we can neglect the terms quadratic in $p$ and we
are left with the backwards equation from the density independent case,

$$\frac{\mathrm{d}}{\mathrm{d}t} u(p,t) =  rp \left( 1-\frac{n c_{12}}{k_1} \right)   \partial_p u(p,t) + rp \left(1+\frac{n c_{12}}{k_1}\right)   \frac{\partial_p^2 u(p,t)}{2K_0 n}$$

Setting equal to zero we have a simple ordinary differential equation
for the stationary extinction probability:

$$\begin{aligned}
u(p) &= 1 - e^{-2sp K_0 n} \\
s &= \frac{r\left( 1-\frac{n c_{12}}{k_1} \right) }{ r\left(1+\frac{n c_{12}}{k_1}\right)} \end{aligned}$$

and particularly for a frequency $p$ corresponding to a single
individual, a frequency of
$p=1/(N_1+N_2) =(1/K_0)/(n_1+n_2) = 1/(K_0 n)$, this reduces to

$$u = 1-e^{-2s}$$

Assuming $ rp \left( 1-\frac{k_2 c_{12}}{k_1} \right) \neq 0$, the
time-dependent solution[^1] is:

$$\begin{aligned}
u(p,t) &= 1-e^{-p \psi(t) } \\
\psi(t) &= \frac{2 s K_0 n}{1-e^{ r\left( 1-\frac{k_2 c_{12}}{k_1} \right) t } }
\label{timedep}\end{aligned}$$

Larger population (system size) $K_o$ results in longer persistance.

This tells us nothing about the survival of the resident, as it is only
valid for small $p$. In most applications of this approach, it is
assumed the resident quickly goes extinct once $p \sim o(1)$. If we
consider the asymptotic behavior of the nonlinear PDE, Eq. , we see sure
absorbtion at one boundary or the other. The asymptotic behavior needn't
concern us; as we really want to know how the expected lifetime of this
dimporphic state compares with the rate at which mutants are entering
this population. To do so we need the time dependent solution to the
nonlinear backwards equation .

While a direct solution to the nonlinear PDE is not available, we can
solve for the moments analytically. As $u(p,t)$ is the probability of
non-extinction, that is, that the exit time $T$ is greater than the
current time $t$; e.g. $u$ is the cumululative probability density.
Consequently the mean exit time $T(p)$ is given by,

$$T(p) = - \int_0^\infty t \partial_t u(p,t) \mathrm{d}t = \int_0^\infty u(p,t) \mathrm{d}t \label{simple}$$

where we have integrated by parts to get the second expression.
Meanwhile, we can integrate the left-hand side of ,

$$\int_0^{\infty} \partial_t u(p,t) \mathrm{d}t = u(p,\infty) - u(p,0) = -1$$

and integrate the right hand side using  to get

$$A(p) \partial_p T(p) + \tfrac{1}{2} B(p) \partial_p^2 T(x) = -1$$

This can be integrated directly to solve for the mean time starting from
$p=x$ to be absorbed at either boundary $a=0$ or $b=1$:

$$\begin{aligned}
T(x) &= \frac{2 \left[\left(\int_a^x\frac{\mathrm{d}y}{\psi(y)}\right)\int_x^b \frac{\mathrm{d}y'}{\psi(y')} \int_a^{y'} \frac{\mathrm{d}z \psi(z)}{B(z)} - \left(\int_x^b\frac{\mathrm{d}y}{\psi(y)}\right)\int_a^x \frac{\mathrm{d}y'}{\psi(y')} \int_a^{y'} \frac{\mathrm{d}z \psi(z)}{B(z)}\right]}{\int_a^b \frac{\mathrm{d}y}{\psi(y)}}
\label{7integrals} 
\intertext{where}
\psi(x) &= \exp\left( \int_0^x \mathrm{d}x' \frac{2A(x')}{B(x')} \right)\end{aligned}$$

Though these integrals can be computed numerically, a small noise limit
(large populations) allows us to make an additional approximation by
mapping this problem onto the familiar question of escape over a
potential energy barrier. This question arises in basic chemistry, and
is described by a similar stochastic differential equation where the
$A(x)$ coefficent represents the gradient of the energy surface and $B$
the temperature. The analogy initially appears to fail, since in the
chemical context the diffusion coefficent is determined by the
temperature alone, and is independent of the state, while our $B$ term
depends on the frequency $p$. However, as it is not explicitly time
dependent, there is always a transform to change variables into a
context where $B$ is constant. The relevant transformation for us is
known as the Lamperti Transform. Switching variables from $p$ to $q$ by
means of the transform:

$$q = F(p) = \int_z^{p} \frac{1}{\sqrt{B(u)}} \mathrm{d}u
\label{p_to_q}$$

we can rewrite  as

$$\begin{aligned}
\frac{\partial u(q,t)}{\partial t} = \underbrace{\left(\frac{4 A(p)- \partial_p B(p) }{4\sqrt{B(p)}}  \right)}_{\nabla V(p)} \frac{\partial u(q,t)}{\partial q} + \frac{1}{2} \frac{\partial^2 u(q,t)}{\partial q^2}.
\label{new_u}\end{aligned}$$

The mean first passage time in this transformed variable is still solved
by . However, interpreting the coefficent of the drift term as the
gradient of the energy landscape, $\nabla V(p)$, we can approximate that
this time will scale as the exponent of the depth of the energy well
defined by that landscape:

$$\exp{- (\min(V(0), V(1)) - V(p^*) )}$$

[^1]: note that $n(p) \approx k_2$ for small $p$.
