require 'rails_helper'

RSpec.describe Brewery do 
  it "brewery has attributes", :vcr do 

    data = 
          {
            :id=>'342553',
            :name=>'downtown brewery',
            :brewery_type=>'pub'
          }
    brewery = Brewery.new(data)

  expect(brewery).to be_a(Brewery)
  expect(brewery.id).to be_a(String)
  expect(brewery.name).to eq('downtown brewery')
  expect(brewery.brewery_type).to eq('pub')
  end
end