---
layout: post
category: ecology
tags: 
- warning-signals
- prosecutor
- delayed-release
- my-publications

---

Two years ago, I scribbled an entry into my notebook entitled
[Wrong Picture, Wrong Model: Why warning signals don't look like rare
events](http://carlboettiger.info/2010/10/25/wrong-picture-wrong-model-why-warning-signals-dont-look-like-rare-events.html).
Months later I made some off-hand remark to Alan (my Ph.D. mentor)
about how transitions found in historical records, such as the Climate
examples in <span class="showtooltip" title="Dakos V, Scheffer M, van Nes E, Brovkin V, Petoukhov V and Held H
(2008). Slowing Down as an Early Warning Signal For Abrupt
Climate Change. _Proceedings of The National Academy of
Sciences_, *105*. ISSN 0027-8424, 
http://dx.doi.org/10.1073/pnas.0802430105."><a href="http://dx.doi.org/10.1073/pnas.0802430105" rel="http://purl.org/spar/cito/critiques" >Dakos _et. al._ (2008)</a></span>, could actually be selecting
for stochastic transitions, and this selection process might make them
look like traditional warning signals -- i.e. mining historical cases
could actually lead to false positives rather than useful benchmarks.
Alan encouraged me to demonstrate this; and when I had, to write it up.
He also suggested a clever title, and with his advice the offhand
remark became the recently published paper, the Prosecutor's Fallacy,
(<span class="showtooltip" title="Boettiger C and Hastings A (2012). Early Warning Signals And The
Prosecutor'S Fallacy. _Proceedings of The Royal Society B:
Biological Sciences_, *279*. ISSN 0962-8452, 
http://dx.doi.org/10.1098/rspb.2012.2085."><a href="http://dx.doi.org/10.1098/rspb.2012.2085" rel="http://purl.org/spar/cito/discusses" >Boettiger & Hastings, 2012</a></span>).

In the review process, another question came up as to whether the
stationary point (minumum of the potential) can be accurately
identified successfully in this situation.  Instead of some
handwaving statement about things we'd tried, I was able to
point to the spot in my notes where I'd this same question;
a post the following day entitled [Correcting for the mean
dynamics](http://carlboettiger.info/2010/10/26/correcting-for-the-mean-dynamics.html).
A win for open notebooks.  

Most of the work for this was done over a short period of time in the
[`prosecutor`](https://github.com/cboettig/earlywarning/tree/prosecutor/)
branch of my [`earlywarning`](https://github.com/cboettig/earlywarning/) 
repository, often with little more than passing reference in my notebook entries.
At the beginning I didn't think of this as a separate project, hence 
the lack of a separate repository, notebook tags, etc.  A branch seemed like
a convenient way to manage the diverging code-base.  The primary scripts
for the analysis presented can be found there, along with the data files:

* [Figure 1](https://github.com/cboettig/earlywarning/blob/013805c706eecc7d1d14c3f83017369ecab76a5b/inst/examples/Figure1.md)
* [Figure 2](https://github.com/cboettig/earlywarning/blob/9ff8d5c17fa1ae54a7b1d8672c5f33981aed0f1c/inst/examples/Figure2.md)
* [data for the conditional_samples](https://raw.github.com/cboettig/earlywarning/33586d816918bc4261b864fd0e0a2e854c62802d/inst/examples/Figure2_dat.csv) [data for the null_distribution](https://raw.github.com/cboettig/earlywarning/33586d816918bc4261b864fd0e0a2e854c62802d/inst/examples/Figure2_nulldat.csv)
* [Figure 3](https://github.com/cboettig/earlywarning/blob/b938c383521bafa4e91cb2eda020f50f11f41509/inst/examples/Figure3.Rmd)
* [data for the conditional_samples](https://raw.github.com/cboettig/earlywarning/33586d816918bc4261b864fd0e0a2e854c62802d/inst/examples/Figure3_dat.csv) [data for the null_distribution](https://raw.github.com/cboettig/earlywarning/33586d816918bc4261b864fd0e0a2e854c62802d/inst/examples/Figure3_nulldat.csv)


Now that it is it's own publication, perhaps I should move this into a separate repository?


**Historical Note**: A draft of this post was started on 2012-09-19 to accompany
the apperance of the paper in PRSB, but never finished.  As I have had occassion
to revisit this project recently, I have taken the opportunity today to flush
out the rest of this post, as I had intended it to be.  Some links and features
of the notebook may thus be newer than 2012-09-19.  See the sidebar for the
post revision history and modification timestamps.  


## References


- C. Boettiger, A. Hastings,   (2012) Early Warning Signals And The Prosecutor'S Fallacy.  *Proceedings of The Royal Society B: Biological Sciences*  **279**  [10.1098/rspb.2012.2085](http://dx.doi.org/10.1098/rspb.2012.2085)
- V. Dakos, M. Scheffer, E. H. van Nes, V. Brovkin, V. Petoukhov, H. Held,   (2008) Slowing Down as an Early Warning Signal For Abrupt Climate Change.  *Proceedings of The National Academy of Sciences*  **105**  [10.1073/pnas.0802430105](http://dx.doi.org/10.1073/pnas.0802430105)


