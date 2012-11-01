class Location < ActiveRecord::Base
  attr_accessible :address, :borough_id, :latitude, :longitude, :verified, :borough, :safe, :elevators_safe, :elevators_available
  belongs_to :borough

end
