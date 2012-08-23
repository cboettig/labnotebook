## Jekyll Labnotebook Plugins

* Author: Carl Boettiger, <cboettig@gmail.com>
* Released under the MIT license.

**Disclaimer**: These plugins are under active development for use
in my research lab notebook, which is built on Jekyll ([Visit the
notebook sourcecode on github](https://github.com/cboettig/labnotebook)).
Consequently the scripts are built for my custom objectives rather than
providing a general Liquid/Jekyll interface to the relevant APIs.  Still,
anyone should feel free to customize the scripts for their own site and
file issues and bugs.  Most of the settings are best adjusted at in the
Ruby code to adjust output appearance, etc.  As I get better with Ruby
and Liquid I may roll these up as proper generic plugins.


For planned extensions and work-in-progress, see [Issues](https://github.com/cboettig/jekyll-labnotebook-plugins/issues)

## Installation

Install the necessary gem dependencies first.  These dependencies mean that you'll have to compile/build the Jekyll site locally, as these are not available on the Jekyll version running automatically on Github.

    sudo gem install octokit feedzirra nokogiri redcarpet2

To install the plugins simply put them in a folder named `_plugins` in your
Jekyll blog's root directory.  

## Examples

List recent open issues on a given repo:

    {% octokit_issues pdg_control%}

List recent commits on a given repo:

    {% octokit_commits pdg_control%}

Add twitter feed for given user

    {% twitter_feed cboettig%} 

Add github feed

    {% github_feed %}

