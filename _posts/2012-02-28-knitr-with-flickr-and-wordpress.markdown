---
comments: true
date: 2012-02-28 14:59:21
layout: post
slug: knitr-with-flickr-and-wordpress
title: Knitr with flickr and wordpress
redirects: [/wordpress/archives/3988, /archives/3988]
categories:
- open-science
---

It's amazing how nice it is to work with well-developed software.  It took me about 20 minutes to extend Yuhui's interface to allow me to upload images through flickr instead of imgur, and embed them into a wordpress blog using the shortcode from the flickr gallery plugin.  

To do this, I just modified the hook used by the markdown format.  First, I define a quick R function that uploads to flickr and returns the flickr identifier number.  For the moment this is just calling[ a command-line flickr uploader](http://search.cpan.org/~cpb/Flickr-Upload-1.32/flickr_upload), though it should be straight-forward to replace this with something like [Rflickr](http://www.omegahat.org/Rflickr/).  




```r

flickr <- function(file, 
    tags = "", description = "", 
    public = TRUE) {
    out <- system(paste("flickr_upload --tag=\"", 
        tags, " \" --description=\"", 
        description, "\"", 
        " --public ", as.integer(public), 
        file), intern = TRUE)
    gsub(".*ids=(\\d+)", 
        "\\1", out[3])
}

```




Once we have such an uploading function, it's super simple to wrap into knitr.  I let my function be triggered by the same "upload" option that Yuhui introduced for imgur, but instead call the flickr function above,


```r

.flickr.url = function(x) {
    file = paste(x, collapse = ".")
    if (opts_knit$get("upload")) {
        flickr(file)
    } else file
}

```




Lastly I define the function hook to run the upload and return the shortcode:

```r

hook_plot_flickr = function(x, 
    options) {
    sprintf("[flickr]%s[/flickr]", 
        .flickr.url(x))
}

```





I can then define a wordpress rendering environment by mapping the hooks to my choices.  

```r

render_wordpress <- function() {
    render_gfm()
    options(width = 30)
    opts_knit$set(upload = TRUE)
    output = function(x, 
        options) paste("[ code]\n", 
        x, "[ /code]\n", 
        sep = "")
    warning = function(x, 
        options) paste("[ code]\n", 
        x, "[ /code]\n", 
        sep = "")
    message = function(x, 
        options) paste("[ code]\n", 
        x, "[ /code]\n", 
        sep = "")
    inline = function(x, 
        options) paste("<pre>", 
        x, "</pre>", sep = "")
    error = function(x, 
        options) paste("[ code]\n", 
        x, "[ /code]\n", 
        sep = "")
    source = function(x, 
        options) paste("[ code lang='r']\n", 
        x, "[ /code]\n", 
        sep = "")
    knit_hooks$set(output = output, 
        warning = warning, 
        message = message, 
        inline = inline, 
        error = error, 
        source = source, 
        plot = hook_plot_flickr)
}

```




Note that the rendering sets a custom 30 character width that fits my theme better. Now simply adding the call to render_wordpress in the header of my documents will render this in wordpress format.  If you're reading this on wordpress, it was already in the header. Any figures will embed as flickr shortcode:


```r

library(ggplot2)
qplot(hp, mpg, 
    data = mtcars) + geom_smooth()

```


![](data:image/png;base64,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)



It would be nicer to have built this around flickR, and provide the urls so that the image can be used without the wordpress flickr shortcode. But for now, the real point is that it's intuitive to extend knitr to this very customized format, specific to my platform, my plugins, and my shortcodes, with minimal effort.  All thanks to Yuhui's very nice implementation of knitr.   



###  Addendum 


If we'd rather upload the images to wordpress itself (seems sensible), this is also straight forward thanks to Duncan's RWordPress package on [Omegahat](http://www.omegahat.org/). Writing the hooks would look like this:


```R

.wordpress.url = function(x) {
  require(RWordPress)
  file = paste(x, collapse = '.')
  if (opts_knit$get('upload')) {
            fileUpload(file)$url
      } else file
}

```

Note that RWordPress will look for the login credentials defined in "options", i.e. put something like this in your .Rprofile.  

```R

options(WordPressLogin = c(userid = "password"),
    WordPressURL = "http://www.yourdomain.com/xmlrpc.php")

```


We then just define a hook based on the hook_plot_html that uses the Wordpress URL.  

```r

.hook_plot_wordpress = function(x, options) {
a = options$fig.align
  sprintf('<img src="%s" class="plot" %s/>\n', .wordpress.url(x),
          switch(a,
                 default = '',
                 left = 'style="float: left"',
                 right = 'style="float: right"',
                 center = 'style="margin: auto; display: block"'))
}

```

Put this hook in the render function instead/or as an option, and we're good to go.  




###  Addendum II 


knitr now supports additional uploading protocols out of the box.  For instance, uploading to wordpress just requires a call to knitr options specifying the upload function:


```r

opts_knit$set(upload.fun = function(file){
   library(RWordPress) 
   uploadFile(file)$url
  })

```


We could likewise specify the flickr function there, etc.  Note that I don't need to worry about the "paste" or "else" conditions either, that's all handled automatically now.  Just specify an upload function and we're good to go.  

Minor you (I) might think the one-line namespace call could be used instead of loading the library:

```R

RWordPress::uploadFile(file)$url

```

but it appears you'd be wrong.  
