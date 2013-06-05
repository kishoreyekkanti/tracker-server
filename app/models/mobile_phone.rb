class MobilePhone < ActiveRecord::Base
  attr_accessible :imei, :number, :truck_id, :tracker_id
  belongs_to :truck
  belongs_to :tracker
end
