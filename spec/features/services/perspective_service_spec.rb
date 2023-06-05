require 'rails_helper'

RSpec.describe "Perspective Service" do
  describe "Connection" do
    it "gets a response" do
      json_response = File.read('spec/fixtures/positive_message_perspective.json')
      stub_request(:post, "https://commentanalyzer.googleapis.com/v1alpha1/comments:analyze?key=#{ENV['GOOGLE_CLOUD_API_KEY']}").
        to_return(status: 200, body: json_response)

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

  # describe ""
end