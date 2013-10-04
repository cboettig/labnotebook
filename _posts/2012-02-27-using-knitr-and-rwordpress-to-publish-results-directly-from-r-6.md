---
comments: true
date: 2012-02-27 18:31:51
layout: post
slug: using-knitr-and-rwordpress-to-publish-results-directly-from-r-6
title: Using knitr and RWordPress to publish results directly from R
redirects: [/wordpress/archives/3974, /archives/3974]
categories:
- open-science
---

**Update**: The original [source file](https://raw.github.com/cboettig/sandbox/b71f7f359164b1ff3b9609d5ded2324fafdc14b6/wordpress_knit_.md) for this post, generates [this output file](https://raw.github.com/cboettig/sandbox/b71f7f359164b1ff3b9609d5ded2324fafdc14b6/wordpress.md) formatted for wordpress.  The source file has been knitted for markdown formatting so this post displays in Jekyll. The rendered post relies on Wordpress shortcodes, as raw the output file shows above. The [markdown-based rendering](https://github.com/cboettig/sandbox/blob/b71f7f359164b1ff3b9609d5ded2324fafdc14b6/wordpress.md) shows the images and the shortcodes wordpress uses for codeblocks.  

-------------------------------------------

One of the great things about knitr is its flexibility.  Here I set knitr up to publish to Wordpress.
I will then use RWordPress to publish the output automatically.   

I will base the wordpress format on the github-flavored markdown format.  I change the markup for output and source-code to use the nice codeblocks provided by the syntax highlighter plugin.  I also specify that images should use the html markup instead of github markup, and I will take advantage of knitr support for imgur to upload and host the image files automatically.   



```r
render_gfm()
options(width = 30)
opts_knit$set(upload = TRUE)
knit_hooks$set(output = function(x, options) paste("[code]\n", x, 
    "[/code]\n", sep = ""), source = function(x, options) paste("[code lang='r']\n", 
    x, "[/code]\n", sep = ""), plot = hook_plot_html)
```


Now we write some code chunks in this markdown file:


```r
## a simple calculator
1 + 1
```

```
## [1] 2
```

```r
## boring random numbers
set.seed(123)
rnorm(5)
```

```
## [1] -0.56048 -0.23018  1.55871  0.07051  0.12929
```


We can also produce plots which are uploaded to imgur.com:


```r
library(ggplot2)
qplot(hp, mpg, data = mtcars) + geom_smooth()
```

```r
ggpcp(mtcars) + geom_line()
```




We can then post the result using RWordPress:


```r
require(RWordPress)
text = paste(readLines("wordpress.md"), collapse = "\n")
title = "Using knitr and RWordPress to publish results directly from R"
newPost(list(description = text, title = title), publish = FALSE)
```


Above we specify `publish = FALSE` which will make the post upload as a draft where we can preview it.  To publish directly we could omit that command.  Giving a title is intuitive. Note that we have to read the text in and substitue newline characters for line-breaks.   

Note that this requires setting the login options securely in .Rprofile, for example:

```r
options(WordpressLogin = c(userid = "password"), WordpressURL = "http://www.yourdomain.com/xmlrpc.php")
```



It would be nice to use the uploadFile function from RWordPress to host the images, but that seems to be giving me trouble at the moment.  



###  Addendum 

I've now figured out image uploading from RWordPress and also Rflickr.  Currently some [notes here](http://www.carlboettiger.info/archives/3988) (see Addendum II), though I will try to do a proper writeup on these methods soon.  



###  Addendum II 

RWordPress (and Rflickr) can be installed from the [omegahat](http://www.omegahat.org/) repository:

```r
install.packages("RWordPress", repos="http://www.omegahat.org/R")
```


