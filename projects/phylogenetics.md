---
title: Comparative phylogenetic methods
layout: project
tag: Labrids 
github: wrightscape
path: 'projects/'

---

{% capture project_abstract %}

Evolutionary transitions that allow biodiversity to expand to a new
habitat or new feeding niche punctuate the history of life on this
planet. Can we identify when such shifts occurred, and find hints
of what mechanisms, events or functional trait innovations made them
possible? I approach these questions through the framework of comparative
phylogenetic methods, bringing together trait data from the field of
functional morphology across present- day species with genetic data
determining the phylogenetic tree to understand how important traits
have evolved across the different species.

Most existing models permit only a single evolutionary regime describing
evolution across the entire tree. Identifying key innovations that change
the pattern or tempo of evolution in a trait requires the development of
more complicated models allowing for such regime shifts, and subsequently
solving the likelihood equations that would allow us to estimate these
models from data.

Richer models require more data for reliable estimates, which is
one reason why models involving regime shifts can be particularly
demanding. It is often impractical to directly gather data across
dozens to hundreds of species. While much of this data has already been
collected, existing methods of access are tedious and error-prone. While
facing such challenges working on these evolutionary models I developed
the R packages rfishbase and rtreebase, (Boettiger et al. 2012; Boettiger
& Temple Lang 2012) which provide automated and interactive access,
manipulation, and visualization for such large remote repositories.

I also recently introduced a simulation-based approach to identify
when the available data is sufficiently informative to select between
potential mechanisms and when it does not contain enough information to
make a choice (Boettiger, Coop & Ralph 2012). This investigation into
the limits of information balances my development of richer models,
ensuring that the complexity of the models not out-pace the complexity
of the data available.

{% endcapture %}


{% capture project_collaborators %}
- Peter Wainwright 
- Graham Coop 
- Peter Ralph 
- Brian O'Meara 
- Jeremy Beaulieu 
- Duncan Temple Lang 

{% endcapture %}

{% capture project_funding %}

- Department of Energy Computational Sciences Graduate Fellowship 
- Center for Population Biology, UC Davis 

{% endcapture %}


{% capture project_issues %}
{% octokit_issues wrightscape%}
{% endcapture %}

{% capture project_commits %}
{% octokit_commits wrightscape%}
{% endcapture %}

{% capture project_feed %}
{% mendeley_feed 529971/phylogenetic-methods, 3 %}
{% endcapture %}
{% capture reading_list %}http://mendeley.com/groups/529971/phylogenetic-methods/papers{% endcapture %}

{% capture project_entries %}
{% for post in site.categories.evolution limit:8 %}
<p> <a href="{{ post.url }}">{{ post.title }}</a> 
<span style="font-style:italic"> {{ post.date | date_to_string }}</span></p>
{% endfor %}
{% endcapture %}

{% capture project_publications %}
<ul>

<li >Carl Boettiger, Duncan Temple Lang (2012). <strong>Treebase: An R package for discovery, access and manipulation of online phylogenies</strong>, <em>Methods in Ecology and Evolution</em>. <a rel="datacite:doi" href="http://dx.doi.org/10.1111/j.2041-210X.2012.00247.x">doi</a>:10.1111/j.2041-210X.2012.00247.x (<a href="http://www.mendeley.com/download/public/98752/4976371531/463d3755b618c40e35dca223e27162c08fbc061a/dl.pdf">pdf</a>) (<a href="https://github.com/ropensci/treebase/blob/master/inst/doc/treebase/treebase_github.md">preprint</a>) (<a href="https://github.com/ropensci/treebase">code</a>) (<a href="http://cran.at.r-project.org/web/packages/treebase/">R package</a>)</li>


<li >Jeremy M. Beaulieu, Dwueng-Chwuan Jhwueng, Carl Boettiger and Brian O’Meara, (2012). <strong>Modeling Stabilizing Selection: Expanding the Ornstein-Uhlenbeck Model of Adaptive Evolution</strong>, 2369-2383. <em>Evolution</em> 66 (8). <a rel="datacite:doi" href="http://dx.doi.org/10.1111/j.1558-5646.2012.01619.x">doi</a>:10.1111/j.1558-5646.2012.01619.x (<a href="http://www.mendeley.com/download/public/98752/4605481493/dfca8df9311b372425a204c1a6587ecee2b275dc/dl.pdf">pdf</a>) (<a href="http://cran.r-project.org/web/packages/OUwie/index.html">code</a>)</li>

<li >Carl Boettiger, Graham Coop, Peter Ralph (2012) <strong>Is your phylogeny informative? Measuring the power of comparative methods</strong>, 2240-51. <em>Evolution</em> 66 (7). <a rel="datacite:doi" href="http://dx.doi.org/10.1111/j.1558-5646.2011.01574.x">doi</a>:10.1111/j.1558-5646.2011.01574.x (<a href="http://www.mendeley.com/download/public/98752/4485545653/566ffaffaf0fa6fb8f847096b742bc465aca3a8e/dl.pdf">pdf</a>) (<a href="http://arxiv.org/abs/1110.4944">arXiv</a>) (<a href="https://github.com/cboettig/pmc">code</a>) (<a href="http://datadryad.org/handle/10255/dryad.37645">data</a>)</li>

</ul>


{% endcapture %}

{% capture project_presentations %}

<ul>
<li>Invited speaker in SSB Symposium: Carl Boettiger (2012) Evolution Conference, Ottawa, CAN. (<a href="http://www.slideshare.net/cboettig/evolution-13576088">slides</a>)</li>
<li>Carl Boettiger. (2011) Evolution Conference; Norman, OK. In <em>Nature Precedings</em>, (<a href="http://dx.doi.org/10.1038/npre.2011.6080.1">doi</a>) (<a href="http://www.slideshare.net/cboettig/a-general-model-of-continuous-character-evolution">slides</a>)</li>
<li>Carl Boettiger. (2011) iEvoBio Conference; Norman, OK. <em>In Nature Precedings</em>, (<a href="http://dx.doi.org/10.1038/npre.2012.6851.1">doi</a>) (<a href="http://www.slideshare.net/cboettig/r-interface-to-treebase">slides</a>)</li>
<li>Carl Boettiger, Graham Coop &amp; Peter Ralph. (2011) Society for Integrative and Comparative Biology. Salt Lake City, Utah. In <em>Nature Precedings</em>, (<a href="http://dx.doi.org/10.1038/npre.2011.6453.1">doi</a>) (<a href="http://www.slideshare.net/cboettig/is-your-phylogeny-informative">slides</a>)</li>
<li>Carl Boettiger. (2010) iEvoBio Conference; Portland, OR. In <em>Nature Precedings</em> (<a href="http://dx.doi.org/10.1038/npre.2010.4602.1">doi</a>) (<a href="http://www.slideshare.net/cboettig/ievobio">slides</a>)</li>
<li>Carl Boettiger. (2010) Evolution Conference; Portland OR. In <em>Nature Precedings</em> (<a href="10.1038/npre.2010.4615.1">doi</a>) (<a href="http://www.slideshare.net/cboettig/a-new-phylogenetic-comparative-method-detecting-niches-and-transitions-with-continuous-characters">slides</a>)</li>
<li>Carl Boettiger. (2009) University of Tennessee, Knoxville, TN.</li>
<li>Carl Boettiger. (2009) Center for Population Biology, Davis, CA. (<a href="http://www.slideshare.net/cboettig/cpb-pres">slides</a>)</li>
</ul>
{% endcapture %}





{% include project_template.html %}

