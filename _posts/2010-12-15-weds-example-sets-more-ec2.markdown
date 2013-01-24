---
comments: true
date: 2010-12-15 16:24:46
layout: post
slug: weds-example-sets-more-ec2
title: 'Weds: Example sets & more EC2'
redirects: [/wordpress/archives/628, /archives/628]
categories:
- evolution
---

A bit delayed from having to rerun analyses on EC2 (still learning...)  More to run today (lambda trials for Anoles -- should really recode this in C!).

Trying to decide if its best to start off with the power curves and work backwards or build up from the basics.  Probably doesn't matter too much which.  Also figuring out which examples to present first:

![]( http://farm6.staticflickr.com/5242/5263820373_02efaa1914_o.png )

![]( http://farm6.staticflickr.com/5090/5264430268_9412864b00_o.png )

![]( http://farm6.staticflickr.com/5203/5264430326_20b913b142_o.png )

![]( http://farm6.staticflickr.com/5126/5263820365_928bfd6ab9_o.png )

![]( http://farm6.staticflickr.com/5121/5263820413_5b046c77be_o.png )


Where the painted trees are the following:

![]( http://farm6.staticflickr.com/5085/5267465400_1a6680e7a1_o.png )



### EC2 Updates


Deleted older ami.  Updating the current ami with personal configurations.  Current ami-c14b1b84 may become the public ami (needs a little extending still, at least libgsl0-dev), but will work from newer ami with secure info already in place to save startup time.  Surprisingly, launching by commandline actually looks more cumbersome than the GUI.

    
    ec2-run-instances <AMI-#> -t <TYPE>
    ec2-describe-instances <Instance ID>
    ssh -i <KEY> <Public Address>
    


Where types indicate the size of the instance.

![]( http://farm6.staticflickr.com/5289/5264139125_9a973b9d2e_o.png )


([more detailed descriptions here](http://aws.amazon.com/ec2/instance-types/)).  You need to use the output of the first line to get the instance id number, whose output includes the the public address.  You'll also need to open the ports on the (default) security group if you haven't done so.  See example in [EC2 guide.](http://docs.amazonwebservices.com/AWSEC2/2007-08-29/GettingStartedGuide/running-an-instance.html) Suppose a script could be wrapped around this to run and log into the instance...

What's with the compute units?  A way of comparing processor power, a faster processor may be worth multiple units.  (basically is comparison to single core 2007 1Ghz xeon processor...)

Still need a solution to bring instances down when they finish (well, still need more automated cleanup/copying data out too...) so I'm not paying for extra cycles while I'm asleep and my jobs have already finished.  Deepak suggested looking into Amazon's SNS (notifications) and SQS (queues), but haven't figured these out.  Twitter works as a pretty good notification system for mobile-accessible simulation updates.  Can't use the ssh client (at least not without first ssh-ing to a local machine).   [Not free, but may need to try EC2 Android app.](http://www.9apps.net/decaf-ec2-client/) Tried accessing the web console in the mobile browser , a bit slow and cumbersome and doesn't list my current instances... curious.
