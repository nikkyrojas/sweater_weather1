require 'rails_helper'

RSpec.describe WeatherFacade do 
  it 'returns weather data for given coordinates', :vcr do 

    coordinates = [39.738453,-104.984853]
    weather_data = WeatherFacade.find_weather_data(coordinates)
    expect(weather_data).to be_a(Hash)
    expect(weather_data[:lat]).to eq(39.7385)
    expect(weather_data[:lon]).to eq(-104.9849)
    expect(weather_data[:timezone]).to eq("America/Denver")
  end
end