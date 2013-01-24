---
layout: post
tags: [open-science, code-tricks]
categories: evolution
title: Entry title
---






 








Automated scripts for image uploads. Tag-based generation of a
slideshow:

\

\
 Running the script:

     ./flickr_slideshow *.png

Creates the html code that can be embedded into the notebook for a
slideshow those images. Images only get the date-time tag as a unique
id.

\

\

This one uses the mediawiki plugin. More formatting options could be
incorporated of course. (Creates the thumbnail images down the
right-hand side).

[![image](http://farm5.static.flickr.com/4123/4948495209_c4ed1eae65_t.jpg)](http://www.flickr.com/photos/cboettig/4948495209/)

[![image](http://farm5.static.flickr.com/4083/4948495397_572743d7f2_t.jpg)](http://www.flickr.com/photos/cboettig/4948495397/)

[![image](http://farm5.static.flickr.com/4133/4948495377_3e2e5d7cdd_t.jpg)](http://www.flickr.com/photos/cboettig/4948495377/)

[![image](http://farm5.static.flickr.com/4089/4949084108_951a7f0ffd_t.jpg)](http://www.flickr.com/photos/cboettig/4949084108/)

[![image](http://farm5.static.flickr.com/4088/4948495319_a0faf77aea_t.jpg)](http://www.flickr.com/photos/cboettig/4948495319/)

[![image](http://farm5.static.flickr.com/4103/4949084050_5cdd93caa6_t.jpg)](http://www.flickr.com/photos/cboettig/4949084050/)

[![image](http://farm5.static.flickr.com/4131/4949084018_5a8a09cbdc_t.jpg)](http://www.flickr.com/photos/cboettig/4949084018/)

[![image](http://farm5.static.flickr.com/4145/4949084074_cca4f29743_t.jpg)](http://www.flickr.com/photos/cboettig/4949084074/)

[![image](http://farm5.static.flickr.com/4085/4948495433_905a01901f_t.jpg)](http://www.flickr.com/photos/cboettig/4948495433/)

Good practice/brush up on my regular expressions and bash scripting
anyway. Scripts re-upload images each time, even if the image hasn't
changed. Makes the photostream confusing but that's only temporary.
Could simply add the figures to the version management, might be easier,
though doesn't enable things like the slideshow or the social options on
a particular figure. Maybe just as well that it's a free account,
duplicates whose urls I don't track will be lost to the ether.

\

Adaptive Dynamics Runs
----------------------

Above figures correspond to these [analytic
approximations](http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_demo.R "http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_demo.R")
and [coexistence
simulations](http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/R/coexist_time.R "http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/R/coexist_time.R")

Now Re-running coexistence simulations on the (-0.2, 0.2) grid and
plotting side-by-side with analytics on same parameters;
[code](http://github.com/cboettig/AdaptiveDynamics/blob/0f9a7975a8dd47c9a7683484a38a4f3bd3f9ad00/demos/coexist_demo.R "http://github.com/cboettig/AdaptiveDynamics/blob/0f9a7975a8dd47c9a7683484a38a4f3bd3f9ad00/demos/coexist_demo.R").

\

\

