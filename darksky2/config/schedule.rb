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


set :output, "#{path}/log/cron.log"


every 30.minutes do
  runner "eval(File.read 'lib/extract_load.rb')"
end 





# whenever --update-crontab



# this works from bash: 
# bundle exec rails runner "eval(File.read 'lib/extract_load.rb')"
# the same but without 'bundle exec' works just fine too




# every 30.seconds do
#   runner "eval(File.read '/lib/extract_load.rb')"
# end 




# Attempted:

# every 1.minute do
#   runner "eval(File.read '../lib/extract_load.rb')"
# end 




# every 1.minute do
#   runner "eval(File.read 'lib/extract_load.rb')"
# end 




