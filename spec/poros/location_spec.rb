require 'rails_helper'

RSpec.describe Location do 
  it "location has attributes", :vcr do 

    data = 
        {:latLng=>
          {
            :lat=>39.738453,
            :lng=>-104.984853
          }
        }

    location = Location.new(data)

  expect(location).to be_a(Location)
  expect(location.latitude).to eq(39.738453)
  expect(location.longitude).to eq(-104.984853)
  expect(location.location).to eq([39.738453,-104.984853])
  end
end