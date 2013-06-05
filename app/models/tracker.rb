class Tracker < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  has_one :mobile_phone

end
