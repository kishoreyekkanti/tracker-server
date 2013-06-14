class HomeController < ApplicationController
  def map
    @tracks = Tracker.all
    @vehicle_numbers = @tracks.collect{|track| track.truck_registration_number}
    @tracks = @tracks.to_json(include: :gps_trackers).html_safe
  end

  def search
    @start_date_time = params["search"]["start_date_time"]
    @end_date_time = params["search"]["end_date_time"]
    @tracks = Tracker.search(@start_date_time.to_time, @end_date_time.to_time)
    @tracks = @tracks.to_json(include: :gps_trackers).html_safe
    render "map"
  end
end