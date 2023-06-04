class PropertySearchFacade
  def search_by_address(street)
    number, normalized_street = normalize_search(street)
    Property.where("street ILIKE ?", "#{number} %#{normalized_street}%")[0]
  end

  def set_scores(property)
    coordinates = geocode("#{property.street}, Philadelphia, PA #{property.zipcode}")
    scores = get_mobility_scores(property.street, coordinates).merge(get_safety_score(coordinates))

    property.walk_score = scores[:walk].to_s
    property.bike_score = scores[:bike].to_s
    property.transit_score = scores[:transit].to_s
    property.safety_score = scores[:safety].to_s
  end

  private
  def normalize_search(street)
    number_and_text = street.split(/(\D+)/)
    number = number_and_text[0]
    text = number_and_text[1].downcase().strip()
    street_types = {
      "street" => "st",
      "road" => "rd",
      "avenue" => "ave",
      "lane" => "ln"
    }
    regex = Regexp.new(street_types.keys.map { |key| Regexp.escape(key) }.join('|'))
    normalized_text = text.gsub(regex, street_types)

    return number, normalized_text
  end

  def geocode(street)
    GeocodeFacade.new.get_coordinates(street)
  end

  def get_mobility_scores(street, coordinates)
    MobilityFacade.new.get_scores(street, coordinates[:lat], coordinates[:lon])
  end

  def get_safety_score(coordinates)
    SafetyFacade.new.get_safety_score(coordinates[:lat], coordinates[:lon])
  end
end