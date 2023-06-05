class PlatebookFacade
  def initialize(params)
    @params = params
    @id = params[:id]
  end

  def all_users
    json = service.get_all_users
    json[:data].map do |user_data|
      User.new(user_data)
    end
  end

  def all_plates
    json = service.get_all_plates
    json[:data].map do |plate_data|
      Plate.new(plate_data)
    end
  end

  def all_posts
    json = service.get_all_posts
    json[:data].map do |post_data|
      Post.new(post_data)
    end
  end

  def user
    json = service.get_user(@id)[:data]
    User.new(json)
  end

  def plate
    json = service.get_plate(@id)[:data]
    Plate.new(json)
  end

  def post
    json = service.get_post(@id)[:data]
    Post.new(json)
  end

  def search
    json = service.get_all_search(@params)
    if @params[:category] == "plates"
      json[:data].map do |plate_data|
        Plate.new(plate_data)
      end
    else
      json[:data].map do |post_data|
        Post.new(post_data)
      end
    end
  end

  private 

  def service
   @_service ||= PlatebookService.new
  end
end