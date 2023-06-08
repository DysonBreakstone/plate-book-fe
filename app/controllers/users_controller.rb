class UsersController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end

  def show
    @facade = PlatebookFacade.new(params)
  end

  def edit
    @user = params
  end

  def update
    response = BackendService.new.update_user(user_params)
    if response[:errors]
      flash[:alert] = response[:errors]
      redirect_to edit_user_path(user_params[:id])
    else
      redirect_to user_path(user_params[:id])
    end
  end

  private
    def user_params
      {
        username: params[:new_user_name],
        id: params[:id]
      }
    end
end