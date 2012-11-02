class GeoEngine

  def self.address_search(address)
    ny_bounds = Geokit::Geocoders::GoogleGeocoder.geocode('New York').suggested_bounds
    res = Geokit::Geocoders::GoogleGeocoder.geocode(address, :bias => ny_bounds)
    res.success && res.zip.present? && Zip.where(zipcode:res.zip).exists? ? res.full_address : nil
  end
end
