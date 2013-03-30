---
title: The impact of multiple uncertainty in conservation decisions 
layout: project
tag: multiple-uncertainty
github: multiple_uncertainty
abstract: "This project is an exploration into measuring and comparing the value of information in the problem of optimal control or management of a natural resource under multiple sources of uncertainty. Uncertainty about model dynamics, quality of information, and the accuracy of management implementation pose a challenge both in theory and practice of managing natural systems. Different forms of uncertainty may interact, making it impossible to study each in isolation, even in theory and simulation. While managers can often gather additional information to decease uncertainty, not all information is equally valuable. The goal of this project is to help illuminate what kinds of information are most valuable (or kinds of uncertainty are most hazardous) in a way that can be quantified directly in the context of the management optimization problem."

---

{% capture project_collaborators %}

- Mike Springborn
- Jim Sanchirico 

{% endcapture %}

{% capture project_funding %}

{% endcapture %}


{% capture project_issues %}
{% octokit_issues multiple_uncertainty%}
{% endcapture %}
{% capture project_commits %}
{% octokit_commits multiple_uncertainty%}
{% endcapture %}
{% capture project_feed %}
{% mendeley_feed 634301/theoretical-ecology, 3 %}
{% endcapture %}
{% capture project_entries %}
{% for post in site.tags.multiple-uncertainty limit:8 %}
<p> <a href="{{ post.url }}">{{ post.title }}</a> 
<span style="font-style:italic"> {{ post.date | date_to_string }}</span></p>
{% endfor %}
{% endcapture %}
{% capture project_publications %}

{% endcapture %}
{% capture project_data %}

{% endcapture %}



{% include project_template.html %}
