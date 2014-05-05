---
title: "Notebook features: readable, multi-device typography"
layout: post
published: false
category: open-science
tags:
- notebook-technology
- blog

---


Researchers are most familiar with consuming scientific content in
print form. Today using pdfs that preserve the print-oriented,
page-driven concepts.

PDFs appear to have certain additional advantages, such as being
an immutable copy, providing offline access and decentralized
distribution. Many software tools exist to add markup to pdfs extract
their metadata to citation software and even their full text to a local
database that can be queried (e.g. Mendeley). All of these desirable
qualities can be maintained and improved upon in a web-based format
(e.g. see my post on [cryptographic hashes]() for immutable and verifiable
versioning). Meanwhile, the disadvantages of PDF relative to the potential
of web-based content are manifold.  (Tim Burners-Lee's [five-star rating
system for linked data](http://5stardata.info) captures this rather well).

The primary reason for the preeminence of PDF formats is
probably the most trivial: *Appearance*.  Clutter is probably the leading
reason most researchers [prefer PDF content to HTML-based versions](http://www.quora.com/Why-do-scientists-tend-to-prefer-PDF-documents-over-HTML-when-reading-scientific-journals").
Fortunately, appearance is also fast becoming the greatest handy-cap of
the PDF format, thanks to the rise of mobile devices.


Given the importance of a visually appealing, uncluttered appearance in
communicating scientific content, the notebook has become a platform for
me to experiment with layout and design. I've taken several steps in an
effort to provide an clean, responsive design that is readable on any
size device and renders reasonably well to print or PDF formats. I don't
have professional training in these things, and have very little idea
how effective my attempts have been, but would certainly welcome feedback
and critique.  After all, the notebook is merely a place to experiment.
Here are some of the design considerations currently guiding the layout.

Print media use columns to ensure that lines of text are constrained
to around 60 characters, a length found to be optimal for easy reading.
Columns conserve pages but are are inconvenient for screen-based reading
as they increase the need to scroll back and forth on smaller displays.
Printing costs keep fonts small and decrease the use of color. The
notebook uses a single-column layout with continuous scrolling for
posts and pages.  Column width is fluid but padded with enough empty
space to avoid long lines.  On small devices text can use the whole
width available.


Twitter-Bootstrap CSS provides a responsive design for different media
formats.  The top navbar remains fixed on large monitors, providing
easy navigation, but scrolls out of the way on smaller devices, and
also collapses to an expandable button to avoid overflow.  Metadata is
provided in a sidebar to the right of the text; which I try to keep as
minimal as possible.


Many academic publishers neglect good typography in the HTML versions
of their articles, though this is changing in newer journals such as
[peerJ](https://peerJ.com) and [eLife](http://elifesciences.org/)
(which are both great sources of inspiration).


Features such as pop-up text giving the full citation save the reader
from scrolling to the bottom of a page and losing their place.


CSS provides a print format with a layout appropriate for print media.
The separation of content and style allows for seamless generation of
these different layouts to suit the user.  Even within a given medium
the reader can set viewing preferences such as a light or dark theme.

<!--

Thematic alternate color schemes
--------------------------------

The site uses an off-white background with a fading gridline backdrop
evocative of an older lab notebook.  The colors come from the carefully
crafted and popular [Solarized]() color scheme, which follows some
sophisticated design principles outlined on its own webpage.  One feature
of the color choices is the ability to render in both dark and light
backgrounds, as demonstrated on the page.  The notebook provides a simple
Javascript to switch between my personal implementations of both dark
and light themes, (as well as the "alternate stylesheet" designation
for browsers that support it).  The literature I have seen is inconclusive
about the preference for dark or light backgrounds, except that changing
between environments can reduce fatigue.  Just as many e-readers support
this kind of toggling, the notebook provides such functionality in any browser.

Solarized colors provide a visual appeal and distinctiveness, but do not offer
the high contrast often recommended for reading. To address this I have also
added a black and white theme for readers prefering higher contrast.

Solarized colors are particularly useful in code blocks, in which they
provide flexible syntax highlighting using custom CSS file tuned for
Pandoc's code block output.  An [earlier post](http://carlboettiger.info/2012/10/02/solarized-colors.html) from when I first adopted
a Solarized theme has become a somewhat popular source of information.
-->



Beautiful equations with Mathjax
--------------------------------

Equation rendering is an essential part of much scientific writing.
For a long time LaTeX was pretty much the only option for this, but
[MathJax](http://www.mathjax.org/) has now made equation rendering on the web frequently
superior to even what LaTeX can offer. Mathjax provides a LaTeX
equation rendering engine, with the added benefit of vector graphics
that can look excellent at any size.  Javascript means the user
can interact with the equation, zooming in or opening a dialog to
copy the equation in TeX or mathml form.

While the LaTeX format is the simplest for input, the Pandoc parser
can render mathjax to display in the HTML source either using the original
LaTeX format or using the XML-flavor MathML syntax, which may be
advantageous for certain machine-reading exercises.

The notebook also provides equations in RSS feeds and atom readers
without the use of javascript by using a little Jekyll plugin
and the Codecogs API to generate images of each equation.




