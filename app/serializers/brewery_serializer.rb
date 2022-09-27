class BrewerySerializer
    def self.format_breweries(breweries, weather)
      {
        data: {
          id: nil,
          type: 'breweries',
          attributes: {
            destination: "denver",
            forecast: {
              summary: weather.conditions,
              temperature: "#{weather.temperature}"
            },
            breweries: breweries.map do |brewery| 
              [
                {
                  id: "#{brewery[:id]}",
                  name: brewery[:name],
                  brewery_type: brewery[:brewery_type]
                }
              ]
            end
          }
        }
      }
    end
end