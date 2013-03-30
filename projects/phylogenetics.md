---
title: Comparative phylogenetic methods
layout: project
tag: multiple-uncertainty
github: multiple_uncertainty
abstract: Part of my dissertation research involved the detection and statistical verification of regime shifts in macroevolutionary history using phylogenetic comparative methods.    

---
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

{% endcapture %}

{% capture project_entries %}
{% for post in site.tags.phylogenetics limit:8 %}
<p> <a href="{{ post.url }}">{{ post.title }}</a> 
<span style="font-style:italic"> {{ post.date | date_to_string }}</span></p>
{% endfor %}
{% endcapture %}

{% capture project_publications %}
{% mendeley_feed 529971/phylogenetic-methods, 3 %}
{% endcapture %}

{% capture project_data %}

{% endcapture %}





{% include project_template.html %}

