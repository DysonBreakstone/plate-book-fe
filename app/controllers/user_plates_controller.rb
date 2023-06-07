class UserPlatesController < ApplicationController
  def create
    @facade = PlatebookFacade.new(user_plate_params).follow
    redirect_to request.referrer || root_url
  end

  def destroy
    @facade = PlatebookFacade.new(user_plate_params).unfollow
    redirect_to request.referrer || root_url
  end

  private
  def user_plate_params
    params.permit(:user_id, :plate_id, :user_plate_id)
  end
end