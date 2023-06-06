require 'rails_helper'

RSpec.describe 'Mobility Facade', :vcr do
  describe 'instance methods' do
    it 'get_scores(address, lat, lon)' do
      address = "1 Brown Street, Philadelphia, PA 19123"
      lat = 39.962755
      lon = -75.137170

      scores = MobilityFacade.new.get_scores(address, lat, lon)

      expect(scores).to be_a(Hash)

      expect(scores).to have_key(:walk)
      expect(scores[:walk]).to be_an(Integer)
      expect(scores).to have_key(:bike)
      expect(scores[:bike]).to be_an(Integer)
      expect(scores).to have_key(:transit)
      expect(scores[:transit]).to be_an(Integer)
    end
  end
end