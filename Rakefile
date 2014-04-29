# Standard library
require 'fileutils'
require 'rake'
require 'tmpdir'
require 'yaml'

# Load the configuration file
config = YAML.load_file '_config.yml'
config[:destination] ||= '_site/'
config[:sub_content] ||= []
destination = File.join config[:destination], '/'

# Set "rake draft" as default task
task :default => :draft

# Spawn a server and kill it gracefully when interrupt is received
def spawn *cmd
  pid = Process.spawn 'bundle', 'exec', *cmd

  switch = true
  Signal.trap 'SIGINT' do
    Process.kill( :QUIT, pid ) && Process.wait
    switch = false
  end
  while switch do sleep 1 end
end

# rake build
desc 'Generate the site'
task :build do
  system 'bundle', 'exec', 'jekyll', 'build'
  config[:sub_content].each do |content|
    repo = content[0]
    branch = content[1]
    dir = content[2]
    rev = content[3]
    Dir.chdir config[:destination] do
      FileUtils.mkdir_p dir
      system "git clone -b #{branch} #{repo} #{dir}"
      Dir.chdir dir do
        system "git checkout #{rev}" if rev
        FileUtils.remove_entry_secure '.git'
        FileUtils.remove_entry_secure '.nojekyll' if File.exists? '.nojekyll'
      end if dir
    end if Dir.exists? config[:destination]
  end
end


desc 'Generate site from Travis CI and publish site to GitHub Pages.'
task :travis do
  # if this is a pull request, do a simple build of the site and stop
  if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
    puts 'Pull request detected. Executing build only.'
    system 'bundle exec rake build'
    next
  end

  repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:').strip
  deploy_url = repo.gsub %r{https://}, "https://#{ENV['GH_TOKEN']}@"
  deploy_branch = repo.match(/github\.io\.git$/) ? 'master' : 'gh-pages'
  rev = %x(git rev-parse HEAD).strip

  Dir.mktmpdir do |dir|
    dir = File.join dir, 'site'
    system 'bundle exec rake build'
    fail "Build failed." unless Dir.exists? destination
    system "git clone --branch #{deploy_branch} #{repo} #{dir}"
    system %Q(rsync -rt --del --exclude=".git" --exclude=".nojekyll" #{destination} #{dir})
    Dir.chdir dir do
      # setup credentials so Travis CI can push to GitHub
      system "git config user.name '#{ENV['GIT_NAME']}'"
      system "git config user.email '#{ENV['GIT_EMAIL']}'"

      system 'git add --all'
      system "git commit -m 'Built from #{rev}'."
      system "git push -q #{deploy_url} #{deploy_branch}"
    end
  end
end
