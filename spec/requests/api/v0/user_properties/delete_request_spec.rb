require 'rails_helper'

RSpec.describe 'deleting a user property' do
  it 'happy path', :vcr do
    @user1_id = '1'
    @user2_id = '2'
  
    @property_1 = Property.create!(street: '1 BROWN ST', zipcode: '19123', license_number: '811649')
    @property_2 = Property.create!(street: '1 CHRISTIAN ST', zipcode: '19147', license_number: '791507')
    @property_3 = Property.create!(street: '1 COTTON ST', zipcode: '19127', license_number: '725285')
  
    @user_property_1 = UserProperty.create!(user_id: @user1_id, property_id: @property_1.id)
    @user_property_2 = UserProperty.create!(user_id: @user1_id, property_id: @property_2.id)

    headers = { 'CONTENT_TYPE' => 'application/json' }

    user_properties = UserProperty.count

    delete "/api/v0/user_property?user_id=#{@user1_id}&property_id=#{@property_1.id}", headers: headers

    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect(UserProperty.count).to eq(user_properties - 1)
  end

  it 'sad path: userproperty does not exist', :vcr do
    @user1_id = '1'
    @user2_id = '2'
  
    @property_1 = Property.create!(street: '1 BROWN ST', zipcode: '19123', license_number: '811649')
    @property_2 = Property.create!(street: '1 CHRISTIAN ST', zipcode: '19147', license_number: '791507')
    @property_3 = Property.create!(street: '1 COTTON ST', zipcode: '19127', license_number: '725285')
  
    @user_property_2 = UserProperty.create!(user_id: @user1_id, property_id: @property_2.id)

    headers = { 'CONTENT_TYPE' => 'application/json' }

    user_properties = UserProperty.count

    delete "/api/v0/user_property?user_id=#{@user1_id}&property_id=#{@property_1.id}", headers: headers
    invalid = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(404)
    expect(UserProperty.count).to eq(user_properties)
    expect(invalid).to have_key(:errors)
    expect(invalid[:errors][0][:detail]).to eq("No UserProperty with user_id=#{@user1_id} and property_id=#{@property_1.id} exists")
  end
end