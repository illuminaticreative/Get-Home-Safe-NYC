class LocationCache
  def self.for_address(address)
    begin
      location = Location.for_address(address)
    rescue Location::NoAddress
      geo_address = GeoLocate.for_address(address)
      location = Location.save_address(geo_address)
    end
  end
end
