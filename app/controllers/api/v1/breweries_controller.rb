class Api::V1::BreweriesController < ApplicationController
  def index
    coordinates = LocationFacade.find_coordinates(params[:location])
    weather = WeatherFacade.find_weather_data(coordinates)[0]
    breweries = BreweryFacade.find_breweries(params[:location], params[:quantity])
    render json: BrewerySerializer.format_breweries(breweries, weather)
  end
end