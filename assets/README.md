Site Assets: Controlling site appearance
========================================

Javascript
----------

Located in the `js` directory are the various javascript libraries and scripts used in rendering this site.  All core features work without the use of javascript, so that viewers relying on a browser in which javascript is absent or disabled recieve a largely similar experience.  This practice also ensures that all content is accessible to machine reading and processing.  Includes javascript from twitter-bootstrap, some for Jekyll plugins and some custom scripts.  Details in the README.md file inside that directory.  

css
---

Files in the `css` directory are generated from LESS files built on top of Twitter Bootstrap.  See the `less` directory for more. Generate using the `Makefile` in the `assets` directory.  

less
----

Files for generating the CSS. Includes all the original twitter-bootstrap LESS files which are uncustomized, allowing for more seamless updating with the bootstrap library.  Generic customizations, mostly for unique element classes, are provided in `custom.less`.  Theme/coloring customization is written into `light-variables.less` and `light.less` (and likewise with `dark.less`, etc), which are analagous to `bootstrap.less` and `bootstrap-variables.less` files that these files replace.  

img
---

Images and icons used in the site.  Largely depricated as most icons are provided as CSS sprites through `FontAwesome`.  

Makefile
--------

Generates the CSS files from `less`.  



Content
=======

Files and directories related to content, rather than appearance, of the notebook

files
-----

Mostly downloadable files linked from various posts (pdfs).  Some are embedded into posts directly.  This directory is also home to content that change frequently, such as my C.V.  More permanent files would be better hosted externally.  

data
----

A directory for miscellaneous data files not provided elsewhere.  Mostly a scratchpad, as proper data files are found in more appropriate locations on Github, Figshare, Dryad, etc.  

figures
-------

For a while I explored figure hosting directly through my site rather than the external service such as flickr.  I generate far more images than ever appear in the notebook, as most graphs I run upload a copy automatically as a way of generating a figure log that I later link.  This directory quickly got very large and is not version managed.  Remains mostly for that historical content.  




