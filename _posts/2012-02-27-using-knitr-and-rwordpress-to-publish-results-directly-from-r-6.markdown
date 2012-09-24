---
comments: true
date: 2012-02-27 18:31:51
layout: post
slug: using-knitr-and-rwordpress-to-publish-results-directly-from-r-6
title: Using knitr and RWordPress to publish results directly from R
redirects: [/wordpress/archives/3974, /archives/3974]
categories:
- Open Notebook Thoughts
---

One of the great things about knitr is its flexibility.  Here I set knitr up to publish to Wordpress.
I will then use RWordPress to publish the output automatically.   

I will base the wordpress format on the github-flavored markdown format.  I change the markup for output and source-code to use the nice codeblocks provided by the syntax highlighter plugin.  I also specify that images should use the html markup instead of github markup, and I will take advantage of knitr support for imgur to upload and host the image files automatically.   



```r

render_gfm()
opts_knit$set(upload = TRUE)
knit_hooks$set(output = function(x, options) paste("[code]\n", 
    x, "
```
\n", sep = ""), source = function(x, options) paste("
```r
\n", 
    x, "
```
\n", sep = ""), plot = hook_plot_html)

```




Now we write some code chunks in this markdown file:


```r

## a simple calculator
1 + 1

```

[code]
## [1] 2

```


```r

## boring random numbers
set.seed(123)
rnorm(5)

```

[code]
## [1] -0.56048 -0.23018  1.55871  0.07051  0.12929

```




We can also produce plots which are uploaded to imgur.com:


```r

library(ggplot2)
qplot(hp, mpg, data = mtcars) + geom_smooth()

```

![](http://i.imgur.com/8RasE.png)

```r

ggpcp(mtcars) + geom_line()

```

![](http://i.imgur.com/Ddzj1.png)




We can then post the result using RWordPress:


```r

require(RWordPress)
text = paste(readLines("wordpress.md"), collapse = "\n")
title = "Using knitr and RWordPress to publish results directly from R"
newPost(list(description = text, title = title), 
    publish = FALSE)

```




Above we specify publish = FALSE which will make the post upload as a draft where we can preview it.  To publish directly we could omit that command.  Giving a title is intuitive. Note that we have to read the text in and substitue newline characters for line-breaks.   

In this example I've already set my login options securely in .Rprofile, which avoids having to give them on each call to newPost, by adding a line such as:



```r

options(WordpressLogin = c(userid = "password"), 
    WordpressURL = "http://www.yourdomain.com/xmlrpc.php")

```




It would be nice to use the uploadFile function from RWordPress to host the images, but that seems to be giving me trouble at the moment. 



###  Addendum 



I've now figured out image uploading from RWordPress and also Rflickr.  Currently some [notes here](http://www.carlboettiger.info/archives/3988) (see Addendum II), though I will try to do a proper writeup on these methods soon.  



###  Addendum II 



RWordPress (and Rflickr) can be installed from the [omegahat](http://www.omegahat.org/) repository:

```r
 
install.packages("RWordPress", repos="http://www.omegahat.org/R")

```


