require 'rails_helper'

RSpec.describe 'Property Search Facade', :vcr do
  before(:each) do
    @property_1 = Property.create!(street: '1 BROWN ST', zip: '19123', license_number: '811649')
    @property_2 = Property.create!(street: '1 CHRISTIAN ST', zip: '19147', license_number: '791507')
    @property_3 = Property.create!(street: '1 COTTON ST', zip: '19127', license_number: '725285')
  end

  describe 'instance methods' do
    it 'search_by_address(street)' do
      street_1 = '1 Brown Street'
      result_1 = PropertySearchFacade.new.search_by_address(street_1)

      expect(result_1).to eq(@property_1)

      street_2 = '1christian street'
      result_2 = PropertySearchFacade.new.search_by_address(street_2)

      expect(result_2).to eq(@property_2)
    end

    it 'set_scores(property)' do
      expect(@property_1.walk_score).to be(nil)
      expect(@property_1.transit_score).to be(nil)
      expect(@property_1.bike_score).to be(nil)
      expect(@property_1.safety_score).to be(nil)
      expect(@property_1.lat).to be(nil)
      expect(@property_1.lon).to be(nil)
      expect(@property_1.parks).to be(nil)

      PropertySearchFacade.new.set_scores(@property_1)

      expect(@property_1.walk_score).to be_a(String)
      expect(@property_1.transit_score).to be_a(String)
      expect(@property_1.bike_score).to be_a(String)
      expect(@property_1.safety_score).to be_a(String)
      expect(@property_1.lat).to be_a(String)
      expect(@property_1.lon).to be_a(String)
      expect(@property_1.parks).to be_a(Hash)

      parks = @property_1.parks
      keys = %i[park_1_name park_1_street park_2_name park_2_street park_3_name park_3_street]
      keys.each do |key|
        expect(parks).to have_key(key)
        expect(parks[key]).to be_a(String)
      end
    end
  end
end
