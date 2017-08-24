## provide the Jekyll name of the page or post, e.g. 2013-02-02-notes.md
## Makes this data available as if it was given in the yaml header, 
## e.g. we can use `page.path` in Liquid filters and tags to access this name


module Jekyll
  class PagePathGenerator < Generator
    safe true
    ## NOTE: post.dir gives the published directory path, e.g. 2013/02/02/ 
    # and post.base not valid  
    def generate(site)
      puts "Generating page path metadata with base_name.rb"
      start = Time.now
      site.posts.each do |post|
        post.data['path'] = post.name
      end
      site.pages.each do |post|
        post.data['path'] = post.name
      end
      finish = Time.now
      puts "Time elapsed #{(finish - start)} seconds"
    end
  end
end

