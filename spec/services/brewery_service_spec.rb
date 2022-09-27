require 'rails_helper'

RSpec.describe BreweryService do 
  it "retrieves brewery data from open brewery api", :vcr do 

    city = "Denver"
    qty = 5
    response = BreweryService.get_breweries(city, qty)

    expect(response).to be_a(Array)
    expect(response.count).to eq(5)
    expect(response.first).to be_a(Hash)
    expect(response.first[:name]).to be_a(String)
  end
end