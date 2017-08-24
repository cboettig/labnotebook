---
layout: post
title: Solarized Colors with Twitter-Bootstrap?
categories: open-science
tags: 
- notebook-technology
- Jekyll

---


Trying out rendering my notebook using Ethan Schoonover's Solarized color scheme.  The solarized palette has been selected according to Ethan's exacting [standards](http://ethanschoonover.com/solarized#features) for contrast, symmetry, and readability.  

My site CSS is built with [Twitter-Bootstrap](http://twitter.github.com/bootstrap/), which uses LESS to generate CSS files.  Normal CSS is valid LESS code too, but doesn't have the concept of a variable.  So changing colors in CSS requires changing each and every occurance of some hex colorcode. LESS just lets you define the color as a variable, such as `@red: #dc322f;` or `@background: #fdf6e3;`, and then use `@red` or `@background` throughout the CSS.  It helps you avoid repetition in lots of other ways too, but having variables was enough to get me going.  

I mapped all the twitter-bootstrap color variables to the 16-color Solarized palette in my [variables.less](https://github.com/cboettig/labnotebook/blob/master/assets/less/variables.less) file. I wanted the ability to render the site with either the dark or light background schemes, which required customizing quite a few of the other Twitter Bootstrap LESS files -- it seems Bootstrap was build with exclusively light backgrounds in mind.  Solarized accent colors are chosen to provide identical contrast on either background, but the base gray colors are slightly different for light and dark.  The Solarized palette indicates which colors are designed for body text, comments and secondary text, background highlights, and optionally, for emphasized content, as described in the [usage and development documentation](http://ethanschoonover.com/solarized#usage-development).  Overall it's nice to have a new look to the site, but it has raised a couple questions on which I'd be happy to hear more opinions.   

## Questions

* Links in blue? yellow? Or a more subtle base color?
* Light or dark background prefered?
* Should code blocks be rendered in the inverse background scheme, or a matching one?
* Do the navbar colors work? should they come from the inverse scheme? 
* Would a stronger contrast in colors be more readable? 
* other reactions?

Here are a few screenshots in the different themes, varying the codeblock colors as well:

![](http://farm9.staticflickr.com/8182/8049035809_cbd35a6a8f_n.jpg)

![](http://farm9.staticflickr.com/8455/8049041504_ef37c20a8d_n.jpg) 

![](http://farm9.staticflickr.com/8311/8049041556_c6c454b7b1_n.jpg)

![](http://farm9.staticflickr.com/8315/8049041400_8de7a9ba94_n.jpg) 



### Challenges 

* My black icons in the footer and lab-notebook homepage do not render well in the dark theme.  
* Button text doesn't render well in the dark theme
* My flickr-hosted figures render with a white background even if I generate transparent-background pngs, since flickr converts them to jpg.

## Updates

* I have added a little javascript to allow the user to toggle the theme between dark and light (see [switch-css.js](https://github.com/cboettig/labnotebook/blob/master/assets/js/switch-css.js))
