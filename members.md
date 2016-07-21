---
layout: page
title: Members
members: 
  - cboettig:
    name:
      first: "Carl" 
      last: "Boettiger"
    title: "Assistant Professor"
    homepage: "http://www.carlboettiger.info"
    github: "cboettig"
    twitter: "cboettig"
    orcid: "0000-0002-1642-628X"
    email: "cboettig@gmail.com"
    cv: "http://carlboettiger.info/vita.html"
    photo: "carl.png"
  - milad:
    name:
      first: "Milad" 
      last: "Memarzadeh"
    title: "Postdoctoral Researcher"
    homepage: "https://www.linkedin.com/in/milad-memarzadeh-45a82827"
    researchgate: "https://www.researchgate.net/profile/Milad_Memarzadeh" 
    github: "miladm12"
    orcid: "0000-0001-7672-6033"
    email: "memarzadeh.milad@gmail.com"
    googlescholar: "https://scholar.google.com/citations?user=c28AlioAAAAJ&hl=en"
    photo: "milad.png"
  - kari:
    name:
      first: "Kari" 
      last: "Norman"
    title: "Graduate Student"
    homepage: "#"
    github: "karinorman"
    orcid: "0000-0002-2029-2325"
    email: "kari.norman.314@gmail.com"
    photo: "kari.png"
  - you:
    name:
      first: "Your"
      last: "Name Here?"
    title: "Open Position"
    website: "#"
    github: "#"
    twitter: "#"
    orcid: "#" 
    email: "you@example.com"
    cv: "http://example.com/cv.html" 
    photo: "you.png"

---

{% for member in page.members %}

<div  class="col-md-4"
 prefix="schema: http://schema.org/Person#" 
 typeof="foaf:Person schema:Person" 
 about="{{member.homepage}}"
 style="font-size:20px; text-align:center;">

<p><img property="foaf:depiction" src="assets/img/{{member.photo}}" alt="Photo of {{member.name.first}}"/></p>
<p>
<a property="foaf:homepage schema:url" 
  href="{{member.homepage}}"><span
  property="foaf:name"><span 
  property="foaf:givenName">{{member.name.first}}</span> <span
  property="foaf:familyName">{{member.name.last}}</span></span></a></p>
<p><span property="http://schema.org/Person#jobTitle">{{member.title}}</span></p>
<p class="socialicons">
<a href="mailto:{{member.email}}" title="email"><i class="fa fa-envelope"></i></a>
{% if member.twitter != nil %}<a rel="foaf:account" href="https://twitter.com/{{member.twitter}}" title="Twitter"><i class="fa fa-twitter"></i></a>{% endif %}
{% if member.impactstory != nil %}<a rel="foaf:account" href="{{member.impactstory}}" title="ImpactStory"><i class="ai ai-impactstory"></i></a>{% endif %}
{% if member.linkedin != nil %}<a rel="foaf:account" href="{{member.linkedin}}" title="LinkedIn"><i class="fa fa-linkedin"></i></a>{% endif %}
{% if member.researchgate != nil %}<a rel="foaf:account" href="{{member.researchgate}}" title="ResearchGate"><i class="ai ai-researchgate"></i></a>{% endif %}
{% if member.github != nil %}<a rel="foaf:account" href="https://github.com/{{member.github}}" title="GitHub"><i class="fa fa-github"></i></a>{% endif %}
{% if member.orcid != nil %}<a rel="http://purl.org/spar/datacite/orcid" href="https://orcid.org/{{member.orcid}}" title="ORCID ID"><i class="ai ai-orcid"></i></a>{% endif %}
{% if member.cv != nil %}<a rel="foaf:publications" type="application/atom+xml" href="{{member.cv}}" title="Publications"><i class="fa fa-file-text"></i></a>{% endif %}
{% if member.googlescholar != nil %}<a rel="foaf:publications" type="application/atom+xml" href="{{member.googlescholar}}" title="Publications"><i class="ai ai-google-scholar"></i></a>{% endif %}</p>
</div>

{% endfor %}


<div class="row">
<div class="col-md-8">

------------

## Undergraduate Researchers 

- Brian Thorsen
- Shea Conlon
- Anna Liu
- Simon Greenhill

----------

<!--
## Group Alumni 

--------

-->


## Interested in Joining?

I'm always interested in talking with perspective undergraduate,
graduate, or post-doctoral researchers. Please [contact
me](http://carlboettiger.info) with a brief email explaining your
background and interests if you are interested in joining the group.

Undergraduates interested in independent work may wish to participate
through UC Berkeley's [SPUR](http://nature.berkeley.edu/site2/spur/) or
[URAP](http://research.berkeley.edu/urap/) programs, or through a senior
thesis project.

Perspective graduate students in quantitative and computational ecology
and environmental sciences should apply through the [ESPM Department
Graduate
Admissions](http://ourenvironment.berkeley.edu/graduate-programs/admissions/)
before Dec 1st. You may also wish to consider applying for an [NSF
pre-doctoral fellowship](http://www.nsfgrfp.org/), the [computational
sciences graduate fellowship](https://www.krellinst.org/csgf/), [NDSEG
fellowship](http://ndseg.asee.org/) or [EPA Star
fellowship](http://www.epa.gov/ncer/fellow/).

Perspective post-doctoral scholars should consider applying for the
[Miller
fellowship](http://millerinstitute.berkeley.edu/page.php?nav=11), the
[NSF's Biology post-doctoral
fellowships](https://www.nsf.gov/funding/pgm_summ.jsp?pims_id=503622),
McDonnell Foundation's [complex systems post-doctoral
fellowship](https://www.jsmf.org/apply/fellowship/) or the [Smith
Fellows](http://conbio.org/mini-sites/smith-fellows/apply/proposal-guidelines)
in conservation research.

</div></div>
