require_relative "../../app/services/location_cache"
require_relative "../../app/services/geo_locate"

class Location
  class NoAddress < RuntimeError; end
end

describe LocationCache do
  it "returns locations if they exist" do
    Location.stub(:for_address).with("123 elm") { "123 Elm NY, NY" }
    LocationCache.for_address("123 elm").should == "123 Elm NY, NY" 
  end

  context "when the address is not cached" do
    before do
      GeoLocate.stub(:for_address).with("123 elm") { "123 Elm NY, NY" }
      Location.stub(:for_address).with("123 elm").
        and_raise(Location::NoAddress)
      Location.stub(:save_address)
    end
    it "fetches the address" do
      LocationCache.for_address("123 elm").should == "123 Elm NY, NY" 
    end
  end
end
