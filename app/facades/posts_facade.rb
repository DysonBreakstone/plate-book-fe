class PostsFacade
  def pass_muster?(title, body)
    service = PerspectiveService.new
    
    x = service.analyze(title)
    y = service.analyze(body)
    if y[:error] || x[:error]
      return false
    end

    scores = [simplify(x), simplify(y)]
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