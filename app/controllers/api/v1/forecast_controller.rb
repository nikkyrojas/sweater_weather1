class Api::V1::ForecastController < ApplicationController
  def index
    coordinates = LocationFacade.find_coordinates(params[:location])
    weather = WeatherFacade.find_weather_data(coordinates)
    render json: ForecastSerializer.forecast(weather)
  end
end