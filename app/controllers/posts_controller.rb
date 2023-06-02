class PostsController < ApplicationController
  def new
  end

  def create
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