---
layout: post
tags: [adaptive-dynamics, open-science]
categories: evolution
title: Adaptive Dynamics
---






 








[![analytic\_contours1](http://farm5.static.flickr.com/4142/4942856122_41461002c9.jpg)](http://www.flickr.com/photos/46456847@N08/4942856122/ "analytic_contours1 by cboettig, on Flickr")
Simulation Results
([code](http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/R/coexist_time.R "http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/R/coexist_time.R"))
[![coexist\_sim1](http://farm5.static.flickr.com/4074/4942856132_6b916510c2.jpg)](http://www.flickr.com/photos/46456847@N08/4942856132/ "coexist_sim1 by cboettig, on Flickr")
Analytics ([Analytics
code](http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_analytics.R "http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_analytics.R"))

Notebooks and files
-------------------

Looking at a better way to get figures into my online notebook. I often
run simulations that generate figures which I look at, make some
adjustments to the code based on the figure, and then delete or
overwrite the figure without uploading it to my notebook, because it
isn't "right" or "finished" and uploading takes a lot of clicks,
particularly when the code generates 36 figures in a run. Then I
discover on some later date that I really want to take another look at
the figure. While I usually have the version of the code that generated
it saved in github, the codes sometimes take many hours to run, so this
isn't very efficient -- it would make much more sense to have everything
saved in the notebook. I'm looking into photo hosting sites for figures,
as I think these could offer many other benefits as well. Seeing what
friendfeed can suggest on this:

\

### Exploring Flickr for scientific figures in my notebook

[![analytic\_contours1](http://farm5.static.flickr.com/4142/4942856122_41461002c9_m.jpg)](http://www.flickr.com/photos/cboettig/4942856122/ "analytic_contours1")

[![image](/skins/common/images/magnify-clip.png)](http://www.flickr.com/photos/cboettig/4942856122/ "Enlarge")

Image embedded using the mediawiki flickr plugin

-   So I've set up a [flickr
    account](http://www.flickr.com/photos/46456847@N08/ "http://www.flickr.com/photos/46456847@N08/").
    First things first: edit settings so default permissions are cc-by.
    Now time to explore.

-   First concern was for permanent stable links, which it seems are
    guaranteed even in the free account. Will wait and see if I need the
    capacity of the pro account, but 100MB/month should be a good start.

#### Offline/Desktop tools for Flickr

-   One of the most promising things about flickr seems to be the
    extensive development around it. Several linux native programs
    support Flickr, including the social netwoking manager, gwibber.
    Particularly interested in tools that will let me have the
    automated, command-line upload ability to connect to my notebook.
    Even if I can automatically get figures into Flickr, I guess there's
    still the step of getting them into the notebook. I'm beginning to
    understand more and more why Cameron talks about aggregators so
    much. Meanwhile, looking at two ubuntu-native tools:

-   [DFO](http://code.google.com/p/dfo/ "http://code.google.com/p/dfo/"),
    the Desktop flickr organizer for gnome. Looks nice, easy GUI, very
    polished. However, no longer under active development and not sure
    if it has command line support. Can be installed with apt-get.

--Carl Boettiger 18:21, 30 August 2010 (EDT) Doesn't seem reliable for
uploading, sometimes images don't appear

-   [flickrfs](http://sites.google.com/site/manishrjain/flickrfs#usage "http://sites.google.com/site/manishrjain/flickrfs#usage")
    -- remote mount your flickr account like a directory. No interface
    but then acting like a directory means immediate interoperability
    with command line and other desktop applications. Should make
    adding/uploading very easy. Uses filename.meta for metadata. Can be
    installed directly with apt-get.

--Carl Boettiger 18:21, 30 August 2010 (EDT) Unable to actually get the
directory to mount with user permissions. Mounts but unable to add with
root permissions

-   [kflickr](http://kflickr.sourceforge.net/wikka.php?wakka=Kflickr "http://kflickr.sourceforge.net/wikka.php?wakka=Kflickr"):
    native KDE flickr uploader. Works great, simple and intuitive. Just
    for uploading though. No obvious command line interface.

-   [Nautilus
    integration](http://www.webupd8.org/2010/03/nautilus-flickr-uploader-linux.html "http://www.webupd8.org/2010/03/nautilus-flickr-uploader-linux.html")
    works. simple, easy. We'll see about scripting. apt-get able:
    nautilus-flickr-uploader

-   **[flickr\_upload](http://search.cpan.org/~cpb/Flickr-Upload/flickr_upload "http://search.cpan.org/~cpb/Flickr-Upload/flickr_upload")**
    Yay, an easy to use command-line tool that just works. This looks
    very promising, able to upload photos and add tags with ease.

~~~~ {.de1}
 flickr_upload --tag="my_tag" image.jpg
~~~~

#### From Flickr to Notebook

-   Can embed flickr using the [mediawiki
    plugin](http://wiki.edsimpson.co.uk/index.php/Extended_Flickr_Extension_Syntax#Size "http://wiki.edsimpson.co.uk/index.php/Extended_Flickr_Extension_Syntax#Size").
    Note that syntax is a bit picky, no spaces, a few set sizes. Can
    always embed as above with html, which, unlike photobucket embed,
    lets you set the image size in the html.

Looking for embedding options for a whole collection. Flickr supports
"sets" and other kinds of groups (including tags). Site will make a
slideshow of a set but prevents iframe embedding:

~~~~ {.de1}
  <html><iframe height="500px" width="1000px" src="http://www.flickr.com/photos/46456847@N08/sets/72157624718737779/show/">
</iframe></html>
~~~~

Ah, seems to have it's own embedding option linked from its slideshow.

\

Slideshows can also be created using tags. Replacing every instance of
the tag in the embed script with the new tag works to create a slideshow
of that tag, making it easy to automate this. So, with a single
commandline call I can embed the full 30 likelihood ratio comparisons
from a few days ago:

~~~~ {.de1}
flickr_upload --tag="LR_anoles" *vs*.png
~~~~

Adaptive Dynamics Analytics Results
-----------------------------------

The numerical coexistence time simulations are still running, meanwhile
here are the rest of the analytic set (and one simulation that
finished). [See
code](http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_analytics.R "http://github.com/cboettig/AdaptiveDynamics/blob/a4374f840ca0ff81bc2775eff6309a904640bf99/demos/coexist_analytics.R")
for parameters etc.

\

\

\

More Open Notebook Science discussion
-------------------------------------

\

\

