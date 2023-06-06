require 'rails_helper'

RSpec.describe MobilityService do
  it 'returns walk, bike, and transit scores', :vcr do
    address = "1 Brown Street, Philadelphia, PA 19123"
    lat = 39.962755
    lon = -75.137170

    service = MobilityService.new
    response = service.get_scores(address, lat, lon)

    expect(response).to be_a(Hash)

    expect(response[:walkscore]).to be_an(Integer)

    bike_data = response[:bike]
    expect(bike_data).to be_a(Hash)
    expect(bike_data[:score]).to be_an(Integer)

    transit_data = response[:transit]
    expect(transit_data).to be_a(Hash)
    expect(transit_data[:score]).to be_an(Integer)
  end
end
