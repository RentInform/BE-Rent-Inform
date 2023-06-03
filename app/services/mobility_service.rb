class MobilityService
  def get_scores(address, lat, lon)
    key = ENV['WALK_SCORE_API_KEY']
    get_url("/score?format=json&address=#{URI.encode_www_form_component(address)}&lat=#{lat}&lon=#{lon}&transit=1&bike=1&wsapikey=#{key}")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.walkscore.com') do |f|
    end
  end
end
