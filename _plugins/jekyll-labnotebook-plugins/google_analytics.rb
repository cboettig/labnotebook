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
require 'yaml'
require 'chronic'

module Jekyll

  # Define return object
  class Exits
      extend Garb::Model
      metrics :exits, :pageviews 
      dimensions :page_path
  end


  class GoogleAnalytics < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super # options that appear in block (between tag and endtag)
      @options = markup # optional optionss passed in by opening tag
    end
    def render(context)
      path = super
     
      # Read in credentials and authenticate 
      cred = YAML.load_file("/home/cboettig/.garb_auth.yaml")
      Garb::Session.api_key = cred[:api_key]
      token = Garb::Session.login(cred[:username], cred[:password])
      profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == cred[:ua]}

      # place query, customize to modify results
      data = Exits.results(profile, 
                           :filters => {:page_path.eql => path}, 
                           :start_date => Chronic.parse("2011-01-01"))
      
      # Extract the pageviews 
      if defined?(data.first.pageviews)
        views = data.first.pageviews
      else 
        views = "(not calculated)"
      end
      views 
    end
  end
end

Liquid::Template.register_tag('pageviews', Jekyll::GoogleAnalytics)

# Crazy way to extract data
#      out = data.results.to_s.split(/, */ )[2].gsub(/pageviews=\"(\d+).*/, "\\1 ")

