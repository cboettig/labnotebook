---
layout: post
published: false
category: computation
tags:
- docker
---



In the spirit of Greg's post & the discussion here, I'd be interested
in hearing more on people's thoughts about the viability of Dockerized
software both in the teaching classroom and beyond, as students continue
in their research.

To start off, I thought I'd share a few of my own impressions, largely
to give a target for anyone to push back against.  In doing so I will
also try to outline what I see as the features and potential workflow
would look like, in hopes that it does not require any actual experience
with docker to have an opinion on whether or not a particular strategy
makes sense pedagogically.

The discussion of docker has focused on the tool as a largely black-box
solution to get identical software installed on everyone's laptop
efficiently.  This is accurate but overlooks what I think are some of
the more compelling reasons to use Docker, (and may have also introduced
some erroneous ideas like "docker needs a fast network connection",
"docker needs heavy-duty cloud infrastructure" or "docker needs linux
expertise" which are not generically true).

As discussed in previous threads, Dav Clark and colleagues have written
a really compelling piece outlining the drawbacks of the status quo
(installing the necessary software following directions that are written
for a human (but not a computer) to set up a computational environment on
her own operating system) and the value of a more scripted, or DevOps,
approach.  Putting theory to practice, they have also implemented this
by providing the BCE virtual machine image which students can either
run locally or access over the cloud running a remote desktop.  I still
think everyone should read their paper but I've taken the liberty to
summarize here; the authors can please correct me.

Advantages:

1) A consistent user interface 
2) A consistent computational environment
3) Iterating on a common environment can result in something much
more optimized and finely tuned than when everyone manages their own
installation 4) A way for a user to _share_ their exact computational
environment with others (addressing a major current challenge for
reproducibility) 5) Avoids breaking things a user already has natively
installed (e.g. by upgrading their libraries etc)

As others mentioned on this list in the earlier thread, I think this
also begs the question: Will users be able to do all their scientific
computing inside this VM?

Barriers to this include: 

1) Or will the lost efficiency of virtualization become too high? (even
when deploying on cloud servers)

2) User's preference for native tools (e.g. your favorite text editors,
file browsers rather than XFCE's somewhat threadbare appearance) drive
them back to a natively installed environment?

3) Unclear model for how a user extends the standard environment without
forfeiting the benefits of 2-5.

To my mind, Docker can also achieve these five advantages while addressing
the three limitations.  How so?

1: Docker is not full-blown virtualization, but is much lighter-weight.
This seems to be responsible for much of the hype in industry, but for
our purposes I think is the least compelling.

2: This one is a trade-off.  (The technical details of linking
volumes/directories and ports on Mac & Windows aren't completely
streamlined yet, but that's a different, purely technical
discussion. Suffice it to note that Docker announced a solution to
sharing directories on a Mac in the latest release and also announced
a major partnership with Microsoft, so I think we may see relatively
native Docker for Mac and Windows in the future.)

3: This one is the most compelling to me.  Docker is designed to
be extensible.  It is somewhat difficult to summarize what this means
without getting into technical details, but you can get the general idea
by comparison to the virtual machine approach.  From a reproducibility
standpoint, a Titus and others have made a very compelling case

