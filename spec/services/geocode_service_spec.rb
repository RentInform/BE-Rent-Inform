require 'rails_helper'

RSpec.describe GeocodeService do
  it 'returns coordinates', :vcr do
    service = GeocodeService.new
    location = service.get_coordinates("1 Brown Street, Philadelphia, PA 19123")

    expect(location).to be_a(Hash)
    expect(location[:results]).to be_an(Array)

    coordinates = location[:results][0][:position]
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates[:lon]).to be_a(Float)
  end

  it 'returns data on 3 nearby parks', :vcr do
    service = GeocodeService.new
    result = service.get_parks({lat: 39.92459089291047, lon: -75.16204921093596})

    expect(result).to be_a(Hash)
    expect(result[:results]).to be_an(Array)
    expect(result[:results].count).to eq(3)
  end
end
