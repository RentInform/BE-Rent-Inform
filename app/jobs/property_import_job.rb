require 'csv'

class PropertyImportJob < ApplicationJob
  queue_as :default

  def perform(file_path)
    TempProperty.import csv_to_temp(file_path)
    Property.import temp_to_final(sanitized_list), on_duplicate_key_ignore: [:street]
    TempProperty.delete_all
  end

  private

  def csv_to_temp(file_path)
    temp_properties = []
    CSV.foreach(file_path, headers: true) do |row|
      temp_properties << TempProperty.new(street: row['ADDRESS'],
                                          zip: row['ZIP'],
                                          license_number: license_cleaner(row['LICENSENUMBER']),
                                          license_created_at: row['CRS_CREATEDDATE'])
    end
    temp_properties
  end

  def license_cleaner(license_number)
    license_number.strip if license_number.instance_of?(String)
  end

  def sanitized_list
    TempProperty.select('DISTINCT ON (street) *').order('street, license_created_at DESC')
  end

  def temp_to_final(temp_properties)
    temp_properties.map do |temp_property|
      Property.new(street: temp_property.street, zip: temp_property.zip, license_number: temp_property.license_number)
    end
  end
end
