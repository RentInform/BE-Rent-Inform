require 'rails_helper'

RSpec.describe UserProperty, type: :model do
  describe 'relationships' do
    it { should belong_to(:property) }
  end

  describe 'class methods' do
    describe 'get_property_ids' do
      before(:each) do
        @user1_id = '1'
        @user2_id = '2'

        @property_1 = Property.create!(street: '1 BROWN ST', zip: '19123', license_number: '811649')
        @property_2 = Property.create!(street: '1 CHRISTIAN ST', zip: '19147', license_number: '791507')
        @property_3 = Property.create!(street: '1 COTTON ST', zip: '19127', license_number: '725285')

        @user_property_1 = UserProperty.create!(user_id: @user1_id, property_id: @property_1.id)
        @user_property_2 = UserProperty.create!(user_id: @user1_id, property_id: @property_2.id)
      end

      it 'returns an array of property ids for a user' do
        expect(UserProperty.get_property_ids(@user1_id)).to eq([@property_1.id, @property_2.id])
      end

      it 'returns an empty array if no UserProperties exist for a User' do
        expect(UserProperty.get_property_ids(@user2_id)).to eq([])
      end
    end
  end
end
