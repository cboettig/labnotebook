---
layout: page
title: Members
members: 
  - cboettig:
    name:
      first: Carl 
      last: Boettiger
    homepage: http://www.carlboettiger.info
    github: cboettig
    twitter: cboettig
    orcid: /0000-0002-1642-628X
    email: cboettig@gmail.com
    blog: /blog
    photo: carl_circle.png
  - you:
    name:
      first: Your
      last: Name Here?
    website: "/"
    github: ""
    twitter: ""
    orcid: "" 
    email: "you@example.com"
    blog: "http://blog.example.com" 
    photo: you.png

---

{% for member in page.members %}

<div  class="col-md-4"
 prefix="schema: http://schema.org/Person#" 
 typeof="foaf:Person schema:Person" 
 about="{{member.homepage}}"
 style="font-size:20px; text-align:center;">

<p>
<img property="foaf:depiction" src="assets/img/{{member.photo}}" alt="Photo of {{member.name.first}}"/></p>
<p>
<a property="foaf:homepage schema:url" 
  href="{{member.homepage}}"><span
  property="foaf:name"><span 
  property="foaf:givenName">{{member.name.first}}</span> <span
  property="foaf:familyName">{{member.name.last}}</span></span></a></p>
<p class="socialicons">
  [<i class="fa fa-envelope"></i>](mailto:{{member.email}}) 
  <a rel="foaf:account" href="https://twitter.com/{{member.twitter}}"><i class="fa fa-twitter"></i></a> 
  <a rel="foaf:account" href="https://github.com/{{member.github}}"><i class="fa fa-github"></i></a>
  <a rel="http://purl.org/spar/datacite/orcid" href="https://orcid.org/{{member.orcid}}"<i class="ai ai-orcid"></i></a>
  <a rel="foaf:weblog" type="application/atom+xml" href="{{member.blog}}"><i class="fa fa-rss"></i></a></p>

</div>

{% endfor %}

