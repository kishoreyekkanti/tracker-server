class HomeController < ApplicationController
  def map
    @tracks = Tracker.all
  end
  
  
end