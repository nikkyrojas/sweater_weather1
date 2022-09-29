require 'rails_helper'

RSpec.describe 'User API' do  
  it 'user post call returns a serialized response of email, password, password confirmation', :vcr do 
    user_params = ({
                    "email": "testing123@example.com",
                    "password": "test123",
                    "password_confirmation": "test123"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    json_response = JSON.parse(response.body)
    
    new_user = User.last

    expect(json_response).to be_a Hash
    expect(new_user.email).to eq("testing123@example.com")
    expect(new_user.password_digest).to be_a(String)
  end 

  it 'return error if passwords dont match', :vcr do 
    user_params = ({
                    "email": "testing@example.com",
                    "password": "test123",
                    "password_confirmation": "teaD123"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.body).to include("One or all of the following have occured: Passwords do not match, email already exist, or field is missing")
  end 
end
