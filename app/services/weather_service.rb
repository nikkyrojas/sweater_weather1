class WeatherService 
  class << self
    def conn 
      Faraday.new(url: "https://api.openweathermap.org")
    end

    def get_weather(location)
      response = conn.get("/data/3.0/onecall?lat=#{location.first}&lon=#{location.last}&appid=#{ENV["weather_api_key"]}")
      parsed = JSON.parse(response.body, symbolize_names: true)
    end
  end
end



