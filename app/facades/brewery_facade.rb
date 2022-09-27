class BreweryFacade 
  def self.find_breweries(city, qty)
    brewery_results = BreweryService.get_breweries(city, qty)
  end
end