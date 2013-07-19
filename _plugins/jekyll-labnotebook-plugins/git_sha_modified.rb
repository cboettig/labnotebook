# Title: git_mod.rb
# Author: Carl Boettiger, @cboettig
# Licence: MIT
# Description: A custom filter to return the date that git has for the page modification time 
# 
# REQUIREMENTS: Uses `path` variable set in the base_name.rb plugin
#
# Example use: 
#
# 

require 'git'
module Jekyll
  class RawContent < Generator
    def generate(site)

      puts "Getting date modified and sha data from git"
      g = Git.open("/home/cboettig/Documents/labnotebook")

      ## Loop over posts 
      site.posts.each do |post|
        begin
          path = '_posts/' + post.name
          modified = g.log(1).object(path).first.date
          sha = g.log(1).object(path).first.sha
        rescue Exception => e 
          modified = Time.now 
          sha = "not yet committed" 
        end
        post.data['sha'] = sha
        post.data['modified'] = modified
      end
      ## Loop over pages 
      site.pages.each do |page|
        begin
          path = File.join(".", page.dir, page.name)
          modified = g.log(1).object(path).first.date
          sha = g.log(1).object(path).first.sha
        rescue Exception => e 
          modified = Time.now 
          sha = "not yet committed" 
        end
        page.data['sha'] = sha
        page.data['modified'] = modified
      end



    end
  end
end

