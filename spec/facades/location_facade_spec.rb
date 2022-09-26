
    require 'rails_helper'

    RSpec.describe LocationFacade do 
      it 'returns coordinates for location lat/lng based on City,State search', :vcr do 

        search = "denver, co"
        coordinates = LocationFacade.find_coordinates(search)
        
        expect(coordinates).to be_a(Array)
        expect(coordinates.count).to eq(2)
        expect(coordinates.first).to be_a(Float)
        expect(coordinates.first).to eq(39.738453)
        expect(coordinates.last).to be_a(Float)
        expect(coordinates.last).to eq(-104.984853)
      end
    end