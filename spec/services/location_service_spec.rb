require 'rails_helper'

RSpec.describe LocationService do 
  it "retrieves location data from map quest api", :vcr do 

    search = "Denver, CO"
    response = LocationService.get_location(search)

    expect(response).to be_a(Hash)
    expect(response[:results]).to be_a(Array)
    expect(response[:results][0][:locations][0]).to have_key(:latLng)
    expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
    expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
  end
end