class RoadTripSerializer
  def self.create_roadtrip(weather, params)
        {
          data: {
            id: nil,
            type: "roadtrip",
            attributes: {
              start_city: params[:origin],
              end_city: params[:destination],
              travel_time: "2 hours, 13 minutes",
              weather_at_eta:{
                temperature: "#{weather.temperature}",
                conditions: weather.conditions
              }
            }
          }
        }
  end
end