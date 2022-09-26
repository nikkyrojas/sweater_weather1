require 'rails_helper'

RSpec.describe WeatherService do 
  it "retrieves current weather data from weather map api", :vcr do 

    location = [39.738453,-104.984853] #Denver CO cordinates
    response = WeatherService.get_weather(location)
    expect(response).to be_a(Hash)
    expect(response[:lat]).to eq(39.7385)
    expect(response[:lon]).to eq(-104.9849)
    expect(response[:timezone]).to eq("America/Denver")
    expect(response[:current]).to be_a(Hash)
    expect(response[:current][:dt]).to be_an(Integer)
    expect(response[:current][:sunrise]).to be_an(Integer)
    expect(response[:current][:sunset]).to be_an(Integer)
    expect(response[:current][:temp]).to be_a(Float)
    expect(response[:current][:feels_like]).to be_a(Float)
    expect(response[:current][:humidity]).to be_an(Integer)
    expect(response[:current][:visibility]).to be_an(Integer)
  end
  it "retrieves daily weather data from weather map api", :vcr do 

    location = [39.738453,-104.984853] #Denver CO cordinates
    response = WeatherService.get_weather(location)
    expect(response).to be_a(Hash)
    expect(response[:lat]).to eq(39.7385)
    expect(response[:lon]).to eq(-104.9849)
    expect(response[:timezone]).to eq("America/Denver")
    expect(response[:daily]).to be_a(Array)
    expect(response[:daily][0][:dt]).to be_an(Integer)
    expect(response[:daily][0][:sunrise]).to be_an(Integer)
    expect(response[:daily][0][:sunset]).to be_an(Integer)
    expect(response[:daily][0][:temp]).to be_a(Hash)
    expect(response[:daily][0][:feels_like]).to be_a(Hash)
    expect(response[:daily][0][:humidity]).to be_an(Integer)
  end
end
