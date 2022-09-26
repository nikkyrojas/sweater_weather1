class LocationService 
  class << self
    def conn 
      Faraday.new(url: "http://www.mapquestapi.com")
    end

    def get_location(location)
      response = conn.get("/geocoding/v1/address?key=#{ENV["location_api_key"]}&location=#{location}")
      parsed = JSON.parse(response.body, symbolize_names: true)
    end
  end
end