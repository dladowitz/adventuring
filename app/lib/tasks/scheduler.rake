desc "This task is called by the Heroku cron add-on. Its purpose is to keep the Heroku dyno from spinning down"
task :call_page => :environment do
  uri = URI.parse('http://adventuring.herokuapp.com/')
   Net::HTTP.get(uri)
 end
