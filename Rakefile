#!/usr/bin/env rake

require 'foodcritic'
require 'foodcritic/rake_task'
require 'rake'
require 'rake/tasklib'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'kitchen/rake_tasks'

FoodCritic::Rake::LintTask.new do
  options = { fail_tags: ['any'] }
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = '--default_path test/unit'
end

Kitchen::RakeTasks.new

# aliases
task :test => :spec
task :lint => :foodcritic
task :default => [:lint, :test]
task :all => [:lint, :test, 'kitchen:all']
