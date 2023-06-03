class UsersController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end

  def show
    @facade = PlatebookFacade.new(params)
  end
end