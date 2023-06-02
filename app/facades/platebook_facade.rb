class PlatebookFacade


  def initialize(params)
  end

  def all_users
    json = service.get_all_users
    json[:data].map do |user_data|
      User.new(user_data)
    end
  end

  private 

  def service
   @_service ||= PlatebookService.new
  end
end