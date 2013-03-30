---
title: Nonparametric Bayesian Inference for Conservation Decisions
layout: project
tag: nonparametric-bayes 
github: nonparametric-bayes
abstract: Research in nonparametric Bayesian inference for improving ecosystem management under substantial structural uncertainty.

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
{% mendeley_feed 634301/theoretical-ecology, 3 %}
{% endcapture %}

{% capture project_entries %}
{% for post in site.tags.nonparametric-bayes limit:8 %}
<p> <a href="{{ post.url }}">{{ post.title }}</a> 
<span style="font-style:italic"> {{ post.date | date_to_string }}</span></p>
{% endfor %}
{% endcapture %}

{% capture project_publications %}

{% endcapture %}
{% capture project_data %}

{% endcapture %}





{% include project_template.html %}


