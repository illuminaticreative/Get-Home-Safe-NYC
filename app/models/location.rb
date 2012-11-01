class Location < ActiveRecord::Base
  attr_accessible :address, :borough_id, :latitude, :longitude, :verified, :borough, :safe
  belongs_to :borough

end
