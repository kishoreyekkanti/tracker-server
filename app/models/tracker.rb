class Tracker < ActiveRecord::Base
  attr_accessible :driver_name, :mobile_number, :imei, :truck_registration_number
  has_many :gps_trackers, :order => 'created_at DESC', :limit => 1

  def self.search(start_date_time, end_date_time)
    joins(:gps_trackers).includes(:gps_trackers)
    .where('gps_trackers.created_at >= ? AND gps_trackers.created_at <=?', start_date_time, end_date_time)
  end
end
