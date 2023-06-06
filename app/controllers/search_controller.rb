class SearchController < ApplicationController
  def index
    @facade = PlatebookFacade.new(params)
  end
end