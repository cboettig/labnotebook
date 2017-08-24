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


![]( http://farm8.staticflickr.com/7184/6793394960_94c5a5b017_o.png )



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
