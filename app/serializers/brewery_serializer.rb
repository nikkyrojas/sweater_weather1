class BrewerySerializer
    def self.format_breweries(breweries)
      binding.pry
      {
        data: {
          id: nil,
          type: 'breweries',
          attributes: {
            destination: "denver",
            forecast: {
              summary: "Cloudy with a chance of meatballs",
              temperature: "83 F"
            },
            breweries: breweries.map do |brewery| 
              [
                {
                  id: "#{brewery.id}",
                  name: brewery.name,
                  brewery_type: brewery.brewery_type
                }
            ]
            end
          }
        }
      }
    end
end