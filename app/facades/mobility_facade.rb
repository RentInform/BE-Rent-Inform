class MobilityFacade
  def get_scores(address, lat, lon)
    format_data(score_data(address, lat, lon))
  end

  private

  def service
    @_service ||= MobilityService.new
  end

  def score_data(address, lat, lon)
    @_score_data ||= service.get_scores(address, lat, lon)
  end

  def format_data(data)
    { walk: data[:walkscore],
      bike: data[:bike][:score],
      transit: data[:transit][:score] }
  end
end
