require 'rails_helper'

RSpec.describe BreweryFacade do 
  it 'returns a selected amount of breweries based on city search and qty', :vcr do 
    
    city = "denver"
    qty = 5
    brewery_results = BreweryFacade.find_breweries(city, qty)

    expect(brewery_results).to be_a(Array)
    expect(brewery_results.count).to eq(5)
    expect(brewery_results.first).to be_a(Hash)
  end
end