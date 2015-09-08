desc "This task is called by the Heroku scheduler add-on"
task :update_inserts_database => :environment do
  puts "Updating inserts database..."
  PopulateInsertsDatabase.update
  puts "done."
end