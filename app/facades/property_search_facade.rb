class PropertySearchFacade
  def search_by_address(street)
    number, normalized_street = normalize_search(street)
    Property.where('street ILIKE ?', "#{number} %#{normalized_street}%")[0]
  end

  def set_scores(property)
    set_city_and_state(property)
    coordinates = geocode("#{property.street}, #{property.city}, #{property.state} #{property.zip}")
    threads = []
    
    threads << Thread.new do
      property.lat = coordinates[:lat].to_s
      property.lon = coordinates[:lon].to_s
    end

    threads << Thread.new do
      walk_scores = get_mobility_scores(property.street, coordinates)
      property.walk_score = walk_scores[:walk].to_s
      property.bike_score = walk_scores[:bike].to_s
      property.transit_score = walk_scores[:transit].to_s
    end

    threads << Thread.new do
      safety_score = get_safety_score(coordinates)
      property.safety_score = safety_score[:safety].to_s
    end


    threads.each(&:join)
    property
  end

  def set_city_and_state(property)
    property.city = 'Philadelphia'
    property.state = 'PA'
  end

  private

  def normalize_search(street)
    number_and_text = street.split(/(\D+)/)
    number = number_and_text[0]
    text = number_and_text[1].upcase().strip()
    street_types = {
      'AVENUE' => 'AVE',
      'BOULEVARD' => 'BLVD',
      'CIRCLE' => 'CIR',
      'COURT' => 'CT',
      'DRIVE' => 'DR',
      'LANE' => 'LN',
      'PARKWAY' => 'PKWY',
      'PLACE' => 'PL',
      'ROAD' => 'RD',
      'STREET' => 'ST',
      'TERRACE' => 'TER'
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
