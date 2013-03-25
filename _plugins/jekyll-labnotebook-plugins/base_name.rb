module Jekyll

  class PagePathGenerator < Generator
    safe true
    
    def generate(site)
      site.posts.each do |post|
        post.data['path'] = post.name
      end

    end
  end

end

