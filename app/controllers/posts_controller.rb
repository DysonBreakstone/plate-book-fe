require 'geocoder'

class PostsController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end

  def show
    @facade = PlatebookFacade.new(params)
  end

  def new
    @plate_number = params[:plate_number]
  end

  def create
    if params[:photo]
      Aws.config.update(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'])
      bucket = Aws::S3::Resource.new.bucket(ENV['AWS_S3_BUCKET_NAME'])
      file = bucket.object(params[:photo].original_filename)
      file.upload_file(params[:photo], acl: 'public-read')
      photo_url = file.public_url
    end
    if PostsFacade.new.pass_muster?(posts_params[:title], posts_params[:body])
      location = Geocoder.search("#{params[:street_address]} #{params[:city]} #{params[:state]}, #{params[:zipcode]}").first
      lat = location.latitude
      lng = location.longitude

      new_params = {
        title: posts_params[:title],
        body: posts_params[:body],
        plate_number: posts_params[:plate_number],
        photo_url: photo_url,
        user_id: session[:user_id],
        lat: lat,
        lng: lng
      }
      post = PlatebookService.new.create_post(new_params)
      post = JSON.parse(post.body, symbolize_names: true)

      redirect_to post_path(post[:data][:attributes][:id])
    else
      flash[:alert] = "Either the title or post contains content that does not meet our community guidelines."
      redirect_to new_post_path
    end
  end

  private
    def posts_params
      params.permit(:title, :body, :plate_number)
    end

 
end