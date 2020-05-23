class FarmLocationsController < ApplicationController
  def index
    @farm_locations = FarmLocation.all
    if params[:type] == "json"
      data = @farm_locations.map do |farm|
        [farm.latitude, farm.longitude]
      end
      render json: {
        data: data,
        center: [@farm_locations[0].latitude, @farm_locations[1].longitude]
        }
    end
  end

  def show
    @farm_location = FarmLocation.find(params[:id])
    if params[:type] == 'json'
      render json: {
        data: [@farm_location.latitude, @farm_location.longitude],
      center: [@farm_location.latitude, @farm_location.longitude]}
    end
  end

  def search
    location = Geocoder.search(params[:search])[0].data["geometry"]["location"]
    @farm_locations = FarmLocation.all
    data = @farm_locations.map do |farm|
      [farm.latitude, farm.longitude]
    end
    render json: {data: data, center: [location["lat"], location["lng"]]}  
  end 
end
