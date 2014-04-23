---
layout: post
category: labnotebook
published: false

---





Flat UI design ([1](http://www.sitepoint.com/getting-started-flat-ui-design/), [2](http://en.wikipedia.org/wiki/Flat_UI_Design)). Basic concept is that users now realize they can click on things without them looking like actual three-dimensional buttons. (Along with links, checkboxes, and forms). Frequently seems to use many different [colors](http://flatuicolors.com) on a single page to bring some life back, though this might just make the design look like Windows 8 instead.

Easy enough to implement in web design thanks to projects like [Flat-UI](http://designmodo.github.io/Flat-UI/). Not psyched about their colors or components myself, but rather nice to see the way they approach theming Bootstrap 3.1.1 without altering the original Bootstrap css. (Rather obvious in retrospect, but oh well).


Looking into upgrading my css to Twitter [Bootstrap 3.1.1](http://getbootstrap.com). They have replaced a simple Makefile with the rather heavy nodejs based Grunt to compile the css. No doubt there are good reasons for this, but a couple rather terrible gotchas


**Building Bootstrap from LESS**

- Can't work with Ubuntu's `npm`, but needs a custom ppa install. [See SO question and solution](http://stackoverflow.com/questions/23251351/fail-to-install-twitter-bootstrap-node-js-dependencies-on-ubuntu)

- Even then things aren't ready to run due to crazy-stupid namespace conflict over `node`.  The only thing worse than the uniformative error above is the complete absence of any error at all, again [resolved thanks to SO](http://stackoverflow.com/questions/20937313/grunt-command-doesnt-do-anything).

After this I am able to start from scrach again and compile the less files.  Which is good, since my Makefile fails now (as it seems taht lessc is a `nodejs` creature anyway and my node environment is completely local, as I've removed the conflicting node `.deb`s installed from apt...).

Developing almost anything (Ruby, R, javascript, haskell, tex, etc) seems to require it's own package mananger even though these things are packages in Ubuntu distributions.  Meanwhile ubuntu focused things all want their own ppa installed.  Maybe I should strip my sources.list back to just what ships with the base Ubuntu release since I have to extend this way instead of through `apt-get` now anyway.  Still, surely feels like this is asking for trouble.


