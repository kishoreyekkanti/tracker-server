class HomeController < ApplicationController
  def map
    @tracks = Tracker.all
    @vehicle_numbers = @tracks.collect{|track| track.truck_registration_number}
  end

  def search
    render :text =>"Searched"
  end
end