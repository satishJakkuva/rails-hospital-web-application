# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
#Sets the environment to run during development mode (Set to production by default)
# set :environment, "development"
# require File.expand_path('../config/environment', __dir__)
# tail -f log/cron.log  #to check log in command line

set :output, "log/cron.log" 
# set environment='development'
every 1.minutes do
    # runner "puts Time.now"
    # runner "puts Rails.env"
    # runner "puts 'hello world'"
    runner "Doctor.print"
end