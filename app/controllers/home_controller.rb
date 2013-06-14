class HomeController < ApplicationController
  def map
    @tracks = Tracker.all
    @vehicle_numbers = @tracks.collect{|track| track.truck_registration_number}
    @tracks = @tracks.to_json(include: :gps_trackers).html_safe
  end

  def search
    start_date_time = params["search"]["start_date_time"].to_time
    end_date_time = params["search"]["end_date_time"].to_time
    vehicle_number = params["search"]["vehicle_number"]
    @tracks = Tracker.joins(:gps_trackers).includes(:gps_trackers).where("gps_trackers.created_at >= ? AND gps_trackers.created_at <=? AND truck_registration_number = ?", start_date_time, end_date_time, vehicle_number)
    @tracks = @tracks.to_json(include: :gps_trackers).html_safe
    #@tracks = @tracks.to_json.html_safe
    @vehicle_numbers = Tracker.pluck(:truck_registration_number)
    render "map"
  end
end