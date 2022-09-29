class Api::V1::RoadTripController < ApplicationController
  def create
    coordinates = LocationFacade.find_coordinates(params[:destination])
    #need to come back to this and get the correct hr
    weather = WeatherFacade.find_weather_data(coordinates)[2].first
    
    render json: RoadTripSerializer.create_roadtrip(weather, params), status: 201
  end
end