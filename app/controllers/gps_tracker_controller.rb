class GpsTrackerController < ApplicationController
  respond_to :json

  def create
    gps_tracker = GpsTracker.create! params.slice(:imei, :latitude, :longitude)
    render :json => gps_tracker
  end

  def index

    render :json => GpsTracker.all.to_json
  end
end
