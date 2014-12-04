---
layout: post
published: false

---


<!--
Should probably flush this out more into a 'what I want from CI' style post.
-->


A good question from Hilmar on why we're using Drone CI in RNeXML development. 


Short answer: Easy to use custom docker images for Drone. Note how much
shorter our .drone.yml is.  We actually still use Travis to test the
package, while Drone CI is just testing the manuscript/supplement builds

Longer answer:

I think it's a standing irony of the reproducible research toolkit
we have in place here that the required software environment for the
knitr/pandoc/latex pipeline is substantially more intensive than what
is required merely to run the code examples. In particular, Travis's
Ubuntu 12.04 doesn't come with the right version of pandoc, and as you
know a LaTeX environment can get pretty large and pretty complicated. To
make matters worse, we a handful of packages that aren't on CRAN yet
(or have been removed from CRAN recently) to handle some of the 'bonus'
features we show in the supplement (in particular, the rrdf package
was removed from CRAN.  sidenote: Scott and I are working with Matt
Jones to write a non-java-based R wrapper for RDF, based on the redland
bindings, which should avoid some of the installation challenges of rrdf,
see https://github.com/ropensci/redland-bindings).  Likewise we add a
few bonus packages from Omegahat that aren't on CRAN yet (e.g. xslt)
and whose sources tend to be a bit less stable.  All in all, we end up
with a dependency environment that is not only non-trivial to set up on
travis, but also tends to need some active maintenance from time to time
as versions are updated or even bumped off CRAN.

Rather than maintaining each .travis.yml for each package individually,
the Drone+Docker approach means I can maintain a single consistent
environment (that is the same I do development on in the first place),
and use that for the CI tests as well. (image: rocker/ropensci).  I think
this could be a cleaner approach to CI, though at this stage it's largely
an experiment for us.

Doesn't the fact that our dependency environment isn't super stable
suggests some bad choices on dependencies on our part?  We've tried to
avoid fragile dependencies for all the fundamental functions of RNeXML --
these additional dependencies only arise in the "Suggested" section of the
dependencies. Users should be able to copy-paste code from the paper into
any R terminal and expect it to run without having to worry about pandoc,
latex, knitr, or the suite of packages needed for testing.  but the
docker image is handy way when we do want to test all these pieces.

Some final random remarks: Note that we need to run Drone on our own
server to have the benefit of custom Docker images.  Also note that we
can get Docker to run on Travis, but it requires some non-trivial hackage
(https://github.com/rocker-org/rocker/blob/master/.travis.yml)

