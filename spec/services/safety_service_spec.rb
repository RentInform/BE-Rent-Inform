require 'rails_helper'

RSpec.describe SafetyService do
  it 'returns a safety score', :vcr do
    service = SafetyService.new
    lat = 39.9525839
    lon = -75.1652215
    response = service.get_safety_score(lat, lon)

    expect(response).to be_a(Hash)
    expect(response[:data]).to be_an(Array)
    score = response[:data][0][:safetyScores][:overall]
    expect(score).to be_an(Integer)
  end
end
