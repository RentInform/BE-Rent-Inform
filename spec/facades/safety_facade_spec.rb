require 'rails_helper'

RSpec.describe SafetyFacade, :vcr do
  describe 'instance methods' do
    describe 'get_safety_score(lat, lon)' do
      it 'returns a hash with a safety score' do
        lat = 39.9525839
        lon = -75.1652215
        score_data = SafetyFacade.new.get_safety_score(lat, lon)

        expect(score_data).to be_a(Hash)
        expect(score_data).to have_key(:safety)
        expect(score_data[:safety]).to be_an(Integer)
      end
    end
  end
end
