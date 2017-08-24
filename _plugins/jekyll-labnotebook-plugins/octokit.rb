# Author: Carl Boettiger
# License: MIT
# Description: Jekyll plugins for interacting with the Github API using the
#   'octokit' gem.  Currently provides a way to embed commits and isues
#   from a given repository.  Be sure to set the user below.

# Examples:
#  {% octokit_issues nonparametric-bayes%}
#  {% octokit_commits nonparametric-bayes%}

# TODO: show only top 3 issues? sort by date?  Show closed issues?



require 'octokit'
require 'time'
require 'chronic'

module Jekyll
  class OctokitIssues < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
      @address = "cboettig/"+"#{@text}"
    end
    def render(context) # learn how to write this to take an argument!
       puts "Getting Github Issues via octokit.rb"


       repo = Octokit.issues(@address) # grab the data. Can this go in "initialize?"
       #  repo = Octokit.issues(@address, :status => "closed") # (Gets closed issues??)
       # Generate a list of all open issues, linking to github issue page.
       out = "<ul>"
       for i in 0 ... [repo.size, 8].min ## displays up to 5.  sorted by date?
         lab = ""
#         if repo[i].labels[0]  # Get labels for issues, with color, where applicable
#           lab = " (<font color=\"#" + repo[i].labels[0].color +
#                 "\">" + repo[i].labels[0].name  + "</font>)"
#         end
         ## Actually only pulls open issues
         if repo[i].state == "open" # Print only open issues
           out = out + "<li> <a href=\"" + repo[i].html_url + "\">" +  repo[i].title + "</a> " + lab + "</li>"
         end
         if repo[i].state == "closed" # strike out closed issues
           out = out + "<li> <strike> <a href=\"" + repo[i].html_url + "\">" +  repo[i].title + "</a> " + lab + "</strike> </li>"
         end
       end
       out = out + "</ul>"
       out
    end
  end
end

Liquid::Template.register_tag('octokit_issues', Jekyll::OctokitIssues)




## Commit gets issues on the day given.

module Jekyll
  class OctokitCommits < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
      @address = "cboettig/"+"#{@text}"
    end
    def render(context)
       puts "Getting Github Commits via octokit.rb"
       # day = Time.now # context.environments.first["page"]["date"]
       # @until = Chronic.parse("Now") #(day + 60*60*24).iso8601
       # @since = Chronic.parse("One day ago") #day.iso8601
       # repo = Octokit.commits(@address, "master", {:since => @since, :until => @until})
       repo = Octokit.commits(@address, "master")
       out = "<ul>"
       for i in 0 ... [repo.size, 8].min
         out = out + "<li>" +
           repo[i].commit.message + " " +
           "<a href=\"" +
           ## Adjust the link to a proper url
           repo[i].commit.url.gsub("api\.", "").gsub("repos/","").gsub("git/", "").gsub("commits/", "commit/") +
           "\">" +
           repo[i].commit.author.date.strftime("%I:%M %P %Y/%m/%d") +
           "</a>" +
           "</li>"
       end
       out = out + "</ul>"
       out
    end
  end
end

## Use context-specific github flavored markdown to convert sha into link.  e.g.
## Octokit.markdown("Hello world github/linguist#1 **cool**, and #1!", :mode => "gfm", :context => "github/gollum")
#

Liquid::Template.register_tag('octokit_commits', Jekyll::OctokitCommits)




