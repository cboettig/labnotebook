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
#  Create an authentication file in your project directory (adjust the
#  YAML.load_file line below) with the following structure:
#
#
#  :api_key: "AIXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
#  :username: "XXXXXXXXXXXXX"
#  :password: "XXXXXXXXXXXXX"
#  :ua: "UA-XXXXXXXX-X"
#
#  and save the file as _garb.yml. Remember to add `_garb.yml` to
#  .gitignore and the exclude list of `_config.yml`, (as you see in
#  this repository.)  This prevents your secret credentials from being
#  visible in the source code of your Jekyll site.
#
# Usage: Add the following liquid code to any page or post template or contents:
#
#   {{ page.pageviews }}
#
# Configuration: Update the start date below,
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

        cred = YAML.load_file("_garb.yml")

        if(site.config['pageviews'])
          puts "Getting Google Analytics data"

          start = Time.now


          Garb::Session.api_key = cred[":api_key"]
          token = Garb::Session.login(cred[":username"], cred[":password"])
          profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == cred[":ua"]}

          # place query, customize to modify results
          data = Exits.results(profile,
                               :start_date => Chronic.parse("2008-01-01"),
                               :all => true)
          # drop the filter?
          result = Hash[data.collect{|row| [row.page_path, [row.exits, row.pageviews]]}]
          File.open("google_analytics.json", "w") do |f|
                f.write(JSON.pretty_generate(result))
          end


          ## Loop over pages, appending the pageviews data to the metadata
          site.pages.each do |page|
            if(!page.url.match "/archives/") ## Don't do these redirect pages
              if defined?(result[page.url][1])   # Apparently not defined for pages... perhaps filter is
                views = result[page.url][1]
              else
                # Query pages explicitly since they aren't showing up in the above
                page_data = Exits.results(profile,
                                          :filters => {:page_path.eql => page.url},
                                          :start_date => Chronic.parse("2008-01-01"))
                page_results = Hash[page_data.collect{|row| [row.page_path, [row.exits, row.pageviews]]}]

                if defined?(page_results[page.url][1])
                  views = page_results[page.url][1]
                else
                views = "(not calculated)"
                end
              end
              page.data['pageviews'] = views
            end
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

        finish = Time.now


        puts "Time elapsed #{(finish - start)} seconds"
      end
    end
  end

end

