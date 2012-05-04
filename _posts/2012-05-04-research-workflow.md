---
layout: post
title: My research workflow, based on Github
category: OpenScience
---

When I begin a new research project, I create a repository for that project in [Github](https://github.com/cboettig). 
Projects that build substantially on earlier work of mine may start as a `clone` 
of one of my existing projects. New directions in an existing project will instead
begin as a branch within that repository, that may merge or be split out.  

Each repository is organized as an R package, with the basic directories `R/`, `src/`, `man/`
`data/`, `inst/examples/` and `inst/docs/`, and the metadata file `DESCRIPTION` providing
the R package metadata such as author and dependencies.  `README.md` files provide 
descriptions of the directories.  The package is installable directly from R through
github.  The R package structure nicely handles software dependencies, documentation, and 
metadata in a consistent and portable structure: 

- `R/` provides R functions representing commonly used analyses. 
- `src/` provides C source-code for any R functions that are too slow by themselves.
- `man/` contains automatically generated documentation of these functions from the 
Roxygen documentation included in the function files. 
- `data/` contains small data files.  Version management is not ideal for large data files.
Instead, a README file contains metadata and links to data stored on a seperate webserver.  
The README file can be version managed within git and nicely displayed on Github.
- `inst/examples/` contains each of my investigations.  These are saved as 
[knitr](http://yihui.name/knitr) files, which allow me to mix markdown text describing
what I am doing with each code block.  Knitr runs this code and assembles
the results in a markdown format that displays the code, images, and supporting text nicely
together. Long blocks of code become abstracted as functions and move into the `R` directory,
where they recieve formal documentation and can be more easily used in later examples. 
- Sections from mature examples can be moved into `inst/doc/` as another markdown file that
will eventually become a publication associated with this work.  The paper acts a Sweave-style
dynamic document that still contains the code relevant to re-create the examples, though options
can now hide that code from the final display. In addition to the markdown format for online
viewing, `inst/doc/` includes utilities from knitr and [pandoc](http://johnmacfarlane.net/pandoc/)
which handle citations and can convert this markdown file into a LaTeX or Word document for 
journal submission.


Github maintains and displays the version history of the workflow, making it easy to compare 
earlier versions of the manuscript, and track the history of the results to even before they
reach the manuscript in `inst/examples/`.  Contributions of collaborators using Github are easily
tracked and displayed as well.  Github can provide version-stable links that will point to 
any element at a fixed point in the process, and dynamic links that always point to the most
recent version (or even particular line of code in a version). 

Github's issues tracker provides a convenient platform to record, sort, and prioritize issues
that need to be addressed and directions for future exploration. Issues can be submitted by anyone.  



The R package structure provides a standardized and 
portable container for the project suitable for combining functions, scripts, documentation, 
and examples, and also handling software dependencies and versions.  



