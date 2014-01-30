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
require 'json'

module Jekyll
  class RawContent < Generator


    def generate(site)
  
      def niltext(char)
        if(char.nil?)
          "not computed"
        else
          char
        end
      end
     
      puts "Getting date modified and sha data from git"
      start = Time.now
      g = Git.open("/home/cboettig/Documents/labnotebook")
      ## FIXME takes over a second per post!  
      # That's almost 15 minutes at the moment.... Would be much much faster if we could 
      # generate a data file and read in as a hash containing the path, sha, and commit time
      # for each post.  Then in looping over posts we could just look up sha and timestamp
      # from the path in the hash, rather than calling git gem each time.  
      if(!File.exists?("gitdata.json"))

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
      
        gitdata = Hash[site.posts.collect{|post| 
          [post.path, [post.data['sha'], post.data['modified']]]}]

        File.open("gitdata.json", "w") do |f|
              f.write(JSON.pretty_generate(gitdata))
        end
      end 

      if(File.exists?("gitdata.json"))
        buffer = open("gitdata.json")
        gitdata = JSON.load(buffer)
        site.posts.each do |post|
            path = '_posts/' + post.name
            post.data['sha'] =  niltext(gitdata[path][0])
            post.data['modified'] =  niltext(gitdata[path][1])
        end
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

