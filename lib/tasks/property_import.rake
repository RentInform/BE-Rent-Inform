desc 'This task sanitizes, normalizes, and loads the CSV'

task property_import: :environment do
  puts 'Adding properties...'
  file1 = Rails.root.join('db', 'data', 'file_00.csv').to_s #load partial dataset
  file2 = Rails.root.join('db', 'data', 'file_01.csv').to_s #load partial dataset
  file3 = Rails.root.join('db', 'data', 'file_02.csv').to_s #load partial dataset
  file4 = Rails.root.join('db', 'data', 'file_03.csv').to_s #load partial dataset
  file5 = Rails.root.join('db', 'data', 'file_04.csv').to_s #load partial dataset

  files = [file1, file2, file3, file4, file5]

  PropertyImportJob.perform_later(files, true)
  puts 'done.'
end
