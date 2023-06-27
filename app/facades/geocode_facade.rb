class GeocodeFacade
  def get_coordinates(address)
    format_coordinate_data(coordinate_data(address))
  end

  def get_parks(coordinates)
    format_parks_data(parks_data(coordinates))
  end

  private

  def service
    @_service ||= GeocodeService.new
  end

  def coordinate_data(address)
    @_coordinate_data ||= service.get_coordinates(address)
  end

  def format_coordinate_data(data)
    { lat: data[:results][0][:position][:lat],
      lon: data[:results][0][:position][:lon] }
  end

  def parks_data(coordinates)
    @_parks_data ||= service.get_parks(coordinates)
  end

  def format_parks_data(data)
    parks = data[:results]
    return {} if parks[0].nil? || parks[1].nil? || parks[2].nil?

    {
      park_1_name: parks[0][:poi][:name],
      park_1_street: parks[0][:address][:freeformAddress],
      park_2_name: parks[1][:poi][:name],
      park_2_street: parks[1][:address][:freeformAddress],
      park_3_name: parks[2][:poi][:name],
      park_3_street: parks[2][:address][:freeformAddress]
    }
  end
end
