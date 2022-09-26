require 'rails_helper'

RSpec.describe 'User API' do  
  it 'user post call returns a serializes response of email, password, password confirmation', :vcr do 
    user_params = ({
                    "email": "testing@example.com",
                    "password": "test123",
                    "password_confirmation": "test123"
                  })

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)
    new_user = User.last
    
    expect(new_user.email).to eq(user_params[:email])
    expect(new_user.password).to eq(user_params[:password])
  end 
end
