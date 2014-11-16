class PagesController < ApplicationController

  def index
    @spot = Spot.new
    @spots = Spot.all
  end

end
