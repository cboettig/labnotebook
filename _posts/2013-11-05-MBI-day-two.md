---
layout: post
category: ecology
tags: 
- conference 
- pdg-control 
- ropensci 

---

## MBI Workshop 

#### Paul Armsworth

Very nice example of control in creating a market for ecosystem services for landowners.  Key feature is that multiple land-owners respond by adjusting their prices, and so payments can be divided into fraction going into subsidy and fraction going into conservation.  When one land-owner controls land that is particularly good cost per conservation accomplished, they also stand to gain largest value.  

Also looked at auction mechanism and impact of cooperation among landowners to create hold outs.  

#### Hugh Possingham

Hot spot assignment. Marxan and success while ignoring dynamics.  {to what extent is data substitute for dynamics}

Dynamics (but no heterogeneity) 

#### Bill Fagan

Linking individual movements to population dynamics.  Home range vs migration vs nomadic motion.  

#### Afternoon breakout 

Looking at role of institutions and tractability of implementation problems.  Interesting observation from Lou in the long-tail effect of certain individuals in explaining heterogeneity in implementation success.  



--------

### PDG Control  

Working on table following [issue #41](https://github.com/cboettig/pdg_control/issues/41)

Based on [errors_table.Rmd](https://github.com/cboettig/pdg_control/blob/5c18c1108dd7502a54bb39c1750d9be74c974ba0/inst/examples/policycosts/errors_table.Rmd), plot from [plot_table.Rmd](https://github.com/cboettig/pdg_control/blob/49b3faf7cd4430aa8ba18cb5a36862b5d07f1e0f/inst/examples/policycosts/plot_table.Rmd)



shows the effect of greater noise actually reducing the impact of being wrong (either by ignoring adjustment costs that exist or assuming adjustment costs that don't exist).  Bigger induced reduction in NPV (higher cost) naturally decreases value. 

Functional form doesn't matter when assuming costs that don't exist, since these are calibrated to be equivalent by selecting the coefficients in order to have equal reduction in NPV.  Obviously functional form does matter when ignoring penalties that do exist, and it seems that ignoring L2 penalties is most damaging, ignoring L1 penalties the least damaging?  

![plot of chunk unnamed-chunk-1](http://farm8.staticflickr.com/7371/10693106325_9cb0c2c8bb_o.png) 



<TABLE border=1>
<TR> <TH>  </TH> <TH> penalty_fn </TH> <TH> ignore_cost </TH> <TH> ignore_fraction </TH> <TH> assume_cost </TH> <TH> assume_fraction </TH> <TH> sigma_g </TH> <TH> reduction </TH>  </TR>
  <TR> <TD align="right"> 1 </TD> <TD> L1 </TD> <TD align="right"> 14536.09 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 16857.61 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.10 </TD> </TR>
    <TR> <TD align="right"> 2 </TD> <TD> L2 </TD> <TD align="right"> 11020.10 </TD> <TD align="right"> 0.76 </TD> <TD align="right"> 15538.44 </TD> <TD align="right"> 0.92 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.10 </TD> </TR>
      <TR> <TD align="right"> 3 </TD> <TD> fixed </TD> <TD align="right"> 13584.97 </TD> <TD align="right"> 0.92 </TD> <TD align="right"> 17582.78 </TD> <TD align="right"> 1.05 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.10 </TD> </TR>
        <TR> <TD align="right"> 4 </TD> <TD> L1 </TD> <TD align="right"> 9273.66 </TD> <TD align="right"> 1.09 </TD> <TD align="right"> 17561.81 </TD> <TD align="right"> 1.04 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.20 </TD> </TR>
          <TR> <TD align="right"> 5 </TD> <TD> L2 </TD> <TD align="right"> 11020.10 </TD> <TD align="right"> 0.76 </TD> <TD align="right"> 15538.44 </TD> <TD align="right"> 0.92 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.20 </TD> </TR>
            <TR> <TD align="right"> 6 </TD> <TD> fixed </TD> <TD align="right"> 8332.45 </TD> <TD align="right"> 0.84 </TD> <TD align="right"> 17401.82 </TD> <TD align="right"> 1.03 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.20 </TD> </TR>
              <TR> <TD align="right"> 7 </TD> <TD> L1 </TD> <TD align="right"> -641.78 </TD> <TD align="right"> 0.21 </TD> <TD align="right"> 15451.25 </TD> <TD align="right"> 0.92 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.30 </TD> </TR>
                <TR> <TD align="right"> 8 </TD> <TD> L2 </TD> <TD align="right"> -272586.11 </TD> <TD align="right"> -24.90 </TD> <TD align="right"> 11567.12 </TD> <TD align="right"> 0.69 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.30 </TD> </TR>
                  <TR> <TD align="right"> 9 </TD> <TD> fixed </TD> <TD align="right"> -1213.01 </TD> <TD align="right"> -0.46 </TD> <TD align="right"> 15519.95 </TD> <TD align="right"> 0.92 </TD> <TD align="right"> 0.05 </TD> <TD align="right"> 0.30 </TD> </TR>
                    <TR> <TD align="right"> 10 </TD> <TD> L1 </TD> <TD align="right"> 18281.97 </TD> <TD align="right"> 1.01 </TD> <TD align="right"> 20973.56 </TD> <TD align="right"> 0.99 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.10 </TD> </TR>
                      <TR> <TD align="right"> 11 </TD> <TD> L2 </TD> <TD align="right"> 12462.51 </TD> <TD align="right"> 0.72 </TD> <TD align="right"> 19392.85 </TD> <TD align="right"> 0.91 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.10 </TD> </TR>
                        <TR> <TD align="right"> 12 </TD> <TD> fixed </TD> <TD align="right"> 16691.94 </TD> <TD align="right"> 1.03 </TD> <TD align="right"> 20143.80 </TD> <TD align="right"> 0.95 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.10 </TD> </TR>
                          <TR> <TD align="right"> 13 </TD> <TD> L1 </TD> <TD align="right"> 12788.95 </TD> <TD align="right"> 0.96 </TD> <TD align="right"> 20663.21 </TD> <TD align="right"> 0.97 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.20 </TD> </TR>
                            <TR> <TD align="right"> 14 </TD> <TD> L2 </TD> <TD align="right"> 12462.51 </TD> <TD align="right"> 0.72 </TD> <TD align="right"> 19392.85 </TD> <TD align="right"> 0.91 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.20 </TD> </TR>
                              <TR> <TD align="right"> 15 </TD> <TD> fixed </TD> <TD align="right"> 12399.01 </TD> <TD align="right"> 0.88 </TD> <TD align="right"> 21289.21 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.20 </TD> </TR>
                                <TR> <TD align="right"> 16 </TD> <TD> L1 </TD> <TD align="right"> 9099.48 </TD> <TD align="right"> 0.73 </TD> <TD align="right"> 19999.07 </TD> <TD align="right"> 0.94 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.30 </TD> </TR>
                                  <TR> <TD align="right"> 17 </TD> <TD> L2 </TD> <TD align="right"> -6337.76 </TD> <TD align="right"> -0.39 </TD> <TD align="right"> 17765.33 </TD> <TD align="right"> 0.83 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.30 </TD> </TR>
                                    <TR> <TD align="right"> 18 </TD> <TD> fixed </TD> <TD align="right"> 7399.01 </TD> <TD align="right"> 0.62 </TD> <TD align="right"> 21969.84 </TD> <TD align="right"> 1.03 </TD> <TD align="right"> 0.20 </TD> <TD align="right"> 0.30 </TD> </TR>
                                      <TR> <TD align="right"> 19 </TD> <TD> L1 </TD> <TD align="right"> 30227.43 </TD> <TD align="right"> 1.07 </TD> <TD align="right"> 31377.07 </TD> <TD align="right"> 0.94 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.10 </TD> </TR>
                                        <TR> <TD align="right"> 20 </TD> <TD> L2 </TD> <TD align="right"> 33472.18 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 33472.18 </TD> <TD align="right"> 1.00 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.10 </TD> </TR>
                                          <TR> <TD align="right"> 21 </TD> <TD> fixed </TD> <TD align="right"> 28926.73 </TD> <TD align="right"> 1.09 </TD> <TD align="right"> 30500.85 </TD> <TD align="right"> 0.91 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.10 </TD> </TR>
                                            <TR> <TD align="right"> 22 </TD> <TD> L1 </TD> <TD align="right"> 24157.93 </TD> <TD align="right"> 1.10 </TD> <TD align="right"> 31767.92 </TD> <TD align="right"> 0.95 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.20 </TD> </TR>
                                              <TR> <TD align="right"> 23 </TD> <TD> L2 </TD> <TD align="right"> 19091.31 </TD> <TD align="right"> 0.93 </TD> <TD align="right"> 29225.46 </TD> <TD align="right"> 0.87 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.20 </TD> </TR>
                                                <TR> <TD align="right"> 24 </TD> <TD> fixed </TD> <TD align="right"> 23573.19 </TD> <TD align="right"> 1.02 </TD> <TD align="right"> 30069.80 </TD> <TD align="right"> 0.90 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.20 </TD> </TR>
                                                  <TR> <TD align="right"> 25 </TD> <TD> L1 </TD> <TD align="right"> 21086.12 </TD> <TD align="right"> 1.12 </TD> <TD align="right"> 32035.93 </TD> <TD align="right"> 0.96 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.30 </TD> </TR>
                                                    <TR> <TD align="right"> 26 </TD> <TD> L2 </TD> <TD align="right"> 19091.31 </TD> <TD align="right"> 0.93 </TD> <TD align="right"> 29225.46 </TD> <TD align="right"> 0.87 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.30 </TD> </TR>
                                                      <TR> <TD align="right"> 27 </TD> <TD> fixed </TD> <TD align="right"> 17209.56 </TD> <TD align="right"> 0.85 </TD> <TD align="right"> 32946.24 </TD> <TD align="right"> 0.98 </TD> <TD align="right"> 0.50 </TD> <TD align="right"> 0.30 </TD> </TR>
                                                         </TABLE>


-------------------


## rOpenSci / ecoinformatics


- Exploring strategies for addressing certificate authentication workflow.  
- Plans to merge `dataone` and `rdataone`, shedding the current `rJava` dependency and dealing with existing vs new namespacing [#1](https://github.com/ropensci/rdataone/issues/1)


## phylogenetics

- Some discussion of <span class="showtooltip" title="Quintero I, Wiens J and Harmon L (2013). 'Rates of Projected Climate Change Dramatically Exceed Past Rates of Climatic Niche Evolution Among Vertebrate Species.' Ecology Letters, 16, pp. 1095-1103. ."><a href="http://dx.doi.org/10.1111/ele.12144">Quintero et al. (2013)</a></span>   





