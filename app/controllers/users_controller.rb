class UsersController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end
end