class Truck < ActiveRecord::Base
  attr_accessible :driver_name, :registration_number, :mobile_phone
  has_one :mobile_phone

  def truck_id
    self.id
  end

  def truck_id=(val)
    self.id = val
  end
end
