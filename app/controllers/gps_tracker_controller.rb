class GpsTrackerController < ApplicationController
  respond_to :json

  def create
    tracker = Tracker.find_by_imei params[:imei]
    gps_tracker = GpsTracker.new params.slice(:imei, :latitude, :longitude)
    gps_tracker.tracker = tracker
    gps_tracker.save!
    render :json => gps_tracker
  end

  def index
    render :json => GpsTracker.all.to_json
  end
end
