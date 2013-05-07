# Title: git_mod.rb
# Author: Carl Boettiger, @cboettig
# Licence: MIT
# Description: A custom filter to return the date that git has for the page modification time 
# 
# REQUIREMENTS: Uses `path` variable set in the base_name.rb plugin
#
# Example use: 
#
# {{ post.path | prepend:'_posts/' | git_modified }}
# 

require 'chronic'
require 'git'

module Jekyll
  module GitModFilter
    def git_modified(input)
      g = Git.open("/home/cboettig/Documents/labnotebook")
      g.log(1).object("vita.html").first.date
    end
  end
end
Liquid::Template.register_filter(Jekyll::GitModFilter)
