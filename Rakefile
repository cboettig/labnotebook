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
require 'jekyll'
require 'git'

# read Jekyll configuration
config = Jekyll::Configuration::DEFAULTS
if File.exist? '_config.yml'
  config = config.merge(Jekyll::Configuration.new.read_config_file('_config.yml'))
end
@destination = config["destination"]


# read information from git repo
# source branch is the current branch
# destination branch is derived from source branch name
path = File.expand_path File.dirname(__FILE__)
repo = Git.open(path)


@source_branch = repo.branches.find { |b| b.name if b.current && b.remote.nil? }
@destination_branch = @source_branch == "master" ? "gh-pages" : "master"
# @destination_branch = "master" ## doen by the above


@git_user = repo.config('user.name')
@git_email = repo.config('user.email')
@remote = repo.remote(:origin).url

puts "From Jekyll parsing of config"
puts @destination
puts @git_user
puts @remote


CONFIG = YAML.load(File.read('_config.yml'))
USERNAME = CONFIG["username"] || ENV['GIT_NAME']
REPO = CONFIG["repo"]
DESTINATION_REPO = CONFIG["destination_repo"]
TOKEN = ENV["GH_TOKEN"]
DESTINATION_BRANCH = "master"
@destination = DESTINATION_REPO


def check_destination
  unless Dir.exist? CONFIG["destination"]
    puts "Checking destination"
    sh 'mkdir ../cboettig.github.com'
#    @repo = Git.clone("https://github.com/#{USERNAME}/#{DESTINATION_REPO}.git", :name => "#{USERNAME}:#{TOKEN}", :path => @destination)
    @repo = Git.clone("https://#{USERNAME}:#{TOKEN}@github.com/#{USERNAME}/#{DESTINATION_REPO}.git", 'name', :path => @destination)
#    @repo = Git.clone("https://#{USERNAME}:#{TOKEN}@github.com/#{USERNAME}/#{DESTINATION_REPO}.git", 'name', :path => "../cboettig.github.com")

#    Open3.popen3("git clone https://#{USERNAME}:#{TOKEN}@github.com/#{USERNAME}/#{DESTINATION_REPO}.git #{CONFIG["destination"]}") do |stdin, stdout, stderr|
#      stderr.read
#    end


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
      sh "git config --global user.name '#{CONFIG['author']['name']}'"
      sh "git config --global user.email '#{CONFIG['author']['email']}'"
      sh "git config --global push.default simple"
    end

    # Make sure destination folder exists as git repo
    check_destination

### make sure the focal repo is on the source branch
#    sh "git checkout #{SOURCE_BRANCH}"

### Make sure destination directory is on the gh-pages/html branch
#    Dir.chdir(CONFIG["destination"]) {
#      sh "git checkout #{DESTINATION_BRANCH}"
#    }

    # Generate the site
    sh "bundle exec jekyll build --trace"

    # Commit and push to github
    sha = `git log`.match(/[a-z0-9]{40}/)[0]
    Dir.chdir(CONFIG["destination"]) do
      sh "pwd"
      sh "rm -f _twitter.yml _garb.yml"
      sh "git add --all ."
      sh "git commit -m 'Updating site'"
      sh "git push origin #{DESTINATION_BRANCH}"
      puts "Pushed updated branch #{DESTINATION_BRANCH} to GitHub Pages"
    end
  end
end
