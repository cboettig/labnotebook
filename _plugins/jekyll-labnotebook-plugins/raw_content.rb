# Generator to make raw content avialable as post.raw_content
# 
# Jekyll overwrites the post.content markdown data with the rendered html data
# Consequently liquid filters/etc only have access to HTML versions of the content
# in post.content.  This stores a copy as raw, which can be used for other purposes.
#
# Credit to [matthewowen](https://github.com/matthewowen) for this, https://gist.github.com/4025507
# In answer to StackOverflow question: http://stackoverflow.com/questions/13159286

module Jekyll
  class RawContent < Generator
    def generate(site)
      puts "Storing raw md versions as post metadata with raw_content.rb"
      start = Time.now
      site.posts.each do |post|
        post.data['raw_content'] = post.content
      end

      finish = Time.now
      puts "Time elapsed #{(finish - start)} seconds"

    end
  end
end
