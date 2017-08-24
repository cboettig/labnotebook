---
comments: true
date: 2012-03-27 22:22:14
layout: post
slug: tuesday-pandoc-citations-notes-various
title: 'Tuesday: pandoc citations notes, various'
redirects: [/wordpress/archives/4382, /archives/4382]
categories:
- ecology
- computation
tags: 
- pdg-control
- ropensci
- workflow 
---

## Markdown over latex?



knitr may have solved the fundamental challenge of all Sweave/latex users with Markdown. Too many of us must be able to work with collaborators who don't know LaTeX and journals that won't accept LaTeX.  It's a sad state of the affairs, and has improved slowly for journals (at least many will take pdfs for initial submissions) if not for collaborators.  Consequently getting away from LaTeX would be nice, but Word or Google docs just won't cut it.  They cannot Sweave in code.  They handle equations poorly.  They save binary files not amiable to version management. The aren't easily portable across architectures or onto the web.



### Pandoc Configuration notes

* Very pretty.  https://github.com/vim-pandoc/vim-pandoc
* But uses this to install.  https://github.com/tpope/vim-pathogen
* Apparently apt-get just cannot keep up with our modern world.



Getting citation support for pandoc, also problematic.  


```bash
sudo apt-get install libbibutils-dev bibutils haskell-platform
cabal update
cabal install pandoc
sudo cp ~/.cabal/bin/pandoc /usr/bin/pandoc
```

Goodness grief.  Everyone wants a custom install for their language today.  At least this may be [fixed soon](https://bugs.launchpad.net/ubuntu/+source/haskell-citeproc-hs/+bug/881355)



### Pandoc citations


Taking a look at pandoc citation formats. [see demo 24](http://johnmacfarlane.net/pandoc/demos.html)

Going back and forth between knit notation in vim these days...

    
    :%s/``` {r$.*$}//g
    :%s/`ri //g
    



Any opinions on Pandoc headers?  Pandoc seems to want something like

    % Title
    % Author
    % date

which doesn't translate nicely to github.

I've got citations working using either pandoc or my inline knit now The inline knit requires something like `citep(bib["RTeam2012"])` where bib is a list of bibentries read in from read.bibtex or a doi, `citep("10.1016/j.tpb.2009.10.003")`.

I'm thinking about turning something like [@RTeam2012] into a knitr handle, so I can optionally use knitr or pandoc to fill in the citations.

* Here's an example source with [inline citation](https://github.com/ropensci/rfishbase/blob/3ce7c7a7aa3113624a18ccd74c080a0c014537e8/inst/doc/rfishbase/source/rfishbase.md) and the [resulting output](https://github.com/ropensci/rfishbase/blob/3ce7c7a7aa3113624a18ccd74c080a0c014537e8/inst/doc/rfishbase/rfishbase.md)
* Compare to with [pandoc output](https://github.com/ropensci/rfishbase/blob/3ce7c7a7aa3113624a18ccd74c080a0c014537e8/inst/doc/rfishbase/rfishbase_pandoc.md)

R citations need a bit of formating work, but at least I have the proof of principle now.



### pdg-control (Training Problem II)

  * active adaptive management with model uncertainty (implemented)
  * no-learning case of model uncertainty (still integrate over model uncertainty)
  * passive adaptive management of model uncertainty
  * no-learning case for parameter uncertainty
  * passive adaptive parameter uncertainty

### rOpenSci

Lots of stuff going on.

  * Website transfer to new server.  Possibly consider Jekyll site.
  * Synthesis paper on text mining
  * Google summer-of-code applicants
  * ESA & Evolution tutorials
  * ievobio lightning talk, software bazaar entry, possible challenge entry
  * Pursuit of additional funds
  * Strategy for managing growing list of collaborators
  * Communication / outreach



