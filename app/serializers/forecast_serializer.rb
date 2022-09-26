class ForecastSerializer
    def self.forecast(weather)
      {
        data: {
          id: nil,
          type: 'forecast',
          attributes: {
            current_weather:
            {
              datetime: weather[0].datetime,
              sunrise: weather[0].sunrise,
              sunset: weather[0].sunset,
              temperature: weather[0].temperature,
              feels_like: weather[0].feels_like,
              humidity: weather[0].humidity,
              uvi: weather[0].uvi,
              visibility: weather[0].visibility,
              conditions: weather[0].conditions,
              icon: weather[0].icon
            },
            daily_weather: weather[1].map do |day|
            {
              date: day.date,
              sunrise: day.sunrise,
              sunset: day.sunset,
              max_temp: day.max_temp,
              min_temp: day.min_temp,
              conditions: day.conditions,
              icon: day.icon
            }
            end,
            hourly_weather: weather[2].map do |hour|
              {
                time: hour.time,
                temperature: hour.temperature,
                conditions: hour.conditions,
                icon: hour.icon
              }
            end
          }
        }
      }
    end
end

  