require_relative '../command_runner'

# run task: rake robot:test_run
namespace :robot do
  desc "Run robot with some sample inputs"
  task :test_run do
    command_runner = CommandRunner.new
    command_runner.run
  end
end