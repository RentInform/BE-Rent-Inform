class TempToFinalJob < ApplicationJob
  queue_as :default

  def perform(async)
    Property.import temp_to_final(sanitized_list), on_duplicate_key_ignore: [:street]
    if async
      CleanupJob.perform_later
    else
      CleanupJob.perform_now
    end
  end

  private

  def sanitized_list
    TempProperty.select('DISTINCT ON (street) *').order('street, license_created_at DESC')
  end

  def temp_to_final(temp_properties)
    temp_properties.map do |temp_property|
      {street: temp_property.street, zip: temp_property.zip, license_number: temp_property.license_number}
    end
  end
end
