require 'rails_helper'

RSpec.describe CurrentWeather do 
  it "Current weather attributes", :vcr do 
    data = 
        {
          :dt=>1664210321,
          :sunrise=>1664196679,
          :sunset=>1664239866,
          :temp=>295.98,
          :feels_like=>295.21,
          :humidity=>34,
          :uvi=>4.41,
          :visibility=>10000,
          :weather=>[
            {
            :description=>"clear sky", 
            :icon=>"01d"
            }]
        }
  weather = CurrentWeather.new(data)

  expect(weather).to be_a(CurrentWeather)
  expect(weather.temperature).to eq(295.98)
  expect(weather.feels_like).to eq(295.21)
  expect(weather.humidity).to eq(34)
  expect(weather.uvi).to eq(4.41)
  expect(weather.visibility).to eq(10000)
  expect(weather.conditions).to eq("clear sky")
  expect(weather.icon).to eq("01d")
  end
end