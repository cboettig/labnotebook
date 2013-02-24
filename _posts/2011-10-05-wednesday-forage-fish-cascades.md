---
comments: true
date: 2011-10-05 23:38:52
layout: post
slug: wednesday-forage-fish-cascades
title: Wednesday - forage fish & cascades
redirects: [/wordpress/archives/2832, /archives/2832]
categories:
- ecology
tags:
- coursework
- warning-signals
---

### Forage fish presentation


Some simulations exploring top-down & bottom up control concepts in simple models.

$$ \frac{dN}{dt} = r N\left( 1 - \frac{N}{K} \right) - \alpha N P $$
$$ \frac{dP}{dt} = \beta \alpha N P - \mu P $$
Note that at equilibrium, _N_ depends only on predator dynamics, _P_ on _K_ and _r_.
$$\hat N = \frac{\mu}{\alpha\beta} $$
$$ \hat P = \frac{r}{\alpha}\left( 1 - \frac{N}{K} \right) $$

![]( http://farm7.staticflickr.com/6229/6218801964_2959d33d3a_o.png )


![]( http://farm7.staticflickr.com/6172/6218281173_8baf1ac355_o.png )


Saturating predator response:

$$ \frac{dN}{dt} = r N\left( 1 - \frac{N}{K} \right) - \alpha N P $$
$$ \frac{dP}{dt} = \beta \alpha \frac{N}{H+N} P - \mu P $$

Equilibrium:

$$\frac{\mu H}{ \alpha\beta-\mu} $$ 
$$\frac{r}{\alpha} \left(1- \frac{\hat N}{K}\right) $$



see [code](https://github.com/cboettig/structured-populations/blob/master/demo/cascades2.R) for saturating example.


### Wainwright Lab Meeting presentation





	
  * Presented rfishbase, rtreebase demos.


