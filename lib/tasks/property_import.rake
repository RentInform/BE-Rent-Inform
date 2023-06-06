desc 'This task sanitizes, normalizes, and loads 10 lines of the CSV'

task property_import: :environment do
  puts 'Adding properties...'
  file_path = Rails.root.join('db', 'data', 'CERT_RENTAL_SUTBLTY.csv').to_s
  PropertyImportJob.perform_later(file_path)
  puts 'done.'
end
