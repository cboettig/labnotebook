---
layout: bootstrap
title: Lab Notebook
---



<div id="home">
 <h2>  Archive ({{ site.posts | size }} entries) <a href="{{ site.url }}/atom.xml"><img src="/assets/img/icon-rss.png" alt="feed"></a>
</h2>




  <ul class="posts">
    {% for post in site.posts %}
      <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ site.url }}{{ post.url }}">{{ post.title }}</a>
      <span>{{ post.subtitle }}</span></li>
    {% endfor %}
  </ul>


  <ul>
    <li> Entries <a href="{{ site.url }}/categories.html">by category</a> </li> 
    <li> Entries <a href="{{ site.url }}/tags.html">by tag</a> </li> 
    <li> Earlier entries are still available in my <a href="http://www.carlboettiger.info/research/lab-notebook">Wordpress-based lab notebook</a>. </li> 
    <li> Even earlier entries are available in my <a href="http://openwetware.org/wiki/User:Carl_Boettiger/Notebook">OpenWetWare notebook</a>. </li> 
  </ul>

</div>


