require 'csv'

class PropertyImportJob
  include Sidekiq::Job

  def perform
    temp_properties = []
    file = Rails.root.join("db", "data", "CERT_RENTAL_SUTBLTY.csv")
    CSV.foreach(file, headers: true) do |row|
      temp_properties << TempProperty.new(street: row["ADDRESS"], zipcode: row["ZIP"], license_number: license_cleaner(row["LICENSENUMBER"]), license_created_at: row["CRS_CREATEDDATE"])
    end
    TempProperty.import temp_properties[0..9]

    properties = TempProperty.select("DISTINCT ON (street) *").order("street, license_created_at DESC")

    import_properties = properties.map do |property|
      Property.new(street: property.street, zipcode: property.zipcode, license_number: property.license_number)
    end
    import_properties << Property.new(street: "TEST STREET", zipcode: "12345", license_number: "234871035671")

    Property.import import_properties, on_duplicate_key_ignore: [:street]
  end

  def license_cleaner(license_number)
    license_number.strip if license_number.instance_of?(String)
  end
end
