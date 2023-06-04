require 'rails_helper'

RSpec.describe "Perspective Service" do
  describe "Connection" do
    xit "gets a response" do
      WebMock.allow_net_connect!
      json = PerspectiveService.new.analyze("I love everybody")
      expect(json).to be_a(Hash)
      expect(json).to have_key(:attributeScores)
      expect(json[:attributeScores][:THREAT][:summaryScore][:value]).to be_a(Float) 
      expect(json[:attributeScores][:IDENTITY_ATTACK][:summaryScore][:value]).to be_a(Float) 
      expect(json[:attributeScores][:TOXICITY][:summaryScore][:value]).to be_a(Float) 
      expect(json[:attributeScores][:INSULT][:summaryScore][:value]).to be_a(Float) 
      expect(json[:attributeScores][:PROFANITY][:summaryScore][:value]).to be_a(Float) 
      WebMock.disable_net_connect!
    end
  end
end