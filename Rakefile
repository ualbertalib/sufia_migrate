require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'sufia_migrate'

import './lib/tasks/export.rake'
import './lib/tasks/import.rake'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
