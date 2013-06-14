class GpsTracker < ActiveRecord::Base
  attr_accessible :imei, :latitude, :longitude
  belongs_to :tracker

end
