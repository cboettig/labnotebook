---
layout: bootstrap
title: Lab Notebook
---



<div id="home">
 <h2>  Archive ({{ site.posts | size }} entries) <a href="{{ site.url }}/atom.xml"><img src="/assets/img/icon-rss.png" alt="feed"></a>
</h2>

([by category]({{ site.url }}/categories.html))
([by tag]({{ site.url }}/tags.html))



  <ul class="posts">
    {% for post in site.posts %}
      <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ site.url }}{{ post.url }}">{{ post.title }}</a> <span>:{{ post.subtitle }}</span></li>
    {% endfor %}
  </ul>

* Earlier posts are still available in my
[Wordpress-based lab notebook](http://www.carlboettiger.info/research/lab-notebook).
* Even earlier posts are available in my 
[OpenWetWare notebook](http://openwetware.org/wiki/User:Carl_Boettiger/Notebook).
</div>


