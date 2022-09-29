require 'rails_helper'

RSpec.describe 'roadtrip' do  
  it 'returns a serialized response that includes start city, end city, travel time, weather', :vcr do 
    user = User.create!(email: "another_user@email.com", password: "test123")
    trip_params = ({
                    "origin": "Denver, CO",
                    "destination": "Pueblo, CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(trip_params)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response).to be_a Hash
    expect(json_response[:data][:type]).to eq("roadtrip")
    expect(json_response[:data][:id]).to be_a(nil)
    expect(json_response[:data][:attributes]).to be_a Hash
    expect(json_response[:data][:attributes][:start_city]).to eq("Denver, CO")
    expect(json_response[:data][:attributes][:end_city]).to eq("Estes Park, CO")
    expect(json_response[:data][:attributes][:travel_time]).to eq("2 hours, 13 minutes")
    expect(json_response[:data][:attributes][:weather_at_eta]).to be_a Hash
    expect(json_response[:data][:attributes][:weather_at_eta][:temperature]).to eq(59.4)
    expect(json_response[:data][:attributes][:weather_at_eta][:conditions]).to eq("partly cloudy with a chance of meatballs")
  end 
    it 'return error if passwords dont match/missing field/invalid email', :vcr do 
    user = User.create!(email: "another_user@email.com", password: "test123")
    session_params = ({
                    "email": "wrong_email@email.com",
                    "password": "#{user.password}",
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.body).to include("One of the following errors have occured: passwords do not match, invalid email, or field is missing")
  end 

end
