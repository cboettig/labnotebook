---
title: Non-parametric Bayesian Inference for Conservation Decisions
layout: project
tag: nonparametric-bayes 
github: nonparametric-bayes
abstract: Decision-theoretic methods often rely on simple parametric models of ecological dynamics to compare the value of a potential sequence of actions.  Unfortunately, such simple models rarely capture the complexity or uncertainty found in most real ecosystems.  Non-parametric Bayesian methods offer a promising statistical approach for predictive modeling of ecological dynamics in regions of state space where the data is adequate, while at the same time offering more flexible patterns with greater uncertainty outside the observed data.  This contrasts from simple parametric models which provide relatively constant level of uncertainty in regions with and without adequate data.  The consequence of such misplaced confidence outside the data can lead to highly undesirable results that may be avoided with the more flexible non-parametric Bayesian approach.  
path: 'projects/'

---

{% capture project_collaborators %}

- Marc Mangel 
- Steve Munch 

{% endcapture %}

{% capture project_funding %}

- Center for Stock Assessment Research, Southwest Fisheries Science Center, NOAA 
- Department of Applied Mathematics and Statistics, Baskins School of Engineering, UC Santa Cruz 

{% endcapture %}


{% capture project_issues %}
{% octokit_issues nonparametric-bayes%}
{% endcapture %}

{% capture project_commits %}
{% octokit_commits nonparametric-bayes%}
{% endcapture %}

{% capture project_feed %}
{% mendeley_category_feed 56626111, 4 %}
{% endcapture %}
{% capture reading_list %}http://mendeley.com/groups/634301/theoretical-ecology/papers{% endcapture %}


{% capture project_entries %}
{% for post in site.tags.nonparametric-bayes limit:8 %}
<p> <a href="{{ post.url }}">{{ post.title }}</a> 
<span style="font-style:italic"> {{ post.date | date_to_string }}</span></p>
{% endfor %}
{% endcapture %}

{% capture project_publications %}

{% endcapture %}


{% capture project_presentations %}
<ul>
<li>Carl Boettiger (2013) Woods Hole Oceangraphic Institute <bold>Invited speaker</bold>  </li>
<li>Carl Boettiger (2013) Ecological Society of America Conference, Minneapolis, MN. </li>
</ul>
{% endcapture %}






{% include project_template.html %}


