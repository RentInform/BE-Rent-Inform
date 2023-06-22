require 'rails_helper'

RSpec.describe 'Property Search Endpoint', :vcr do
  before(:each) do
    @property_1 = Property.create!(street: '1 BROWN ST', zip: '19123', license_number: '811649')
    @property_2 = Property.create!(street: '1 CHRISTIAN ST', zip: '19147', license_number: '791507')
    @property_3 = Property.create!(street: '1 COTTON ST', zip: '19127', license_number: '725285')
  end

  describe 'Property Search: Property Found in Database' do
    it 'returns data about a specific property if property search is successful' do
      street = '1 Brown Street'
      zip = '19123'

      get "/api/v0/search?street=#{street}&zip=#{zip}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data).to be_a Hash
      expect(data).to have_key(:data)

      property = data[:data]
      expect(property).to be_a(Hash)

      expect(property).to have_key(:id)
      expect(property[:id]).to be_a(String)
      expect(property[:id]).to eq(@property_1.id.to_s)

      expect(property).to have_key(:type)
      expect(property[:type]).to be_a(String)
      expect(property[:type]).to eq('property')

      expect(property).to have_key(:attributes)
      expect(property[:attributes]).to be_a(Hash)

      attributes = property[:attributes]
      keys = [:street, :city, :state, :zip]
      keys.each do |key|
        expect(attributes).to have_key(key)
        expect(attributes[key]).to be_a(String)
      end

      expect(attributes[:street]).to eq(@property_1.street)
      expect(attributes[:city]).to eq('Philadelphia')
      expect(attributes[:state]).to eq('PA')
      expect(attributes[:zip]).to eq(@property_1.zip)
    end
  end

  describe 'Property Search: Property Not Found in Database' do
    it 'returns a null data response and no additional information if the property search is unsuccessful' do
      street = '1011 Mercy Street'
      zip = '19148'

      get "/api/v0/search?street=#{street}&zip=#{zip}"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data).to be_a Hash
      expect(data).to have_key(:data)
      expect(data[:data]).to be(nil)
    end
  end
end
