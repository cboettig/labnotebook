#############################################################################
#
# Modified version of jekyllrb Rakefile
# https://github.com/jekyll/jekyll/blob/master/Rakefile
#
#############################################################################

require 'rake'
require 'date'
require 'yaml'
require 'open3'

CONFIG = YAML.load(File.read('_config.yml'))
USERNAME = CONFIG["username"] || ENV['GIT_NAME']
REPO = CONFIG["repo"] || "#{USERNAME}.github.io"

## Deploy on #{USERNAME}.github.io, with source on a source branch

#if REPO == "#{USERNAME}.github.io"
#  SOURCE_BRANCH = CONFIG['branch'] || "source"
#  DESTINATION_BRANCH = "master"

## Deploy on a regular repo, with source on master branch and site on gh-pages

#else
# SOURCE_BRANCH = "master"
# DESTINATION_BRANCH = "gh-pages"
#end

# Deploy on a different repo

SOURCE_BRANCH = "master"
DESTINATION_REPO = "#{USERNAME}.github.com"
DESTINATION_BRANCH = "master"

DESTINATION_DIR = CONFIG["destination"] || "_site"

puts DESTINATION_DIR

def check_destination
  unless Dir.exist? DESTINATION_DIR
    sh "mkdir #{DESTINATION_DIR}"
    Open3.popen3("git clone https://#{USERNAME}:#{ENV['GH_TOKEN']}@github.com/#{USERNAME}/#{DESTINATION_REPO}.git #{CONFIG["destination"]}"){ }
  end
end


namespace :site do

  desc "Generate the site and push changes to remote origin"
  task :deploy do
    # Detect pull request
    if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
      puts 'Pull request detected. Not proceeding with deploy.'
      exit
    end

    # Configure git if this is run in Travis CI
    if ENV["TRAVIS"]
      Open3.popen3("git config --global user.name '#{CONFIG['author']['name']}'"){ }
      Open3.popen3("git config --global user.email '#{CONFIG['author']['email']}'"){ }
      Open3.popen3("git config --global push.default simple"){ }
    end

    # Make sure destination folder exists as git repo
    check_destination

#    sh "git checkout #{SOURCE_BRANCH}"
    Dir.chdir(DESTINATION_DIR) {
      sh "git checkout #{DESTINATION_BRANCH}"
    }

    # Generate the site
    sh "bundle exec jekyll build --trace"

    # Commit and push to github
    sha = `git log`.match(/[a-z0-9]{40}/)[0]
    Dir.chdir(CONFIG["destination"]) do
      sh "rm -f _twitter.yml _garb.yml"
      sh "git add --all ."
      sh "git commit -m 'Updating to #{USERNAME}/#{REPO}@#{sha}.'"
      sh "git push origin #{DESTINATION_BRANCH}"
      puts "Pushed updated branch #{DESTINATION_BRANCH} to GitHub Pages"
    end
  end
end
