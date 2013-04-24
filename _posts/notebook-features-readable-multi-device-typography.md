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
reason most researchers prefer PDF content to HTML-based versions `r citep("http://www.quora.com/Why-do-scientists-tend-to-prefer-PDF-documents-over-HTML-when-reading-scientific-journals")`.
Fortunately, appearance is also fast becoming the greatest handy-cap of
the PDF format, thanks to the rise of mobile devices.



Given the importance of a visually appealing, uncluttered appearance
in communicating scientific content, the notebook has become  
a platform for me to experiment with layout and design. I've taken
several steps in an effort to provide an clean, responsive design that
is readable on any size device and renders reasonably well to print or
PDF formats. I don't have professional training in these things, and
have very little idea how effective my attempts have been, but would
certainly welcome feedback and critique.  After all, the notebook is
merely a place to experiment.  Here are some of the design considerations
currently guiding the layout.

Print media use columns to ensure that lines of text are constrained
to around 60 characters, a length found to be optimal for easy reading.
Columns conserve pages but are are inconvenient for screen-based reading
as they increase the need to scroll back and forth on smaller displays.
Printing costs keep fonts small and decrease the use of color. The
notebook uses a single-column layout with continuous scrolling for
posts and pages.  Column width is fluid but padded with enough empty
space to avoid long lines.  On small devices text can use the whole
width available.

Only the landing pages for the lab-notebook and project-specific landing
pages organize content across multiple columns.  




Twitter-Bootstrap CSS provides a responsive design for different media
formats.  The top navbar remains fixed on large monitors, providing
easy navigation, but scrolls out of the way on smaller devices, and
also collapses to an expandable button to avoid overflow.  Metadata is
provided in a sidebar to the right of the text; which I try to keep as
minimal as possible.




Many academic publishers neglect good typography in the HTML versions
of their articles, though this is changing in newer journals such as
[peerJ]() and [eLife]() (which are both great sources of inspiration).




Features such as pop-up text giving the full citation save the reader
from scrolling to the bottom of a page and losing their place.


CSS provides a print format with a layout appropriate for print media.
The separation of content and style allows for seamless generation of
these different layouts to suit the user.  Even within a given medium
the reader can set viewing preferences such as a light or dark theme.


Solarized colors



