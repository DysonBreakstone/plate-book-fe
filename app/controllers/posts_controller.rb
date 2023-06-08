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
    location = Geocoder.search("#{params[:street_address]} #{params[:city]} #{params[:state]}").first

    return redirect_with_alert(new_post_path, 'Please enter a valid location.') unless location
  
    unless PostsFacade.new.pass_muster?(posts_params[:title], posts_params[:body])
      return redirect_with_alert(new_post_path, 'Either the title or post contains content that does not meet our community guidelines.')
    end
  
    post = create_post(location)
    redirect_to post_path(post[:data][:id])
  end

  private
    def posts_params
      params.permit(:title, :body, :plate_number, :selected_tags)
    end
    
    def create_post(location)
      new_params = {
        title: posts_params[:title],
        body: posts_params[:body],
        plate_number: posts_params[:plate_number],
        photo_url: upload_photo_to_s3,
        user_id: session[:user_id],
        selected_tags: posts_params[:selected_tags],
        lat: location.latitude,
        lng: location.longitude
      }
      response = PlatebookService.new.create_post(new_params)
      require 'pry'; binding.pry
      JSON.parse(response.body, symbolize_names: true)
    end
    
    def upload_photo_to_s3
      return unless params[:photo]
    
      Aws.config.update(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'])
      bucket = Aws::S3::Resource.new.bucket(ENV['AWS_S3_BUCKET_NAME'])
      file = bucket.object(params[:photo].original_filename)
      file.upload_file(params[:photo], acl: 'public-read')
      file.public_url
    end
    
    def redirect_with_alert(path, message)
      flash[:alert] = message
      redirect_to path
    end

 
end
