# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'rspec/core/rake_task'
require_relative "config/application"
RSpec::Core::RakeTask.new(:spec)

task default: [:spec]

Rails.application.load_tasks
