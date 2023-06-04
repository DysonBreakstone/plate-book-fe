require 'faraday'

class PerspectiveService
  def conn
    @_conn ||= Faraday.new(url: 'https://commentanalyzer.googleapis.com/v1alpha1/comments:analyze') do |connection|
      connection.headers['Content-Type'] = 'application/json',
      connection.params['key'] = ENV['GOOGLE_CLOUD_API_KEY']
    end
  end

  def analyze(comment)
    response = conn.post do |request|
      request.body = {
        comment: {text: comment},
        requestedAttributes: {
          TOXICITY: {},
          IDENTITY_ATTACK: {},
          INSULT: {},
          PROFANITY: {},
          THREAT: {}
        }
      }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end