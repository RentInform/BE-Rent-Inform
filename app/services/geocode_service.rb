class GeocodeService
  def get_coordinates(address)
    get_url("/search/2/geocode/#{URI.encode_www_form_component(address)}.json")
  end

  def get_parks(coordinates)
    get_url("/search/2/categorySearch/parks.json?lat=#{coordinates[:lat]}&lon=#{coordinates[:lon]}&limit=3")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.tomtom.com') do |f|
      f.params['key'] = ENV['TOMTOM_API_KEY']
    end
  end
end
