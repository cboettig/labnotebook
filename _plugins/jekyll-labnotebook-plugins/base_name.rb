module Jekyll

  class PagePathGenerator < Generator
    safe true
    ## See post.dir and post.base for directory information. 
    def generate(site)
      site.posts.each do |post|
        post.data['path'] = post.name
      end

    end
  end

end

