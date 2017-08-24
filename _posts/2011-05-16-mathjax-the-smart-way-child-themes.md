---
comments: true
date: 2011-05-16 12:54:05
layout: post
slug: mathjax-the-smart-way-child-themes
title: 'MathJax the smart way: Child Themes'
redirects: [/wordpress/archives/1697, /archives/1697]
categories:
- open-science
tags:
- notebook-technology
---

Adding mathjax by modifying the header.php file in my wordpress theme, [as recommended by MathJax website](http://www.mathjax.org/docs/1.1/platforms/wordpress.html), isn't stable to upgrades of the theme, which simply replace the header.php file with a fresh version.  The "correct" way to do this is using [child themes,](http://codex.wordpress.org/Child_Themes) which are pretty simple, even though this got me writing my first php functions.



	
  * Create a directory in wp-content/themes with the desired name of the new theme.

	
  * Create a file style.css as follows:



```css


/*
Theme Name: carlboettiger
Theme URI: http://carlboettiger.info
Description: A customization (child theme) of The Erudite
Version: 2.7.7-1
Author: Carl Boettiger <cboettig@gmail.com>
Author URI: http://carlboettiger.info
Template: the-erudite
Tags: white, dark, one-column, fixed-width, theme-options, editor-style, translation-ready, custom-menu
License: GPL v2
*/
@import url("../the-erudite/style.css")

```


The stuff in the C-style comments is functional.  The only required lines are theme name and template.  template tells the style file to copy everything from the template theme (which will be updated whenever the template is updated).  The @import command imports the style file of the template theme.  Any changes to the style can be specified in CSS below. We won't be changing anything on the style sheet.

What we want to do is change the header.  We do this the clever way using action hooks. I used [this great reference](http://themeshaper.com/2009/05/25/action-hooks-wordpress-child-themes/) to get a handle on them, and the [Wordpress child themes guide](http://codex.wordpress.org/Child_Themes) to see how functions.php works.



	
  * Create a second file in the theme called functions.php:



```php


<?php
/*
This file is part of carlboettiger child theme to The Erudite
This uses action hooks to add the mathjax code extending the theme
*/

function mathjax_cdn() {
 ?>
 <script type="text/javascript"
 src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
 </script>
 <?php
}
add_action('wp_head', 'mathjax_cdn');
?>


```


This creates a function that inserts the HTML code for MathJax into the header. Note that we create a php function, break out of php to use the HTML code, and then return to php to close the function.  The add_action uses action hooks to insert our function into the header, specified where wp_head appears (check it out in header.php).

	
  * Activate the theme carlboettiger from the dashboard and we're good to go.


