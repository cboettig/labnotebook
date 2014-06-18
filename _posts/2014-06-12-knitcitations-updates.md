---
layout: post
category: open-science
tags:
  - knitcitations

---



Used some down-time while traveling to hammer out a long overdue update to my [knitcitations](https://github.com/cboettig/knitcitations) package.

My first task inovled a backwards-compatible update fixing a few minor issues (see [NEWS](https://github.com/cboettig/knitcitations/blob/master/NEWS)) and providing pandoc style inline citations [`v0.6-2`](https://github.com/cboettig/knitcitations/releases/tag/v0.6-2), on CRAN.

I followed this with a ground-up rewrite, as I summarize in NEWS:

## v1.0-1

This version is a ground-up rewrite of knitcitations, providing a more powerful interface while also streamlining the back end, mostly by relying more on external libraries for knitty gritty. While an effort has been made to preserve the most common uses, some lesser-used functions or function arguments have been significantly altered or removed. Bug reports greatly appreciated.

- `citet`/`citep` now accept more options.  In addition to the four previously supported options (DOI, URL, bibentry or bibkey (of a previously cited work)), these now accept a plain text query (used in a CrossRef Search), or a path to a PDF file (which attempts metadata extraction).

- Citation key generation is now handled internally, and cannot be configured just by providing a named argument to `citet`/`citep`.

- The `cite` function is replaced by `bib_metadata`.  This function takes any argument to `citet`/`citep` as before (including the new arguments), see docs.

- Linked inline citations now use the configuration: `cite_options(style="markdown", hyperlink="to.doc")` provides a link to the DOI or URL of the document, using markdown format.

- Support for cito and tooltip have been removed.  These may be restored at a later date.  (The earlier implementation did not appropriately abstract the use of these features from the style/formatting of printing the citation, making generalization hard.

- `bibliography` now includes CSL support directly for entries with a DOI using the `style=` argument.  No need to provide a CSL file itself, just the name of the journal (or rather, the name of the corresponding csl file: full journal name, all lower case, spaces as dashes). See https://github.com/cboettig/knitcitations/issues/38

- `bibliography` formatting has otherwise been completely rewritten, and no longer uses `print_markdown`, `print_html`, and `print_rdfa` methods.  rdfa is no longer available, and other formats are controlled through `cite_options`.  For formal publication pandoc mode is recommended instead of `bibliography`.

This version was developed on a separate branch (`v1`), and has only just been merged back into master.  CRAN doesn't like getting multiple updates in the same month or so, but hopefully waiting a bit longer will give users and I a chance to shake out bugs anway. Meanwhile grab it from github with:

```r
devtools::install_github("cboettig/knitcitations@v1")
```

You can see this package in use, for instance, in providing dynamic citations for my `RNeXML` [mansucript draft](https://github.com/ropensci/RNeXML/blob/7a6be7bd0106bc91a5586ee614b3cf5249627692/manuscripts/manuscript.Rmd).




