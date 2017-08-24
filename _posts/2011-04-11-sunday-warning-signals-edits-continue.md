---
comments: true
date: 2011-04-11 08:13:05
layout: post
slug: sunday-warning-signals-edits-continue
title: 'Sunday: Warning signals edits continue'
redirects: [/wordpress/archives/1389, /archives/1389]
categories:
- ecology
tags:
- warning-signals
---


	
  * Marissa edits -- Nearly done 

	
  * Single-figure layout -- DONE 

	
  * equations in appendix -- DONE

	
  * convergence / likelihood agreement between constOU and constLSN (Done, see below; consider using for a better initial-condition guessing routine for better convergence) 

	
  * Reformulate transcritical bifurcation?

	
  * Rewrite cover letter 



![]( http://farm6.staticflickr.com/5103/5607234118_a4d877b381_o.jpg )
 ![]( http://farm6.staticflickr.com/5145/5607230134_0b63303ba8_o.jpg )



    
    
    load("5598226674.Rdat")
    require(warningsignals)
    OU <- deterior_mc$null 
    LSN <- deterior_mc$test
    LSN_OU <- updateGauss(const_LSN, OU$pars, OU$X)
    
    c(OU$loglik, LSN$loglik, LSN_OU$loglik)
    [1] -1038.510 -1142.539 -1162.826
    list(OU$pars, LSN_OU$pars, LSN$pars)
    
    [[1]]
              Ro        theta        sigma 
      0.03372706 605.86310520  21.13186326 
    
    [[2]]
           Ro     theta     sigma 
     83.49120 603.49469  14.00135 
    
    [[3]]
              Ro            m        theta        sigma 
     93.89113902  -0.09374192 631.17624969   9.91779631 
    
    
    # guess LSN parameters from OU parameterization
    guess_Ro <- as.numeric(OU$pars['Ro']^2)
    guess_theta <- as.numeric( OU$pars['theta']+OU$pars['Ro'] )
    guess_sigma<- as.numeric(OU$pars['sigma']/sqrt(2*OU$pars['Ro']+OU$pars['theta']))
    
    ## see if the likelihood of the transformed parameters as LSN resembles the OU likelihood 
    const_pars<- c(Ro=guess_Ro, theta=guess_theta, sigma=guess_sigma)
    
    ## Yay they almost agree:
    -lik.gauss(OU$X, const_pars, const_LSN)
    [1] -1044.504
    OU$loglik
    [1] -1038.510
    
    ## starting from here, they agree after optimization
    new_LSN_OU <- updateGauss(const_LSN, const_pars, OU$X)
    c(new_LSN_OU$loglik, OU$loglik)
    [1] -1038.779 -1038.510
    
    





