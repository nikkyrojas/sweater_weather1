class BreweryFacade 
  def self.find_breweries(city, qty)
    # coordinates = LocationFacade.find_coordinates(params[:location])
    # weather = WeatherFacade.find_weather_data(coordinates)[0]
     brewery_results = BreweryService.get_breweries(city, qty)
  end
end