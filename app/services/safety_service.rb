require 'amadeus'

class SafetyService
  def get_safety_score(lat, lon)
    response = amadeus.safety.safety_rated_locations.get(latitude: lat, longitude: lon)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def amadeus
    @_amadeus ||= Amadeus::Client.new(hostname: :production,
                                      client_id: ENV['AMADEUS_CLIENT_ID'],
                                      client_secret: ENV['AMADEUS_CLIENT_SECRET'])
  end
end
