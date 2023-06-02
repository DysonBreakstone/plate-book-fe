class PlatesController < ApplicationController
  def index
    @facade = PlatebookFacade.new
  end
end