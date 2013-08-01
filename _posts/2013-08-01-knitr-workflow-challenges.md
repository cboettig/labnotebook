---
layout: post
published: false

---

* Bash away in an R terminal, paste useful bits into an R script...
* Write manuscript, including only figures, tables, and inline values returned from R.  



Start off writing a `.Rmd` file, intermixing notes to myself and code chunks.  Chunks break up the code into conceptual elements, markdown gives me a more expressive way to write notes than comment lines do.  Output figures, tables, and inline values inserted.  So far so good.  I version manage this creature in git/Github.  Great, now I have a trackable history of what is going on, and all is well:

1. Document my thinking and code as I go along on a single file scratch-pad
2. Version-stamped history of what I put in and what I got out on each step of the way
3. Rich markup with equations, figures, tables, embedded.  


### Two kinds of trouble.  

1. As I go along, the .Rmd files starts getting too big and cluttered to easily follow the big picture of what I'm trying to do.  
2. Before long, my investigation branches.  Having followed one `.Rmd` script to some interesting results, I start a new `.Rmd` script representing a new line of investigation.  This new direction will nevertheless want to re-use large amounts of code from the first file.  

Solution(?)

I start abstracting tasks performed in chunks into functions, so I can re-use these things elsewhere, loop over them, and document them carefully somewhere I can reference that won't be in the way of what I'm thinking. I start to move thse functions into `R/` directory of an R package structure, documenting with Roxygen. I write unit tests for these functions (in `inst/tests`) to have quick tests to check their sanity without running my big scripts (recent habit).  The package structure helps me 

* Reuse the same code between two analyses without copy-paste or getting our of sync
* Document complicated algorithms outside of my working scripts
* Test complicated algorithms outside of my working scripts (`devtools::check` and/or unit tests)
* Manage dependencies on other packages (DESCRIPTION, NAMESPACE), including other projects of mine


### Trouble.  

This runs into trouble in several ways.  

1. Code I want to reuse across blocks but do not want to write as a function, document, or test.  

Perhaps this category doesn't exist, except in my laziness.  

2. Separate files can frustrate reproducibility of a given commit.  

More minor and relatively easy to fix.  

3. Synthesizing results into a manuscript

Here's where we hit the real challenge.  

#### Reproducibility challenges

However, the package structure can also start to foil the reproduciblity of the `.Rmd` scripts where my analysis lives.  As I change these functions, the `.Rmd` file can give different results despite being unchanged.  (Or fail to reflect changes because it is caching chunks and does not recognize the function definitions have changed underneath it).  Git provides a solution to this: since the `.Rmd` file lives in the same git repository (`inst/examples`) as the package, I can make sure the whole repository matches the hash of the `.Rmd` file:  `install_github("packagename", "cboettig", "hash")`.  

This solution is not fail-safe: the installed version, the potentially uncommitted (but possibly installed) version of the R functions in the working directory, and the R functions present at the commit of the `.Rmd` file (and thus matching the hash) could all be different.  If we commit and install before every `knit`, we can avoid these potential errors (at the cost of some computational overhead), restoring reproducibility to the chain.  


More trouble: Before long, my investigation branches into a new direction.  

Now big long chunks shrink into single function calls showing an abstract version 




