class PostsFacade
  def pass_muster?(title, body)
    service = PerspectiveService.new
    scores = [simplify(service.analyze(title)), simplify(service.analyze(body))]
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