---
comments: true
date: 2012-01-31 17:58:08
layout: post
slug: journey-to-freedom-a-codes-tale-of-open-source-license-migration
title: Journey to freedom - a code's tale of open source license migration
redirects: [/wordpress/archives/3765, /archives/3765]
categories:
- open-science
tags: 
- blog
---

My software wants to be free. It wants to be seen and used and loved by as many people as possible. When first it heard of open source licenses, it set sail to join the company of great software in the promised land, but finding true freedom has been a tortured journey.


### In the clutches of the GPL


Created and defended by the [Free Software Foundation](http://www.fsf.org/) and used by such venerable institutions as the Linux Kernel, the gcc compiler, and the R statistical environment, the [GNU's General Public License](http://en.wikipedia.org/wiki/GNU_General_Public_License) seemed like a gold standard to call home. Many of my codes quickly migrated to this beacon of light, while others, already making use of other GPL licensed software, seemed compelled to follow by it's viral share-alike clauses. But my code wasn't free. It couldn't play nicely with users from the pantheon of other open source licenses, upsetting free software developers and university tech transfer offices alike. It was scorned by open science advocates and repositories. And when it wanted to leave and migrate to a more free and permissive license, it felt trapped.

By now the software was written as an R package (combining C source code and R functions), depended on several R packages, and even compiled against the [GSL C library](http://www.gnu.org/software/gsl/), all GPL licensed software. Surely it was stuck?

Only after close examination did the package realize that it could escape. It's not a derivative work. It's not distributing the other R packages or R itself. That software have to be installed separately -- it is only **dynamically linked** ((called at runtime, not compiled into the binary libraries of my package)) to my package. The case is less obvious for the dependency of the C library on the GSL code, since this must be compiled to run. If the C functions provided by the GSL are compiled statically, they are pulled from their source and crammed into the binary next to my own code -- making a derivative work that doesn't need the GSL libraries installed separately to run. Fortunately that is not the case, these functions are also dynamically linked, and my code is free to migrate.


### BSD: still incompatible?


Fleeing the convoluted and tortured shore of GPL, my code happily reached the land of [BSD](http://en.wikipedia.org/wiki/BSD_licenses). In it's forth iteration as FreeBSD, with only two simple clauses, it seemed anything was possible. The only thing it does require are that the license always be distributed with the source code or binaries of the software. This makes it difficult to apply to repositories that also archive data -- facts about the world owned under anyone's copyright -- and other non-code material such as documentation that may be found in an R package or an academic data repository. For this reason, the Dryad repository objects to that little clause of redistributing the FreeBSD license, and insists on public domain declaration provided by the [CC0](http://creativecommons.org/publicdomain/zero/1.0) license.


### CC0, free at last?


Ah, so we arrive at the public domain, or as [close as I can legally get](http://creativecommons.org/publicdomain/zero/1.0/legalcode.txt). While this seems to be the ultimate freedom my code has long sought, it finds itself rather lonely on these foreign shores. The Open Source Initiative doesn't yet recognize it, which means it doesn't meet the "open source license" requirements of academic journals like [PLoS Computational Biology](http://www.ploscompbiol.org/static/guidelines.action) or academic conferences like [Bioinformatics Open Source Conference](http://www.open-bio.org/wiki/BOSC_2012) or iEvoBio. It has not yet been used for R packages on the CRAN repository (see below), and would require using R's custom license file mechanism rather than a simple LICENSE: CC0 line in the package meta-data. It does get a mention for being GPL compatible by the FSF ((i.e. you can redistribute it under the GPL)), but the license that isn't a license needs more support. Following their guidelines, I've written the Open Software Initiative hoping it will gain that recognition.




## Will OSI adopt CC0?




> Hello,

I would like to submit the Creative Commons zero license for consideration.  I am new to this list, forgive me if it has already been considered.
I understand that this license [has been considered](http://www.gnu.org/licenses/license-list.html#CC0) GPL compatible by the FSF with this [recommended format](http://wiki.creativecommons.org/CC0_FAQ#May_I_apply_CC0_to_computer_software.3F_If_so.2C_is_there_a_recommended_implementation.3F).

Submission type: Approval
License Name: Creative Commons Zero, CC0
Category: Licenses that are popular and widely used or with strong communities
The [legal code as plain text](http://creativecommons.org/publicdomain/zero/1.0/legalcode.txt).  

The scientific community is increasingly embracing this option as the most open and compatible license.  It is required by scientific data repositories (that also archive scientific software, with cite-able DOIs) such as [Dryad](http://datadryad.org/depositing#whycc0).

I feel it is important that this license achieve recognition by the Open Source initiative, as certain scientific journals & conferences permit only OSI recognized licenses, (e.g. PLoS Computational Biology [requirements](http://www.ploscompbiol.org/static/guidelines.action) or Bioinformatics open source conference [requirements](http://www.open-bio.org/wiki/BOSC_2012)).






## Licensing in R


R uses a simple but powerful license format in the DESCRIPTION files of all packages, which contain the essential meta-data for the package.  Common FOSS licenses are recognized automatically (including version numbers or version inequalities).  Since CC0 doesn't (yet) make this list, we can use a custom license file where we provide the full plaintext CC0 license in the file LICENSE and write "file LICENSE" in the DESCRIPTION ([my example](https://github.com/cboettig/fluctuationDomains)).  

We can also see the frequency with which various licenses are used on the R repository, CRAN, with a few lines of code: 

```R

p = available.packages(contrib.
url("http://cran.r-project.org"), type = "source")
sort(table(p[, "License"]))

```

