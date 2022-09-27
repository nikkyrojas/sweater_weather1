require 'rails_helper'

RSpec.describe "Brewery Request" do 
  it 'finds a brewery by location' do

    get "/api/v1/breweries?location=denver&quantity=5"

    expect(response).to be_successful
    json_response = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json_response[:id]).to eq(nil)
    expect(json_response[:type]).to eq("breweries")
  end
end