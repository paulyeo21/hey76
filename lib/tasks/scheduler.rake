desc "This task is called by the Heroku scheduler add-on"
task :update_inserts_database => :environment do
  puts "Updating inserts database..."
  PopulateInsertsDatabase.find_new_inserts
  puts "done."
end