class PlatesController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end

  def show
    @userplate = PlatebookService.new.get_user_plate(user_id: current_user, plate_id: params[:id])
    @userplate = JSON.parse(@userplate.body, symbolize_names: true)
    @facade = PlatebookFacade.new(params)
  end
end