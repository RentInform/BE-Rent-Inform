require 'rails_helper'

RSpec.describe 'Create a UserProperty' do
  before(:each) do
    @user1_id = '1'
    @user2_id = '2'

    @property_1 = Property.create!(street: '1 BROWN ST', zipcode: '19123', license_number: '811649')
    @property_2 = Property.create!(street: '1 CHRISTIAN ST', zipcode: '19147', license_number: '791507')
    @property_3 = Property.create!(street: '1 COTTON ST', zipcode: '19127', license_number: '725285')
  end
  it 'creates a UserProperty' do
    post "/api/v0/user_property?user_id=#{@user1_id}&property_id=#{@property_1.id}"

    expect(response).to be_successful
    expect(response.status).to eq(201)

    data = JSON.parse(response.body, symbolize_names: true)
    expect(data).to be_a Hash
    expect(data).to have_key(:data)

    user_property = data[:data]
    expect(user_property).to be_a(Hash)

    expect(user_property).to have_key(:type)
    expect(user_property[:type]).to be_a(String)
    expect(user_property[:type]).to eq('user_property')

    expect(user_property).to have_key(:id)
    expect(user_property[:id]).to be_a(String)

    expect(user_property).to have_key(:attributes)
    expect(user_property[:attributes]).to be_a(Hash)

    attributes = user_property[:attributes]
    expect(attributes[:user_id]).to be_a(String)
    expect(attributes[:property_id]).to be_a(Integer)
  end

  it 'does not create a UserProperty if one already exists' do
    up = UserProperty.create!(user_id: @user1_id, property_id: @property_1.id)

    post "/api/v0/user_property?user_id=#{@user1_id}&property_id=#{@property_1.id}"

    expect(response).to_not be_successful
    expect(response.status).to eq(422)
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to be_a Hash
    expect(data).to have_key(:error)
    expect(data[:error]).to eq('User has already saved this property')
  end
end