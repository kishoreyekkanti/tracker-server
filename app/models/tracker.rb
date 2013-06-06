class Tracker < ActiveRecord::Base
  attr_accessible :driver_name, :mobile_number, :imei, :truck_registration_number
  has_one :gps_tracker
end
