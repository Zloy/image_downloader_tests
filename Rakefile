require 'rspec/core/rake_task'
require 'rubocop/rake_task'

$LOAD_PATH << 'lib'
Rake.add_rakelib 'lib/tasks'

RuboCop::RakeTask.new(:rubocop)
task(:default).clear

desc 'Default: run rubocop, then specs.'
task default: [:rubocop, :spec]

desc 'Run specs'
RSpec::Core::RakeTask.new do |task|
  task.pattern = '**/spec/*_spec.rb'
end

task test: :spec
