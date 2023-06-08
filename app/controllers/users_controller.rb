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
    BackendService.new.update_user(user_params)
  end

  private
    def user_params
      {
        username: params[:new_user_name],
        id: params[:id]
      }
    end
end