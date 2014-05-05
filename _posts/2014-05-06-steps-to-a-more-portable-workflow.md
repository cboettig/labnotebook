---
layout: post
published: false

---



Currently manuscripts developed in `inst/doc/pubs` or something like that; rather obtuse. Should manuscripts just be treated like other vignettes?

Default behavior for knitr `.Rmd` vignette is to build HTML. Could add a Makefile (called after knitr compiles the vignette) to recompile into md and then into tex/pdf using pandoc, but would then assume/require pandoc to be installed to build the package.  Desirable to separate dependencies needed for automatic and remote build workflow from dependencies a user actually needs.


- Looking at `knitr::pandoc`, e.g. [knitr pandoc demo](http://yihui.name/knitr/demo/pandoc/). Why the pandoc wrapper in the first place? Why not build on pander?
- Looking at `pander`. Presumably user still needs to install pandoc. (Yup, INSTALL in package root and linked to CRAN points them to Pandoc's [binaries](https://code.google.com/p/pandoc/downloads/list)).



Would it help to declare ruby in a list of languages in my notebook .travis.yml? And/or particular versions, e.g.

```yml
language: [ ruby, node_js ]
rvm: [ 2.1.1 ]
node_js: [ 0.10 ]
```


