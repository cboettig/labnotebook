---
layout: post
tags: [adaptive-dynamics]
categories: evolution
title: Adaptive Dynamics
---






 








-   Working on simulation based approach to summarize distribution of
    waiting times across different phases.
-   What to do about zeros in phase two (when first dimorphism survives
    long enough to be invaded...)
-   Quantify number/distribution of failed attempts at each phase? How
    to represent these distributions across a parameter space in
    sigma\_c, sigma\_k, sigma\_mu, and mu?

![image](http://openwetware.org/images/thumb/1/1e/Distribution.png/180px-Distribution.png)

![image](/skins/common/images/magnify-clip.png)

~~~~ {.de1}
library(BranchingTime)
sim <- branching_time(rep=1000, cpu=8)
save(file = "run1.Rdat")
pdf("distribution.pdf")
m <- max(sim$data)
plot(density(sim$data[1,]), xlim = c(0,m), col="black" )
lines(density(sim$data[2,] ), col = "blue")
lines(density(sim$data[3,] ), col = "green")
lines(density(sim$data[4,] ), col = "red")
legend('topright', c("1", "2", "3", "4"), col=c("black", "blue", "green", "red"), pch = 15)
dev.off()
~~~~

[data
output](http://dl.dropbox.com/u/3982238/run1.Rdat "http://dl.dropbox.com/u/3982238/run1.Rdat")
for plot, parameters, etc in dropbox.

Michael Eisen Visit
-------------------

11pm-noon

-   Excellent
    [talk](http://twitpic.com/1kpdfm "http://twitpic.com/1kpdfm") &
    discussion with Michael Eisen and the Davis Open Science group
    today. Video of the discussion to be posted shortly. We'll be
    discussing the talk and potential for activism among the open
    science group at the social on Wednesday.
-   Talk got me thinking about lots of things. Strong examples of the
    how broken the current system is: not only in the frequency of
    errors but the difficulty in correcting them -- a paper in high
    impact journal that has been contradicted repeatedly in other
    literature remains the most cited. Also the credibility assigned to
    the accuracy of peer review out of proportion with the rigor of the
    process -- most papers are published sooner or later. Better if
    another standard assured credibility than publication in a peer
    reviewed journal alone. Goal of review process is to reject papers,
    makes novel papers harder to publish than more traditional ones.
    Much of the advice you hear about making successful publications has
    little to do with the science. (And how about everything is
    miscellaneous approach to science?)
-   simply pointing out how flawed the system is wasn't solving
    anything, even though most tended to agree. So started PLoS. Next
    year PLoS ONE will be the biggest journal and is financially
    self-supporting, Other evidence of successful open access models:
    biomed central sold for (some large amount) to Elsevier.
-   Commenting system on papers does not seem to be working. Interesting
    discussion of anonymous/signed versions, and filtering/validating
    comments, and provocative view of being able to know what everyone
    in your field thought of each thing they read -- custom view/lens of
    a paper, choose your own reviewers style reading.
-   Best place for Open Science Group to take a role: Challenging
    Intellectual Property policy at UC. Berkeley example: IP department
    costs more to maintain than IP generates in revenue, and resources
    are not available to the public -- at a time when UC is most in need
    of public support. Meanwhile private universities such as Harvard
    are doing much better in open policies. More stats on this would be
    great.
-   Situation isn't as bad as you think -- data does not support the
    myth that you need Science/Nature papers to get a job. Getting high
    profile papers isn't necessarily the reason for getting the job,
    correlation doesn't imply causation. More data on this would be
    great as well.

\

Reading
-------

-   [Cell
    article](http://hdl.handle.net/10.1016/j.cell.2010.04.019 "doi:10.1016/j.cell.2010.04.019")
    on Social Networks in science
-   Alex has me thinking about [ergonomics / light
    levels](http://www.office-ergo.com/setting.htm "http://www.office-ergo.com/setting.htm")
    for office

\

