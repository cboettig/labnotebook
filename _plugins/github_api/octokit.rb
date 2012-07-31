require 'octokit'


module Jekyll
  class OctokitIssues < Liquid::Tag
    def render(context)

      repo = Octokit.issues("cboettig/pdg_control")
      for i in 0 ... repo.size
        lab = ""
        if repo[i].labels[0].class == Hashie::Mash
          lab = "<a class=\"btn\" style=\"background-image:none; filter:none; background-color:#" + repo[i].labels[0].color + 
                "\">" + repo[i].labels[0].name  + "</a>"
        end
          puts "<a href=\"" + repo[i].url + "\">" +  repo[i].title + "</a>" + lab
      end
        # consider using repo[i].labels to extract Label tag and color code information
        # repo[i].labels[0].name 
        # repo[i].labels[0].color
        # repo[i].labels[0].url
        #
        # Remember to look up .class and methods for objects to learn how to manipulate them!  Above is much nicer than:
        # repo[i].labels[0].to_a[0][1] #returns the color's hex value
        # repo[i].labels[0].to_a[1][1] #returns the label's name (note the use of converting to an array)

    end
  end
end

Liquid::Template.register_tag('octokit', Jekyll::OctokitIssues)


