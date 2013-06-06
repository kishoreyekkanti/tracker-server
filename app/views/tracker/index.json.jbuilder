json.array! @tracks do |track|
    json.(track, :driver_name, :mobile_number, :imei, :truck_registration_number, :created_at, :updated_at)
    json.tracks track.gps_trackers do |gps_track|
       json.(gps_track, :imei, :latitude, :longitude, :created_at)
       json.updated_at gps_track.updated_at.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata'))
    end
end