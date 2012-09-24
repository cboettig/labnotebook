---
comments: true
date: 2012-01-06 13:52:22
layout: post
slug: optimal-policy-with-assymetric-costs-to-changing-harvest-quotas
title: Optimal policy with assymetric costs to changing harvest quotas
redirects: [/wordpress/archives/3595, /archives/3595]
categories:
- Stochastic Population Dynamics
tags:
- PDG Control
- warning-signals
---



The optimal policy with symmetric L1 costs to changing the quotas results in the solutions that stop changing, sometimes at no harvest (if there's scrap value), or at some fixed high harvest if no scrap value. (See earlier [notes](http://www.carlboettiger.info/archives/3492)). Asymmetric costs of comparable magnitude result in more crashes.

When we apply an L1 norm cost of the same magnitude as before for decreasing quotas, but allow increasing quotas to be free (no cost to environmental lobby), the solution follows the Reed optimum is in purple (harvest_alt) (cost-free adjustment), while the blue is the harvest level being implemented with a cost:

[flickr]http://www.flickr.com/photos/cboettig/6649003123[/flickr]

This is for a single replicate, but we can verify this holds across an ensemble of 100 runs:

[flickr size="small"]http://www.flickr.com/photos/cboettig/6649003241[/flickr]

This is the same as the symmetric case when cost is relatively small. Since this case has the same cost to decrease quotas but no cost to increase quotas, it is overall a less expensive world in which to do business.


### Asymmetric Policy costs lead to more population crashes


Just tried this and we do indeed see policies that deviate from the Reed optimum (harvest_alt), with the blue harvest line changing far less often, but decreasing by amounts that seem about the same as the increases.

[flickr]http://www.flickr.com/photos/cboettig/6649121277[/flickr]

The ensemble shows the tossing in the towel result of the symmetric case, where several of the replicates cease any changes at all and just send the population to 0 after a certain point.

[flickr]http://www.flickr.com/photos/cboettig/6649121371[/flickr]

This is indeed worse than the optimum solution with symmetric costs at a matching penalty, where the solution is not to harvest

![]( http://farm8.staticflickr.com/7147/6649161593_4201893d64_o.png )


In these cases there is a fixed reward / scrap value for not crashing the population.




## No scrap value


Symmetric costs with no scrap value result in this "tossing in the towel" pattern of following the Reed policy for a while, and then leaving a constant harvest high rate that crashes the stock.

![]( http://farm8.staticflickr.com/7023/6472332667_f75a3ccda6_o.png )


Running the asymmetric costs with no scrap value, we find everything crashes immediately:

[flickr]http://www.flickr.com/photos/cboettig/6649145241[/flickr]

Replicating this with costs 1/10th as high does this more gradually.

[flickr]http://www.flickr.com/photos/cboettig/6649233637[/flickr]
