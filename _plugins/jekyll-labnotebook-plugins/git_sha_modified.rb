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
      start = Time.now
      g = Git.open("/home/cboettig/Documents/labnotebook")

      ## FIXME takes over a second per post!  
      # That's almost 15 minutes at the moment.... Would be much much faster if we could 
      # generate a data file and read in as a hash containing the path, sha, and commit time
      # for each post.  Then in looping over posts we could just look up sha and timestamp
      # from the path in the hash, rather than calling git gem each time.  

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

      finish = Time.now
      puts "Time elapsed #{(finish - start)} seconds"


    end
  end
end

