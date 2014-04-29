---
layout: post
category: labnotebook

---





Reading a little about Flat UI design ([1](http://www.sitepoint.com/getting-started-flat-ui-design/), [2](http://en.wikipedia.org/wiki/Flat_UI_Design)). Basic concept is that users now realize they can click on things without them looking like actual three-dimensional buttons. (Along with links, checkboxes, and forms). Frequently seems to use many different [colors](http://flatuicolors.com) on a single page to bring some life back, though this might just make the design look like Windows 8 instead. I've started noticing this everwhere now that I know what it is.

Easy enough to implement in web design thanks to projects like [Flat-UI](http://designmodo.github.io/Flat-UI/). Not psyched about their colors or components myself, but rather nice to see the way they approach theming Bootstrap 3.1.1 without altering the original Bootstrap css. (Can potentially involve duplicating much of the original LESS).

I've found it easy to theme by adding a customized `variables.less` under the original (thereby overwriting the original where specified while otherwise using the original as default) and then adding my own `custom.less` at the bottom of the `bootstrap.less` file that wraps them all together.


Looking into upgrading my css to Twitter [Bootstrap 3.1.1](http://getbootstrap.com). They have replaced a simple Makefile with the rather heavy nodejs based Grunt to compile the css. No doubt there are good reasons for this, but a couple rather terrible gotchas in building from the LESS (see below).  Otherwise the upgrades are mostly straight forward with a little regex to adopt the new grid class syntax.  After swapping in my old `.less` files as described above I only needed to update the navigation bar and the accordion folding on categories to have the transition completed.  Changes are subtle, but:

- Design is now flatter, with the navbar and buttons having no 3D shading
- multiple-column layout can persist on mobile devices
- new (default) fonts
- Currently on fluid container, which can make the text a bit wide on widesreen displays.

- Removed the alternative CSS styles. Writing the solarized themes and javascript toggles was a fun exercise but more of an amatuerish trick (that didn't always reset correctly or provide any real functionality) than a mature feature
- Haven't upgraded the icons, though have added the FontAwesome4 CDN to the header so that these icons can be used anywhere.
- Cleaned out some javascript and some old templates, mostly related to search.
- enabled code toggling with `toggleR` (on pages with `page.code: yes`), e.g. [2012-06-13 post](http://www.carlboettiger.info/2012/06/13/Sethi-policy-functions.html).

**Building Bootstrap from LESS**

- Can't work with Ubuntu's `npm`, but needs a custom ppa install. [See SO question and solution](http://stackoverflow.com/questions/23251351/fail-to-install-twitter-bootstrap-node-js-dependencies-on-ubuntu)

- Even then things aren't ready to run due to crazy-stupid namespace conflict over `node`.  The only thing worse than the uniformative error above is the complete absence of any error at all, again [resolved thanks to SO](http://stackoverflow.com/questions/20937313/grunt-command-doesnt-do-anything).

After this I am able to start from scrach again and compile the less files.  Which is good, since my Makefile fails now (as it seems taht lessc is a `nodejs` creature anyway and my node environment is completely local, as I've removed the conflicting node `.deb`s installed from apt...).  However, it does mean learning to edit the Grunt file in order to make any changes to the build list (e.g. don't build the docs css), or otherwise just working around these issues.  I've taken the latter path with a new Makefile that calls Grunt to do the compile and then cleans up and deploys the output as I want, rather than making these edits to the Grunt file directly. By changing less of the boilerplate code, this should be easier to maintain for upgrades.

Developing almost anything (Ruby, R, javascript, haskell, tex, etc) seems to require it's own package mananger even though these things are packages in Ubuntu distributions.  Meanwhile ubuntu focused things all want their own ppa installed.  Maybe I should strip my sources.list back to just what ships with the base Ubuntu release since I have to extend this way instead of through `apt-get` now anyway.  Still, surely feels like this is asking for trouble.




### Github hosting

- Configuring Custom URL / Domain name.
- Configuring [Github CDN](https://github.com/blog/1715-faster-more-awesome-github-pages) with custom domain.  Not quite clear how this works, see query to [webmasters SO](http://webmasters.stackexchange.com/questions/56826/do-i-set-a-dns-a-record-for-the-new-github-pages-to-use-their-cdn/56862#56862).

* __Edit__: Relatively straight-forward to fix. Adjusted dreamhost settings for carlboettiger.info from DNS to a redirect to www.carlboettiger.info. With the CNAME already set for www.carlboettiger.info and the Github CNAME configured, the rest is automatic.  Yay for for a free and easy CDN from Github.

* Have to wonder: is it then still worth using alternative CDNs, e.g. for CSS and Javascript.  Currently MathJax, FontAwesome4 icons, JQuery, and Twitter Bootstrap Javascript are all on external CDNs.

*

### Version managing the output (as well as the source)


Checkout git by date:

```bash
git rev-list -n1 --before=2013-7-4 master | xargs git checkout
```

