---
title: Stochastic effects in Adaptive Dynamics 
layout: project 
tag: adaptive-dynamics 
github: AdaptiveDynamics
abstract: "Research in stochastic effects in Adaptive Dynamics.  Adaptive Dynamics extends evolutionary game theory into the context of dynamical systems rather that stationary strategies.  Unlike much evolutionary theory, this approach permits rich, density-dependent ecological interactions to drive the evolutionary dynamics rather than more abstract claims about fitness.  However, most of the genetic richness is lost, making this more informative about the evoltionary stability of ecological dynamics under evolutionary perturbation than a detailed evolutionary model.  While most of adaptive dynamics works in the deterministic limits of ordinary differential equations, my work extends this to the stochastic context."

---

{% capture project_collaborators %}
- Joshua Weitz 
- Jonathan Dushoff 
- Ulf Dieckmann 
- Rupert Mazzucco 

{% endcapture %}
{% capture project_funding %}
- [IIASA YSSP](http://www.iiasa.ac.at/web/home/about/news/Apply-now-for-the-Young-Scientists-Summer-Program.en.html) 
- National Academy of Sciences and NSF Grant No. OISE-0738129  

{% endcapture %}

{% capture project_issues %}
{% octokit_issues AdaptiveDynamics%}
{% endcapture %}

{% capture project_commits %}
{% octokit_commits AdaptiveDynamics%}
{% endcapture %}

{% capture project_feed %}
{% mendeley_feed 529981/adaptive-dynamics, 3 %}
{% endcapture %}

{% capture project_entries %}
{% for post in site.tags.adaptive-dynamics limit:8 %}
- <a href="{{ post.url }}">{{ post.title }}</a><span style="font-style:italic"> {{ post.date | date_to_string }}</span>

{% endfor %}
{% endcapture %}

{% capture project_publications %}
<ul>
<li >Carl Boettiger, Jonathan Dushoff, Joshua S Weitz (2010) <strong>Fluctuation domains in adaptive evolution</strong>, 6-13. <em>Theoretical Population Biology</em> 77 (1). <a rel="datacite:doi" href="http://dx.doi.org/10.1016/j.tpb.2009.10.003">doi</a>:10.1016/j.tpb.2009.10.003 (<a href="http://www.mendeley.com/download/public/98752/3107791751/8b066644aca2e396fd5e120d563026c8d560dc77/dl.pdf">pdf</a>) (<a href="http://arxiv.org/abs/1004.4233">arXiv</a>) (<a href="https://github.com/cboettig/fluctuationDomains">code</a>) (<a href="http://datadryad.org/handle/10255/dryad.37625">data</a>)</li>
<li>Carl Boettiger, Joshua Weitz, Simon Levin (2007) <strong>Adaptive Dynamics: Branching Phenomena and the Canonical Equation</strong> <em>Princeton Physics Dept</em>. <a href="http://www.mendeley.com/download/public/98752/3107796951/191a62cc7aca52feb33075b833ac13eba1ed9679/dl.pdf" title="Download file">Download PDF</a></li>
<li>Carl Boettiger. (2009) Presentation at the International Institute of Applied Systems Analysis, Vienna; Austria. In <em>Nature Precedings,</em> (<a href="http://dx.doi.org/10.1038/npre.2012.6852.1">doi</a>) (<a href="http://www.slideshare.net/cboettig/iiasa-final">slides</a>)</li>
</ul>
{% endcapture %}

{% capture project_data %}
<strong> Software </strong>
- Simulate explicit ecological and evolutionary dynamics leading to branching: [AdaptiveDynamics](https://github.com/cboettig/AdaptiveDynamics) (R, C++)
- Illustrate Fluctuation domains: [fluctuationDomains](https://github.com/cboettig/fluctuationDomains) (R, C)

{% endcapture %}






{% include project_template.html %}


