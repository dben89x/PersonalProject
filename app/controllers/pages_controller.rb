class PagesController < PublicController

  def index
    @spots = Spot.all
    @attendee = Attendee.new
  end

end
