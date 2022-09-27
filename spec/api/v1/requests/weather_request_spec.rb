require 'rails_helper'

RSpec.describe 'Weather API' do 
  it 'response is successful', :vcr do 
    get '/api/v1/forecast?location=Denver,Co'

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end 
 
  it 'response format is correct', :vcr do 
    get '/api/v1/forecast?location=Denver,Co'


    json_response = JSON.parse(response.body, symbolize_names: true)
    weather_data = json_response[:data]

    expect(weather_data).to be_a(Hash)
    expect(weather_data[:id]).to eq(nil)
    expect(weather_data[:attributes]).to be_a(Hash)
    expect(weather_data[:attributes][:current_weather]).to be_a(Hash)
    expect(weather_data[:attributes][:daily_weather]).to be_a(Array)
    expect(weather_data[:attributes][:daily_weather].count).to eq(5)
    expect(weather_data[:attributes][:hourly_weather]).to be_a(Array)
    expect(weather_data[:attributes][:hourly_weather].count).to eq(8)
  end 
end