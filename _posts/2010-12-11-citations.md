---
comments: true
date: 2010-12-11 07:06:22
layout: post
slug: citations
title: Citations
redirects: [/wordpress/archives/570, /archives/570]
categories:
- open-science
---

This evening I'm testing extensions to find a better way to include citations in my entries.  Thus far I've use Mendeley's convenient copy-paste citation tool to paste the whole citation in, which I suppose could work reasonably smoothly with the nice [footnotes plugin](http://) I recently adopted.  However, this still requires a couple more steps than I need to cite in my LaTeX text editor or in OpenOffice.

Using the [papercite plugin](http://wordpress.org/extend/plugins/papercite), I can add citations to posts in much the same way that I add them to my latex documents, using the citation key created Mendeley when it makes my bibtex file.  The plugin allows footnote style citations as well as directly embedding the full citation, and supports a few common formats.  It does have some limitations: it requires manually syncing a copy of bibtex file to my host server; though it can use a url with bibsonomy or citeulike.  I can't hide the "show bibtex" option or the bibtex citation key, and it doesn't make the footnote symbols into links.  Rather nice that it includes the url link, though would prefer it did so by linking the title text rather than creating an icon.


## Going further


Started thinking about this after reading a nice [piece by Martin Fenner](http://blogs.plos.org/mfenner/2010/12/05/blogging-beyond-the-pdf/) on some advantages of Wordpress over pdfs.  I'm interested in more general solutions that would work in any text-edit space, allowing citations in comment boxes, etc.  I'm also exploring these ideas in [a FF discussion group](http://friendfeed.com/science-2-0/deef8494/how-do-you-manage-citations-when-writing-on-web).  The other key question I think is what the citation should link back to, in a way that the link can be tracked.  Thoughts?


## Examples using papercite


Setup:





> 
	
>   1. Create a folder in `wp-content/papercite-data`, with two subfolders: `bib` (this will contain the bibtex files) and `pdf` (this will contain the PDF file).
> 
	
>   2. Copy your bibtex files into the `bib` folder, and your pdf files into the `pdf` folder. To match a bibtex entry with a PDF file, the PDF file should have be named **KEY**`.pdf` where **KEY** is the bibtex key in lowercase, where `:` and `/` have been replaced by `-`.
> 





    
    [bibtex file=library.bib key=Clark2007]


Citing an individual file from the full bibliography file:
[bibtex file=library.bib key=Clark2007]

    
    [bibshow file=Publications.bib]
    This sentence cites the work in [bibcite key=Boettiger2010]
    [/bibshow]
    


[bibshow file=Publications.bib]
This sentence cites the work in [bibcite key=Boettiger2010], and puts the citation information when it encounters the close of bibshow code.
[/bibshow]


#### Including a complete bibtex bibliography


(Using my publications list.  Don't try this with very large bib files: it will run out of memory!)

    
    [bibtex file=Publications.bib]


[bibtex file=Publications.bib]






	
  1. Create a folder in `wp-content/papercite-data`, with two subfolders: `bib` (this will contain the bibtex files) and `pdf` (this will contain the PDF file).

	
  2. Copy your bibtex files into the `bib` folder, and your pdf files into the `pdf` folder. To match a bibtex entry with a PDF file, the PDF file should have be named **KEY**`.pdf` where **KEY** is the bibtex key in lowercase, where `:` and `/` have been replaced by `-`.



