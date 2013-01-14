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
#  Use simply by invoking the liquid code {% pageviews page.url %}
#  to show the pageviews of page.url.  Update the start date below,
#  or remove to show views in the last 30 days.  Of course the analytics
#  data shown can be arbitrarily customized, see the garb gem repository
#  for details.  


require 'garb'
require 'yaml'
require 'chronic'

module Jekyll
  class GoogleAnalytics < Liquid::Tag

    # initialize tag use, e.g.: {% pageviews page.url %}
    def initialize(tag_name, text, tokens)
      super
      @path = text
    end

    def render(context)
      # Read in credentials and authenticate 
      cred = YAML.load_file("/home/cboettig/.garb_auth.yaml")
      Garb::Session.api_key = cred[:api_key]
      token = Garb::Session.login(cred[:username], cred[:password])
      profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == cred[:ua]}

      # Define return object
      class Exits
          extend Garb::Model
          metrics :exits, :pageviews 
          dimensions :page_path
      end

      # place query, customize to modify results
      data = Exits.results(profile, 
                           :filters => {:page_path.eql => @text}, 
                           :start_date => Chronic.parse("2011-01-01"))
      data.results

      a = data.results.to_s.split(/, */ )[2]
      a.gsub(/pageviews=\"(\d+).*/, "\\1 ").to_i
    end
  end
end

Liquid::Template.register_tag('pageviews', Jekyll::GoogleAnalytics)

