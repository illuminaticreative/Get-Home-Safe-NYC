class LocationCache
  def self.for_address(address)
    begin
      Location.form_address(address)
    rescue Location::NoAddress
      score = GeoLocate.for_address(address)
      Location.save_address(address)
    end
  end
end
