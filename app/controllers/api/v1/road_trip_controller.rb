class Api::V1::RoadTripController < ApplicationController
  def create
    coordinates = LocationFacade.find_coordinates(params[:destination])
    weather = WeatherFacade.find_weather_data(coordinates)[1]
    
    render json: RoadTripSerializer.create_roadtrip(weather, params), status: 201

   
  end
end