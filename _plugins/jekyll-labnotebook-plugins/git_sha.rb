# Title: git_sha.rb
# Author: Carl Boettiger, @cboettig
# Licence: MIT
# Description: A custom filter to return the SHA hash associated with the last commit of a page
# REQUIREMENTS: Uses `path` variable set in the base_name.rb plugin
# 
# Example use: 
#
# {{ post.path | git_sha }}
# {{ post.path | prepend:'_posts/' | git_sha }}
# 

require 'git'

module Jekyll
  module GitSHAFilter
    def git_sha(input)
      puts "Getting git SHA with git_sha.rb"
      g = Git.open("/home/cboettig/Documents/labnotebook")
      g.log(1).object(input).first.sha
    end
  end
end
Liquid::Template.register_filter(Jekyll::GitSHAFilter)
