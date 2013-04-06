module Jekyll

  class PagePathGenerator < Generator
    safe true
    ## NOTE: post.dir gives the published directory path, e.g. 2013/02/02/ 
    # and post.base not valid  
    def generate(site)
      site.posts.each do |post|
        post.data['path'] = post.name
      end
      site.pages.each do |post|
        post.data['path'] = post.name
      end
    end
  end
end

