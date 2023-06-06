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
  end
end
