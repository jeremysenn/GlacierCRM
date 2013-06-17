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

every :sunday, :at => '12pm' do
  runner "User.all.each do |u| u.send_birthday_and_anniversaries_this_week_email; end", :output => 'log/cron.log'
end

every 1.month, :at => 'start of the month at 7:00am' do
  runner "User.all.each do |u| u.send_birthday_and_anniversaries_this_month_email; end", :output => 'log/cron.log'
end
