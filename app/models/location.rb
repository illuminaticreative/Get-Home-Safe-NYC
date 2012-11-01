class Location < ActiveRecord::Base
  attr_accessible :address, :borough_id, :latitude, :longitude, :verified, :borough
  belongs_to :borough
end
