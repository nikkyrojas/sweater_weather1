class WeatherFacade 
  def self.find_weather_data(location)
    weather_data = WeatherService.get_weather(location)
    
    current = CurrentWeather.new(weather_data[:current])   

    daily = weather_data[:daily][0..4].map do |day|
      DailyWeather.new(day)
    end

    hourly = weather_data[:hourly][0..7].map do |hour|
      HourlyWeather.new(hour)
    end
    
    return [current, daily, hourly]
  end
end



