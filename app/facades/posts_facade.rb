class PostsFacade
  def pass_muster?(*texts)
    service = PerspectiveService.new
    results = texts.map{ |text| service.analyze(text) }

    results.each do |result|
      return false if result[:error]
    end

    scores = results.map{ |result| simplify(result) }
    scores.each do |score|
      return false if (score[:insult] > 0.6) ||
      score[:identity_attack] > 0.5 ||
      score[:threat] > 0.5
    end
    true
  end
  
  def simplify(text)
    {
      toxicity: text[:attributeScores][:TOXICITY][:summaryScore][:value],
      identity_attack: text[:attributeScores][:IDENTITY_ATTACK][:summaryScore][:value],
      threat: text[:attributeScores][:THREAT][:summaryScore][:value],
      insult: text[:attributeScores][:INSULT][:summaryScore][:value],
      profanity: text[:attributeScores][:PROFANITY][:summaryScore][:value]
    }
  end
end