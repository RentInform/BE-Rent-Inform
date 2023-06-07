require 'csv'

class PropertyImportJob < ApplicationJob
  queue_as :default

  def perform(file_path, async: true)
    TempProperty.import csv_to_temp(file_path)
    if async
      TempToFinalJob.perform_later(async)
    else
      TempToFinalJob.perform_now(async)
    end
  end

  private

  def csv_to_temp(file_path)
    temp_properties = []
    CSV.foreach(file_path, headers: true) do |row|
      temp_properties << { street: row['ADDRESS'],
                          zip: row['ZIP'],
                          license_number: license_cleaner(row['LICENSENUMBER']),
                          license_created_at: row['CRS_CREATEDDATE'] }
    end
    temp_properties
  end

  def license_cleaner(license_number)
    license_number.strip if license_number.instance_of?(String)
  end
end
