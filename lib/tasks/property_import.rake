desc 'This task sanitizes, normalizes, and loads the CSV'

task property_import: :environment do
  puts 'Adding properties...'
  # file_path = Rails.root.join('db', 'data', 'CERT_RENTAL_SUTBLTY.csv').to_s #load full dataset
  file_path = Rails.root.join('spec', 'fixtures', 'TEST_DATA.csv').to_s #load shortened test dataset - 200 rows
  PropertyImportJob.perform_later(file_path, async: true)
  puts 'done.'
end
