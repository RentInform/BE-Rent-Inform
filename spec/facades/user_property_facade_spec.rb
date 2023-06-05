require 'rails_helper'

RSpec.describe UserPropertyFacade do
  describe 'instance methods' do
    before(:each) do
      @user1_id = '1'
      @user2_id = '2'

      @property_1 = Property.create!(street: '1 BROWN ST', zipcode: '19123', license_number: '811649')
      @property_2 = Property.create!(street: '1 CHRISTIAN ST', zipcode: '19147', license_number: '791507')
      @property_3 = Property.create!(street: '1 COTTON ST', zipcode: '19127', license_number: '725285')

      @user_property_1 = UserProperty.create!(user_id: @user1_id, property_id: @property_1.id)
      @user_property_2 = UserProperty.create!(user_id: @user1_id, property_id: @property_2.id)

      @facade = UserPropertyFacade.new
    end

    describe 'get_properties' do
      it 'returns an array of property ids for a user' do
        properties = [@property_1, @property_2]

        expect(@facade.get_properties(@user1_id)).to eq(properties)
        @facade.get_properties(@user1_id).each do |property|
          expect(property.city).to eq('Philadelphia')
          expect(property.state).to eq('PA')
        end
      end

      it 'returns an empty array if no UserProperties exist for a User' do
        expect(@facade.get_properties(@user2_id)).to eq([])
      end
    end
  end
end
