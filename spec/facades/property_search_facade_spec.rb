require 'rails_helper'

RSpec.describe 'Property Search Facade', :vcr do
  before(:each) do
    @property_1 = Property.create!(street: '1 BROWN ST', zipcode: '19123', license_number: '811649')
    @property_2 = Property.create!(street: '1 CHRISTIAN ST', zipcode: '19147', license_number: '791507')
    @property_3 = Property.create!(street: '1 COTTON ST', zipcode: '19127', license_number: '725285')
  end

  describe 'instance methods' do
    it 'search_by_address(street)' do
      street = "1 Brown Street"
      result = PropertySearchFacade.new.search_by_address(street)

      expect(result).to be_a(Property)
    end

    it 'set_scores(property)' do
      expect(@property_1.walk_score).to be(nil)
      expect(@property_1.transit_score).to be(nil)
      expect(@property_1.bike_score).to be(nil)
      expect(@property_1.safety_score).to be(nil)

      PropertySearchFacade.new.set_scores(@property_1)

      expect(@property_1.walk_score).to be_a(String)
      expect(@property_1.transit_score).to be_a(String)
      expect(@property_1.bike_score).to be_a(String)
      expect(@property_1.safety_score).to be_a(String)
    end
  end
end