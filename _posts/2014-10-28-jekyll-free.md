---
layout: post
title: "Goodbye Jekyll?"
category: computing
---

The great strength of Jekyll is in providing a really convenient HTML
templating system through the `_layouts` and `_includes` directories
and Liquid variables (including the auto-populated ones like
`page.previous.url`).

For quickly deploying simple sites though, this is often unnecessary:
one or two layout files will suffice, and an `_includes` directory is not
so useful with only a single layout. The ease of maintenance by having a
template divided into modular chunks is somewhat trumped by the greater
simplicity of copying a single template or set of templates over into
a new directory.

And deploying Jekyll could be easier, particularly with pandoc as
the parser.  Despite plugins that nicely let pandoc act just like the
built-in parsers and a CI setup with Travis to support automated building
of my site on push, setting these components up repeatedly on every new
repository is a bit tedious.  Occassional updates of Jekyll and related
gems have also broken my build pipeline more than once, though this is
less of an issue now that I've added bundler and a Gemfile to restrict gem
versions and provide a Dockerized setup for local deploying.  These things
keep the overhead low for my main site, but are an overhead to replicate.


Meanwhile, I've found Pandoc's templating system to be immensely powerful,
particularly with the yaml headers now supported. To provide a lightweight
way to deploy a website on a gh-pages branch of a new repository, I've
found this system works quite well.  I've illustrated this on my [gh-pages
branch of my template](https://github.com/cboettig/tree/gh-pages)
repository.  Previously, this used Jekyll with the built-in redcarpet markdown
parser to deploy markdown files in a style consistent with my notebook. 

Now, I've stripped this down to simply use a pandoc template, pandoc YAML,
and a Makefile to accomplish much the same thing.  


I was dissapointed to see that the `_output.yaml` used by rmarkdown for 
building multi-page websites 
did not leverage the generic `metadata.yaml` approach already built into
pandoc.  This prevents us specifying custom generic metadata the way one
does in Jekyll with `_config.yaml`, as I describe in [rmarkdown#297](https://github.com/rstudio/rmarkdown/issues/297)
I can work around this with the Makefile by calling pandoc manually
with the additional `metadta.yaml` file, as follows:

```Make
%.html: %.Rmd
  R --vanilla --slave -e "knitr::knit('$<')"
  pandoc --template _layouts/default.html metadata.yaml -o $@ $(basename $<).md
  rm $(basename $<).md

%.html: %.md
  pandoc --template _layouts/default.html metadata.yaml -o $@ $< 

```

Note the `Rmd` building is somewhat more cumbersome since we have to bypass `rmarkdown:render` for this to work.

I had to collapse all my `_includes` and nested `_layouts` into a single `layout`, replace the Jekyll Liquid blocks, {% raw %} `{{` {% endraw %} with pandoc-template `$` ones, and write out a basic `metadata.yaml` file, and things are [good to go](http://io.carlboettiger.info/template/).  

-------


Nonetheless, I
sometimes wish I could break templates into more re-usable components;
similar to the the way `_includes` provides re-usable components for
the templates specified in the `_layouts` directory of a jekyll site.

My first thought was to simply add the re-usable elements into a metadata
block itself. (This seemed particularly promising since we can already
have an external metadata.yaml to provide a metadata block we can use
across multiple file).  However, it seems that Pandoc always escape the
html contents in my yaml metadata.  For instance, if I add the block:


```
---
header: |
    <header class="something"><h1>$title$</h1></header>
---
```

and then in my template add `$header$`, I get the above block but with
all the angle brackets escaped.  I had thought since I have denoted this
as a literal block with '|' in the yaml I would get this block unaltered.
How can I prevent pandoc from escaping the html? (I realize that still
wouldn't parse the `$title$` metadata, but that's a separate issue).

The other approach I considered is to exploit the  `--include-before-body`
and `--include-after-body arguments`.  While more limited since I am
restricted to these two variables, this approach does allow me to specify
a file with a re-usable component block and avoids the issue of HTML
escaping observed above.  Other than the limit of two such variables,
the other limit to this approach is that metadata elements like `$title$`
are processed only in templates, not in files.


It seems like pandoc is thus really close to being able to support
templates that are made from re-usable blocks rather than completely
specified from scratch, but not quite there.  I realize pandoc isn't
trying to be a replacement for static website generation, but still feel
that re-usable blocks would make the existing template system a bit more
flexible and user-friendly.

Quite a few of pandoc's current functions already approximate this
behavior in a hard-wired fashion; e.g. `$highlight-css$` uses the
`--highlight-style` option to select among a bunch of pre-defined
highlight blocks.  Thus I suspect pandoc might be easier to extend
in the future if such features could just be added through an include
mechanism rather than this hardwired approach. 


_See this as a query to [pandoc-discuss](https://groups.google.com/forum/#!topic/pandoc-discuss/pe63zLmNwtk)_

