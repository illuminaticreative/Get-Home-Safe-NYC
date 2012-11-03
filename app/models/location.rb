class Location < ActiveRecord::Base

  attr_accessible :address, :borough_id, :latitude, :longitude, :verified, :borough, :safe, :power, :elevators_safe, :elevators_available, :heat, :water, :flooding
  attr_accessor :newly_created

  belongs_to :borough

  validates_presence_of :address, :uniqueness => true

  class NoAddress < RuntimeError
  end

  def self.for_address address
    cached_location = find_by_address(address) or raise NoAddress
    #address = cached_location.address
    cached_location
    #address.nil? ? Location::NoAddress : address
  end

  def self.save_address(address)
    #address = nil if address == Location::NoAddress
    create(:address => address)
  endx

end
