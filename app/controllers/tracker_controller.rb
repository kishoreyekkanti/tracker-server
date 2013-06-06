class TrackerController < ApplicationController
  def index
    @tracks = Tracker.all
  end
end
