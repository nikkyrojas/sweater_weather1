class RoadTripSerializer
  def self.create_roadtrip(weather, params)
        {
          data: {
            id: null,
            type: "roadtrip",
            attributes: {
              start_city: "Denver, CO",
              end_city: "Estes Park, CO",
              travel_time: "2 hours, 13 minutes"
              weather_at_eta: {
                temperature: "#{weather.temperature}",
                conditions: weather.conditions
              }
            }
          }
        }
  end
end