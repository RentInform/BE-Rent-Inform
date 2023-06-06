desc "This task sanitizes, normalizes, and loads 10 lines of the CSV"

task :property_import => :environment do
  puts "Adding properties..."
  PropertyImportJob.perform_later
  puts "done."
end