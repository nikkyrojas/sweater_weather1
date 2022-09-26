class LocationFacade 
  def self.find_coordinates(location)
    location_results = LocationService.get_location(location)
    lat = location_results[:results][0][:locations][0][:latLng][:lat] #retrieving nested data for latitude
    lng = location_results[:results][0][:locations][0][:latLng][:lng] #retrieving nested data for longitude
    return [lat,lng] 
  end
end