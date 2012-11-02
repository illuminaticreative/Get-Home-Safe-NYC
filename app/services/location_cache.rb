class LocationCache
  def self.for_address(address)
    begin
      location = Location.for_address(address)
    rescue Location::NoAddress
      geo_address = GeoLocate.for_address(address)
      location = Location.find_by_address(geo_address)
      location.nil? ? Location.save_address(geo_address) : location
    end
  end
end
