## A plugin that uses the garb gem to provide google analytics data to Jekyll
# Author: Carl Boettiger
# Licence: CC0
# Date: 2013-01-13
#
# Installation:
#   
#   Install the latest copy of the garb gem from this repo: 
#   https://github.com/Sija/garb
#   following the instructions that appear there.  Then place
#   this script in the _plugins directory and follow the 
#   configuration below.  
#
# Configuration:
#
#  Create an authentication file in your home directory (adjust the
#  YAML.load_file line below) with the following structure: 
#  
#  
#  :api_key: "AIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
#  :username: "XXXXXXXXXXXXX"
#  :password: "XXXXXXXXXXXXX"
#  :ua: "UA-XXXXXXXX-X"
#
#  and save the file as .garb_auth.yaml.  This prevents your 
#  secret credentials from being visible in the source code of your 
#  Jekyll site.  
# 
# Usage: 
#
#  Use by invoking the liquid code: (Note: No spaces around page.url!) 
#      {% pageviews %}{{page.url}}{% endpageviews %}
#  to show the pageviews of page.url.  Update the start date below,
#  or remove to show views in the last 30 days.  Of course the analytics
#  data shown can be arbitrarily customized, see the garb gem repository
#  for details.  


require 'garb'
require 'chronic'
require 'json'

module Jekyll

  # Define return object
  class Exits
      extend Garb::Model
      metrics :exits, :pageviews 
      dimensions :page_path
  end

  class AnalyticsGenerator < Generator

    safe true
    priority :low
      
      def generate(site)

        puts "Getting Google Analytics data"
         ## Set timeouts to be extra patient if necessary
#        Garb.open_timeout = 120 # 2 minute timeout
#        Garb.read_timeout = 120 # 2 minute timeout
        
        ## Read in credentials and authenticate 
        cred = YAML.load_file("/home/cboettig/.garb_auth.yaml")

        puts "Garb authenticating for " + cred[":username"]

        Garb::Session.api_key = cred[":api_key"]
        token = Garb::Session.login(cred[":username"], cred[":password"])
        profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == cred[":ua"]}

        # place query, customize to modify results
        data = Exits.results(profile, 
                             :start_date => Chronic.parse("2008-01-01"))
        result = Hash[data.collect{|row| [row.page_path, [row.exits, row.pageviews]]}]
        ## FIXME Unclear why this does not include data on pages, e.g. vita.html, research.html, etc.  
        ### Perhaps need to search for these explicitly, but rather annoying...


        ## Loop over pages, appending the pageviews data to the metadata
        site.pages.each do |page|
          if defined?(result[page.url][1]) 
            views = result[page.url][1]
          else 
            views = "(not calculated)"
          end
          page.data['pageviews'] = views
        end

        ## Loop over posts, appending the pageviews data to the metadata
        site.posts.each do |post|
          if defined?(result[post.url][1]) 
            views = result[post.url][1]
          else 
            views = "(not calculated)"
          end
          post.data['pageviews'] = views
        end
      end
  end

end

