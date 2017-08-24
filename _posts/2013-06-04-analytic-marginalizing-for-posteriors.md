---
layout: post
category: ecology
tags:
- nonparametric-bayes
- derivation

---

Consider the model

$$ X_{t+1} = X_t r e^{-\beta X_t + \sigma Z_t } $$

with $Z_t$ a unit normal random variable.  The likelihood of the sequence of $T$ observations of $X$ under this model is thus

$$P(X | r, \beta, \sigma) = \frac{1}{\sqrt{2 \pi \sigma^2}^{T-1}} \exp\left(\frac{\sum_t^{T-1} \left(\log X_{t+1} - \log X_t - \log r + \beta X_t\right)^2 }{2 \sigma^2}\right) $$

To integrate out $r$, $P(X | \beta, \sigma) = \int P(X | r, \beta, \sigma ) P(r) dr$, we'll make this look like a Gaussian in $\log r$ by completing the square; getting the square on the outside of the sum. First we collect all the other terms as the factor, $M_t$;

$$M_t := \log X_{t+1} - \log X_t + \beta X_t$$

Also define $a = \log r$, then after expanding the square inside the sum we have

$$\sum_t^{T-1} \left(\log r - M_t\right)^2 = \sum_t^{T-1} a^2 - 2 \sum_t^{T-1} a M_t + \sum_t^{T-1} M_t^2 $$

(using the linearity of the summation operator). Use the trick of adding and subtracting $\left( \sum M_t \right)^2/(T-1)$, to get:

$$ = -\sum_t^{T-1} M_t^2 -\frac{\left(\sum_t^{T-1} M_t\right)^2}{T-1}  + \frac{\left(\sum_t^{T-1} M_t\right)^2}{T-1} - 2 a \sum M_t + (T-1)a^2$$

$$ =  -\sum_t^{T-1} M_t^2 -\frac{\left(\sum_t^{T-1} M_t\right)^2}{T-1}  +(T-1)\left( \left(\frac{\sum_t^{T-1} M_t}{T-1}\right)^2 - \frac{2 a \sum M_t}{T-1} + a^2\right)$$

$$ = -\sum_t^{T-1} M_t^2 -\frac{\left(\sum_t^{T-1} M_t\right)^2}{T-1}  +(T-1)\left( \frac{\sum_t^{T-1} M_t}{T-1} - a\right)^2$$


Returning this expression into our exponential in place of the sum of squares, we have 

$$P(r, \beta, \sigma | X) = \frac{1}{\sqrt{2 \pi \sigma^2}^{T-1}} \exp\left(-\frac{(T-1)\left( \frac{\sum_t^{T-1} M_t}{T-1} - a\right)^2}{2 \sigma^2}\right) \exp\left(\frac{-\sum_t^{T-1} M_t^2 -\frac{\left(\sum_t^{T-1} M_t\right)^2}{T-1} }{2 \sigma^2}\right) $$


Note that the second $\exp$ term does not depend on $a$. The remaining argument has Gaussian form in $da$, so after pulling out the constant terms we can easily integrate this over $da$.  (Note that we have an implicit uniform prior on $a$ here).

$$ \int \exp\left(\frac{-\left(\frac{\sum_t^{T-1} M_t}{T-1} - a \right)^2}{2 \sigma^1 (T-1)^{-1} } \right) d a  = \sqrt{\frac{2\pi\sigma^2}{T-1}}$$

which we can combine with the remaining terms to recover

$$ \frac{1}{(T-1)\left(2 \pi \sigma^2 \right)^{T-2}} \exp\left(\frac{-\sum M_t^2 + \frac{\left(\sum M_t\right)^2}{T-1}}{2\sigma^2} \right)$$ 


## marginalizing over $\sigma$

Now that we have effectively eliminated the parameter $r$ from our posterior calculation, we wish to also integrate out the second parameter, $\sigma$.  Once again we can "integrate by analogy;" the expression above in the variable $\sigma^2$ looks like a Gamma distribution,

$$ \int x^{\alpha - 1} e^{-\beta x} dx = \frac{\beta^{\alpha}}{\Gamma(\alpha)} $$ 

Where we take

$$ \alpha = T/2$$

and 

$$ \beta = \frac{1}{2} \left( \sum M_t^2 - \frac{ \left( \sum M_t \right)^2}{T - 1}\right) $$,

leaving us with 

$$\frac{1}{(T-1)\sqrt{2 \pi}^{T-2} } \frac{\tfrac{1}{2}^{T/2} \left( \sum M_t^2 - \frac{ \left( \sum M_t \right)^2}{T - 1}\right)^{T/2}}{\Gamma(T/2)} $$


## Additional recruitment functions

The above derivation can be followed identically for the three-parameter recruitment functions I refer to as the Allen and Myers models after an appropriate choice of $M_t$.  In both the Ricker and Allen models we must first reparamaterize the models to isolate the $\alpha$ term correctly.  

#### Ricker 

The original parameterization

$$ X_{t+1} = X_t e^{r \left( 1 - \frac{X_t}{K}\right)}$$ does not partition into the form above. Taking $\beta =  \tfrac{r}{K}$ and $a = r$, we can write $M_t$ as above,

$$M_t := \log X_{t+1} - \log X_t + \beta X_t$$


#### Myers

$$ X_{t+1} = \frac{ r X_t^{\theta} }{1 + \frac{X_t^{\theta}}{K} } Z_t$$

For $Z_t$ lognormal with log-mean zero and log-standard-deviation $\sigma$, The log-likelihood takes the form

and thus we can write $M_t$ as 

$$M_t := \log X_{t+1} - \theta \log X_t + \log\left(1 +  \frac{X_t^{\theta}}{K} \right)$$

#### Allen 

The original parameterization

$$ X_{t+1} = Z_t X_t e^{r \left( 1 - \frac{X_t}{K} \right) \frac{\left(X_t - \theta\right)}{K}} $$

does not let us isolate an additive constant (log-mean term) as we did in the example above. Writing the argument of the exponent in standard quadratic form,

$$ X_{t+1} = Z_t X_t e^{c + b X+t + a X_t^2} $$ 

Where 

$$c = \tfrac{-rC}{K}$$
$$b = \tfrac{r}{K}\left(\tfrac{C}{K} + 1\right)$$
$$a = \tfrac{r}{K^2}$$

then 

$$M_t := \log X_{t+1} - \log X_t - b X_t + a X_t^2 $$  
