class GeocodeFacade
  def get_coordinates(address)
    format_data(coordinate_data(address))
  end

  private

  def service
    @_service ||= GeocodeService.new
  end

  def coordinate_data(address)
    @_coordinate_data ||= service.get_coordinates(address)
  end

  def format_data(data)
    { lat: data[:results][0][:position][:lat],
      lon: data[:results][0][:position][:lon] }
  end
end
