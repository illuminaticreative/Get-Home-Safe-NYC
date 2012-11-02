class GeoEngine
  NoAddress = Class.new

  def self.address_search(address)
    res = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    res.success ? res.full_address : NoAddress
  end
end
