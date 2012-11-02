class LocationCache
  def self.for_address(address)
    begin
      Location.for_address(address)
    rescue Location::NoAddress
      geo_address = GeoLocate.for_address(address)
      Location.save_address(geo_address)
    end
  end
end
