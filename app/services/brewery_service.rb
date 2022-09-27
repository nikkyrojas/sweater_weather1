class BreweryService
  class << self

    def conn
      Faraday.new(url: 'https://api.openbrewerydb.org')
    end

    def get_breweries(city, qty)
      response = conn.get("/breweries?by_city=#{city}&per_page=#{qty}")
      JSON.parse(response.body, symbolize_names: true)
    end    
  end
end