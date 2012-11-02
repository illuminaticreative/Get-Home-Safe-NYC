class GeoLocate
  def self.for_address(address)
    GeoEngine.address_search address
  end
end
