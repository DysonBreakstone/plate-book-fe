class WelcomeController < ApplicationController
  def index
    @locations = []
    json = PlatebookService.new.get_locations
    @locations << json[:data]
    # locations = [{ lat: 40.7392, lng: -101.9903 },
    #               { lat: 40.7128, lng: -74.0060 },
    #               { lat: 34.0522, lng: -118.2437 },
    #               { lat: 41.8781, lng: -87.6298 }]
  end
end
