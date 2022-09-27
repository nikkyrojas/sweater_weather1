class BrewerySerializer
    def self.format_breweries(breweries)
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
            breweries: [

            ]
          }
        }
      }