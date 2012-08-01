require 'octokit'

# should this cache?

module Jekyll
  class OctokitIssues < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
      @address = "cboettig/"+"#{@text}"
    end


    def render(context) # learn how to write this to take an argument!

      repo = Octokit.issues(@address) # grab the data. Can this go in "initialize?"

      # Generate a list of all open issues, linking to github issue page.  
      out = "<ul>"
      for i in 0 ... repo.size
        lab = ""
        if repo[i].labels[0].class == Hashie::Mash  # Get labels for issues, with color, where applicable 
          lab = " (<font color=\"#" + repo[i].labels[0].color + 
                "\">" + repo[i].labels[0].name  + "</font>)"
        end
        if repo[i].state == "open" # Print only open issues (not necessary? Done by default?)
          out = out + "<li> <a href=\"" + repo[i].html_url + "\">" +  repo[i].title + "</a> " + lab + "</li>"
        end
      end
      out = out + "</ul>"
      out

    end
  end
end

Liquid::Template.register_tag('octokit_issues', Jekyll::OctokitIssues)





module Jekyll
  class OctokitCommits < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
      @address = "cboettig/"+"#{@text}"
    end

    def render(context) # learn how to write this to take an argument!
      repo = Octokit.commits(@address) 
      out = "<ul>"
      for i in 0 ... [repo.size, 5].min
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

Liquid::Template.register_tag('octokit_commits', Jekyll::OctokitCommits)




