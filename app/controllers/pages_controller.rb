class PagesController < ApplicationController

  def index
    @spots = Spot.all
    @attendee = Attendee.new
  end

end
