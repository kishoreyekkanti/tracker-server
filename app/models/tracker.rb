class Tracker < ActiveRecord::Base
  attr_accessible :driver_name, :mobile_number, :imei, :truck_registration_number
  has_many :gps_trackers, :order => 'created_at DESC' ,:limit => 1

end
