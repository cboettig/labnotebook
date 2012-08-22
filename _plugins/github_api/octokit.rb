require 'octokit'

# should this cache?
# TODO: show only top 3 issues? sort by date?  Show closed issues?

module Jekyll
  class OctokitIssues < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
      @address = "cboettig/"+"#{@text}"
    end


    def render(context) # learn how to write this to take an argument!

      repo = Octokit.issues(@address) # grab the data. Can this go in "initialize?"

      #  repo = Octokit.issues(@address, :status => "closed") # (Gets closed issues??)

      # Generate a list of all open issues, linking to github issue page.  
      out = "<ul>"
      for i in 0 ... [repo.size, 3].min ## displays up to 3.  sorted by date?
        lab = ""
        if repo[i].labels[0].class == Hashie::Mash  # Get labels for issues, with color, where applicable 
          lab = " (<font color=\"#" + repo[i].labels[0].color + 
                "\">" + repo[i].labels[0].name  + "</font>)"
        end
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



## TODO Format date using Chronic.parse(date).strftime("%I:%M %Y/%m/%d") 

module Jekyll
  class OctokitCommits < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
      @address = "cboettig/"+"#{@text}"
    end

    def render(context)
      repo = Octokit.commits(@address) 
      out = "<ul>"
      for i in 0 ... [repo.size, 3].min
        out = out + "<li>" +
          "<a href=\"" + repo[i].commit.url + "\">" +
          repo[i].commit.message +
          "</a>" +
          " " + repo[i].commit.author.date + "</li>"
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




