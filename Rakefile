require 'fileutils'
require 'rake'
require 'tmpdir'
require 'yaml'
CONFIG = YAML.load(File.read('_config.yml'))


desc 'Generate deck from Travis CI and publish to GitHub Pages.'
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
      if ENV["TRAVIS"]
        system "git config --global user.name '#{CONFIG['author']['name']}'"
        system "git config --global user.email '#{CONFIG['author']['email']}'"
      end

      system 'git add --all .'
      system "git commit -m 'Built from #{rev}'."
      system "git push -q #{deploy_url} #{deploy_branch}"
    end
  end
end


