class PostsController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end

  def show
    @facade = PlatebookFacade.new(params)
  end

  def new
  end

  def create
    class PerspectiveApiService
  BASE_URL = 'https://commentanalyzer.googleapis.com/v1alpha1'.freeze
  API_KEY = 'YOUR_API_KEY'.freeze

  def self.analyze_comment(comment)
    url = "#{BASE_URL}/comments:analyze"
    headers = {
      'Content-Type' => 'application/json'
    }
    body = {
      comment: {
        text: comment
      },
      requestedAttributes: {
        TOXICITY: {}
      }
    }

    response = Faraday.post(url) do |req|
      req.headers = headers
      req.params['key'] = API_KEY
      req.body = body.to_json
    end

    JSON.parse(response.body)
  end
end

    Aws.config.update(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'])
    bucket = Aws::S3::Resource.new.bucket(ENV['AWS_S3_BUCKET_NAME'])
    file = bucket.object(params[:photo].original_filename)
    file.upload_file(params[:photo], acl: 'public-read')
    new_params = {
      title: posts_params[:title],
      body: posts_params[:body],
      plate_number: posts_params[:plate_number],
      photo_url: file.public_url,
      user_id: session[:user_id]
    }
    PlatebookService.new.create_post(new_params)
  end

  private
    def posts_params
      params.permit(:title, :body, :plate_number)
    end

 
end