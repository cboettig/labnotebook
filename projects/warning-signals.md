---
title: Early warning signals for ecological regime shifts  
layout: project
tag: warning-signals 
github: earlywarning
path: 'projects/'

---

{% capture project_abstract %} 

Can we predict the approach of a regime shift before it happens? Without
having observed a transition it may be impossible to identify mechanistic
models of the responsible processes.  Despite this limitation, we may find
certain patterns typical of systems approaching a critical transition
that could provide an early warning signal of a shift (Scheffer et
al. 2009). This is both an exciting possibility and an immense challenge -
even detailed models frequently fail to provide accurate forecasts when
extrapolated beyond the range of the data. The highly nonlinear nature of
regime shifts and the lack of data outside of the current regime makes
this forecasting problem even more challenging. A potential indicator
that is too general risks false positives that do not correspond to
an approaching transition, while specific indicators may miss more
transitions. I was recently able to quantify these probabilities of
false alarms and missed detections and investigate the trade-off between
these errors for proposed early warning indicators (Boettiger & Hastings
2012). We further introduced a generic model-based indicator that can
better minimize both errors at once.

Better indicators and approaches that can synthesize large and diverse
data streams may improve such forecasts, but predicting regime shifts will
always be an uncertain business. We may at best quantify the probability
that a regime shift will occur, a percent chance of a transition. How to
we decide what actions to take in face of such valuable but incomplete
information? These questions have spurred me to explore questions in
optimal control and decision theory, which I am exploring during my
post-doctoral work (see Nonparametric-Bayes and Multiple Uncertainty).

{% endcapture %} 

{% capture project_collaborators %}
- Alan Hastings 
- Noam Ross 

{% endcapture %}

{% capture project_funding %}
- Department of Energy Computational Sciences Graduate Fellowship 
- Center for Population Biology, UC Davis 

{% endcapture %}


{% capture project_issues %}
_issues feed from earlwarning repo. Also see [ews-review](https://github.com/cboettig/ews-review) for a separate warning-signals repository for a recent concepts paper only._

{% octokit_issues earlywarning%}
{% endcapture %}

{% capture project_commits %}
_This commits feed from master branch. Note that Prosecutor's Fallacy research and paper was developed on [prosecutor](https://github.com/cboettig/earlywarning/tree/prosecutor) branch of this repository._

{% octokit_commits earlywarning%}
{% endcapture %}

{% capture project_feed %}
{% mendeley_feed 530001/early-warning-signs, 4 %}
{% endcapture %}
{% capture reading_list %}http://mendeley.com/groups/530001/early-warning-signs/papers{% endcapture %}

{% capture project_entries %}
{% for post in site.tags.warning-signals limit:8 %}
<p> <a href="{{ post.url }}">{{ post.title }}</a> 
<span style="font-style:italic"> {{ post.date | date_to_string }}</span></p>
{% endfor %}
{% endcapture %}

{% capture project_publications %}
<ul prefix="datacite: http://purl.org/spar/datacite/">

  <li> <strong>Carl Boettiger</strong>, Alan Hastings. (2013) No early warning signals for stochastic transitions: insights from large deviation theory.  <em>Proceedings of the Royal Society B</em>. {{"10.1098/rspb.2013.1372" | doi_pdf_parser }} (<a href="http://arxiv.org/abs/1307.4415">arXiv</a>) (<a href="https://github.com/cboettig/prosecutors-fallacy">repository</a>) </li> 

  <li> <strong>Carl Boettiger</strong>*, Noam Ross*, Alan Hastings. (2013) Early warning signals: The charted and uncharted territories. <em>Theoretical Ecology</em> {{"10.1007/s12080-013-0192-6" | doi_pdf_parser }} (<a href="http://arxiv.org/abs/1305.6700">arXiv</a>) (<a href="https://github.com/cboettig/ews-review">repository</a>) </li>

<li>Carl Boettiger, Alan Hastings (2013). <strong>Tipping points: From patterns to predictions</strong> <em>Nature</em> 493, 157–158. <a rel="datacite:doi" href="http://dx.doi.org/10.1038/493157a">doi</a>:10.1038/493157a</li>
<li>Carl Boettiger, Alan Hastings (2012). <strong>Early Warning Signals and the Prosecutor’s Fallacy</strong> 279 (1748) 4734-4739. <em>Proceedings of the Royal Society B</em> 279 (1748). <a rel="datacite:doi" href="http://dx.doi.org/10.1098/rspb.2012.2085">doi</a>:10.1098/rspb.2012.2085 (<a href="http://www.mendeley.com/download/public/98752/4972355691/dd5fdd8ebbfc05d9ebf415761be200805254d22e/dl.pdf">pdf</a>) (<a href="http://arxiv.org/abs/1210.1204">arXiv</a>) (<a href="https://github.com/cboettig/earlywarning/blob/prosecutor/inst/examples/fallacy.md">code</a>) (<a href="http://dx.doi.org/10.5061/dryad.2k462">data</a>)</li>
<li>Carl Boettiger and Alan Hastings (2012). <strong>Quantifying Limits to Detection of Early Warning for Critical Transitions</strong>, 2527-2539. <em>Journal of the Royal Society: Interface</em> 9 (75) <a rel="datacite:doi" href="http://dx.doi.org/10.1098/rsif.2012.0125">doi</a>:10.1098/rsif.2012.0125 (<a href="http://www.mendeley.com/download/public/98752/4711221423/df767d6b5f0fbf44cc236470307992b019e6c149/dl.pdf">pdf</a>) (<a href="http://arxiv.org/abs/1204.6231">arXiv</a>) (<a href="https://github.com/cboettig/earlywarning">code</a>)</li>
<li> Carl Boettiger*, Noam Ross*, Alan Hastings.  <strong>Early warning signals: The charted and uncharted territories</strong>. (Submitted) </li>
</ul>


{% endcapture %}

{% capture project_presentations %}

</ul>
<li>Carl Boettiger (2012) Ecological Society of America Conference, Portland, OR. (<a href="http://www.slideshare.net/cboettig/esa-2012-talk">slides</a>)</li>
<li>Carl Boettiger (2012) Computational Science Graduate Fellows Conference, Washington DC.<br /> (<a href="http://www.youtube.com/watch?v=xwIIVdyKe4o">video recording</a>) (<a href="http://www.slideshare.net/cboettig/regime-shifts-in-ecology-and-evolution">slides</a>) (<a href="http://dx.doi.org/10.6084/m9.figshare.97279">doi</a>)</li>

<li>Carl Boettiger &amp; Alan Hastings. (2011) Ecological Society of America Conference; Austin, TX. In <em>Nature Precedings</em> (<a href="http://dx.doi.org/10.1038/npre.2012.6857.1">doi</a>) (<a href="http://www.slideshare.net/cboettig/limits-to-detection-for-early-warning-signals-of-population-collapse">slides</a>)</li>

</ul> 

{% endcapture %}



{% include project_template.html %}



