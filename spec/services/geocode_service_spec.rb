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
end
