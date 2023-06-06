require 'rails_helper'

RSpec.describe 'Get one Property details for user' do
  before(:each) do
    @user1_id = '1'
    @user2_id = '2'

    @property_1 = Property.create!(street: '1 BROWN ST', zipcode: '19123', license_number: '811649')
    @property_2 = Property.create!(street: '1 CHRISTIAN ST', zipcode: '19147', license_number: '791507')
    @property_3 = Property.create!(street: '1 COTTON ST', zipcode: '19127', license_number: '725285')

    @user_property_1 = UserProperty.create!(user_id: @user1_id, property_id: @property_1.id)
    @user_property_2 = UserProperty.create!(user_id: @user1_id, property_id: @property_2.id)
  end

  it 'returns one Property for a User', :vcr do
    get "/api/v0/user_property?property_id=#{@property_1.id}&user_id=#{@user1_id}"
    
    expect(response).to be_successful
    expect(response.status).to eq(200)
    
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data).to be_a Hash
    expect(data).to have_key(:data)

    user_property = data[:data]
    expect(user_property).to be_a(Hash)

    expect(user_property).to have_key(:type)
    expect(user_property[:type]).to be_a(String)
    expect(user_property[:type]).to eq('property')

    expect(user_property).to have_key(:id)
    expect(user_property[:id]).to be_a(String)

    expect(user_property).to have_key(:attributes)
    expect(user_property[:attributes]).to be_a(Hash)

    attributes = user_property[:attributes]
    expect(attributes[:street]).to eq(@property_1.street)
    
    keys = [:street, :city, :state, :zip, :walk_score, :transit_score, :bike_score, :safety_score]
    keys.each do |key|
      expect(attributes).to have_key(key)
      expect(attributes[key]).to be_a(String)
    end
  end
end