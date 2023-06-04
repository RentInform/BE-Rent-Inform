class SafetyFacade
  def get_safety_score(lat, lon)
    format(score_data(lat, lon))
  end

  private

  def format(score_data)
    {
      safety: score_data[:data][0][:safetyScores][:overall]
    }
  end

  def score_data(lat, lon)
    @_score_data ||= service.get_safety_score(lat, lon)
  end

  def service
    @_service ||= SafetyService.new
  end
end
