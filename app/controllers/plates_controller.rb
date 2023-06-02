class PlatesController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end
end