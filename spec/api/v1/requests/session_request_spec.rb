require 'rails_helper'

RSpec.describe 'sessions ' do  
  it 'user login session', :vcr do 
    user = User.create!(email: "another_user@email.com", password: "test123")
    session_params = ({
                    "email": "#{user.email}",
                    "password": "#{user.password}",
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session_params)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response).to be_a Hash
    expect(json_response[:data][:type]).to eq("users")
    expect(json_response[:data][:id]).to be_a String
    expect(json_response[:data][:attributes]).to be_a Hash
    expect(json_response[:data][:attributes][:email]).to eq("another_user@email.com")
    expect(json_response[:data][:attributes][:api_key]).to be_a String
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
