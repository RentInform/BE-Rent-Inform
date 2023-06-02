class PropertyImportJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end


# res = HTTParty.get("https://opendata.arcgis.com/api/v3/datasets/5a0050ad23224e8c884b6d1ac9db6607_0/downloads/data?format=csv&spatialRefId=4326&where=1%3D1")
# download (or access) CSV
# read in the CSV
# Use AR Import gem to import and create Temp_Property records/objects for each row of the CSV (attributes: address, zip code, license #, crs_created_date)
# Query Temp_Property database (de-dup and downcase) and return only the records you want:
  # Most recent record for each address?
  # Most recent record for each License Number, then de-dup addresses? Downcase addresses in query?
# Use AR Import gem to import this subset of records into the Real_Property table
  # You can get your results via SQL from the Temp_Property records, and then map over that to create New objects, and then import them in bulk
# At the end of the method, destroy records in the Temp Database

#For subsequent runs when you don't want to overwrite your whole database, only insert new records:
  # Database validations for uniqueness - address?
  # Or check for conflict, and just update the license number and date?
  # Use ActiveImport on_duplicate_key_ignore method

#As an extension:  use this background worker to send all addresses through a Geocoder and save a lat / lon
#Check for duplicates against lat / lon (and check for this when creating future records)
