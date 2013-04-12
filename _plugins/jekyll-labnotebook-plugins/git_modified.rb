# Title: git_modified.rb
# Author: Carl Boettiger, @cboettig
# Licence: MIT
# Description: A custom filter to return the date that git has for the page modification time 
# 
# REQUIREMENTS: Uses `path` variable set in the base_name.rb plugin
#
# Example use: 
#
# {{ post.path | prepend:'../_posts/' | git_modified }}
# 

# require 'ruby-git'
require 'chronic'

module TextFilter
  def git_modified(input)
    path = input 
    modif = `git log -n 1 --format="%ai" -- #{path}`
    modif = Chronic.parse(modif)
    if modif.class != Time
      puts "Error in obtaining time for"
      puts path
      puts modif
    end
    modif
  end
end
Liquid::Template.register_filter(TextFilter)
