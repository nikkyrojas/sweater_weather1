require 'rails_helper'

RSpec.describe "Brewery Request" do 
  it 'finds a brewery by location' do
    get "/api/v1/breweries?location=denver&quantity=5"

    expect(response).to be_successful
    json_response = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json_response[:id]).to eq(nil)
    expect(json_response[:type]).to eq("breweries")

    expect(json_response[:attributes]).to have_key(:destination)
    expect(json_response[:attributes]).to have_key(:forecast)
    expect(json_response[:attributes][:forecast]).to be_a(Hash)
    expect(json_response[:attributes][:forecast][:summary]).to be_a(String)
    expect(json_response[:attributes][:breweries]).to be_a(Array)
    expect(json_response[:attributes][:breweries].count).to eq(5)
  end
end