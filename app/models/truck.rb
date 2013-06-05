class Truck < ActiveRecord::Base
  attr_accessible :driver_name, :registration_number
  has_one :mobile_phone
end
