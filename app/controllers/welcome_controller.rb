class WelcomeController < ApplicationController
  def index
    @locations = []
    json = PlatebookService.new.get_locations
    @locations << json[:data]
    @hot_plates = PlatebookService.new.get_hot_plates
  end
end
