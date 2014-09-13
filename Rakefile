# encoding: utf-8
require "rubygems"

begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

require "rspec/core"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList["spec/**/*_spec.rb"]
end

require "simplecov"
desc "Code coverage"
task :simplecov do
  ENV["COVERAGE"] = "true"
  Rake::Task["spec"].execute
end

require "jeweler"
Jeweler::Tasks.new do |gem|
  gem.name = "angular_sprinkles"
  gem.homepage = "http://github.com/BrewhouseTeam/angular_sprinkles"
  gem.license = "MIT"
  gem.summary = %Q{Add a few sprinkles of AngularJS to your Rails App}
  gem.description = %Q{Add a few sprinkles of AngularJS to your Rails App}
  gem.email = "gabe@brewhouse.io"
  gem.authors = ["Gabe Scholz"]
end
Jeweler::RubygemsDotOrgTasks.new

desc "Run migrations for dummy app"
task :migrate do
  rakefile = File.expand_path('../spec/dummy/Rakefile', __FILE__)
  sh("rake -f #{rakefile} db:create db:migrate")
end
