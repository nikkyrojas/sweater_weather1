class Location 

  attr_reader :latitude,
              :longitude,
              :location

  def initialize(data)
    @latitude = data[:latLng][:lat]
    @longitude = data[:latLng][:lng]
    @location = [@latitude, @longitude]
  end
end