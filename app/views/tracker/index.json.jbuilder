json.array! @tracks do |track|
    json.(track, :driver_name, :mobile_number, :imei, :truck_registration_number, :created_at, :updated_at)
    json.tracks track.gps_trackers do |gps_track|
       json.(gps_track, :imei, :latitude, :longitude, :created_at, :updated_at)
    end
end