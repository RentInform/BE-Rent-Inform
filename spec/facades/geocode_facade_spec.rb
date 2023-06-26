require 'rails_helper'

RSpec.describe 'Geocode Facade', :vcr do
  describe 'instance methods' do
    it 'get_coordinates(address)' do
      address = "1 Brown Street, Philadelphia, PA 19123"
      coordinates = GeocodeFacade.new.get_coordinates(address)

      expect(coordinates).to be_a(Hash)

      expect(coordinates).to have_key(:lat)
      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates).to have_key(:lon)
      expect(coordinates[:lon]).to be_a(Float)
    end

    it 'get_parks(coordinates)' do
      coordinates = {lat: 39.92459089291047, lon: -75.16204921093596}
      parks = GeocodeFacade.new.get_parks(coordinates)

      expect(parks).to be_a(Hash)
      keys = %i[park_1_name park_1_street park_2_name park_2_street park_3_name park_3_street]
      keys.each do |key|
        expect(parks).to have_key(key)
        expect(parks[key]).to be_a(String)
      end
    end
  end
end
