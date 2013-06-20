---
published: false


---







Great write-up Martin; nice distillation of a lot of ideas.

Quick technical question: is your tooltip created by typekit js? (I didn't see twitter-bootstrap js tooltips in the html source). Looks nice. I should adjust my javascript to trigger tooltips on any titled link, currently I also insist the link has a class=showtooltip.

You don't mention programmatically extracting metadata by DOI/GreyCite, but that's a secondary issue anyhow. Given your ruby-fu, you might enjoy writing a Jekyll extension (create something like {{ content | reference_list }} ) that could parse the links in the rendered HTML and render a full reference list (could even do citeproc styling if you wanted).

My question on anchor text: you mostly do a nice job here of best-practice web conventions in anchor text: using words that describe the resource you are linking to, under 60 characters, etc. I think we all struggle occasionally to avoid using "here", "this", "link" etc as the anchor text, but I do wish I could be less arbitrary. Journals (or even LaTeX with pdf and hyperref) link the citation text, e.g. Author-year or number.

The HTML5 standard re-introduces the cite tag, with the prescription that it should be used for titles only. This might suggest we link titles (or 60 char abbreviations thereof?) instead of parenthetical numbers or author-years. Either would be somewhat more standard than the link whatever-word-in-the-sentence-works-best approach, but maybe that's just being silly.
