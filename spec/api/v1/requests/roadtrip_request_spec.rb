require 'rails_helper'

RSpec.describe 'roadtrip' do  
  it 'returns a serialized response that includes start city, end city, travel time, weather', :vcr do 
    trip_params = ({
                    "origin": "Denver, CO",
                    "destination": "Pueblo, CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(trip_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response).to be_a Hash
    expect(json_response[:data][:type]).to eq("roadtrip")
    # expect(json_response[:data][:id]).to be_a(null)
    expect(json_response[:data][:attributes]).to be_a Hash
    expect(json_response[:data][:attributes][:start_city]).to eq("Denver, CO")
    expect(json_response[:data][:attributes][:end_city]).to eq("Pueblo, CO")
    expect(json_response[:data][:attributes][:travel_time]).to eq("2 hours, 13 minutes")
    expect(json_response[:data][:attributes][:weather_at_eta]).to be_a Hash
    expect(json_response[:data][:attributes][:weather_at_eta][:temperature]).to eq("59.61")
    expect(json_response[:data][:attributes][:weather_at_eta][:conditions]).to eq("clear sky")
  end 
    xit 'return error if missing field', :vcr do 
      trip_params = ({
                    "origin": "Denver, CO",
                    "destination": "Pueblo, CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(trip_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.body).to include("Field(s) are missing")
  end 

end
