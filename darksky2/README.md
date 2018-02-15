# README



Url: https://darksky22.herokuapp.com/conditions/show

Updates about 20 seconds past the 20 minute mark every hour

Uses verbose code so can be improved 

Still contains whenever gem functionality (/config/schedule.rb and /lib/extract_load.rb) in case deployed on platform other than heroku; and of course has heroku's scheduler files (/lib/tasks/scheduler.rake)


To run whenever on localhost: 
whenever --update-crontab --set environment=development 
(it will default to production, so must specifiy development when running locally)

Don't forget to end automated tasks afterwards (or risk running up API calls): crontab -r


To run extract_load.rb manually: rails r lib/extract_load.rb

To run rails console and inspect model/database:
Locally: rails c, Condition.last, Condition.find(3), Condition.all, Condition.select('updated_at').last
On heroku: heroku run rails c, Condition.last etc

To build database: 
rails g model (code for 68 fields)
rake db:drop (if already exists)
rake db:create (may not be required)
rake db:migrate








