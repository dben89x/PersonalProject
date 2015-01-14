class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new
    @attendee.spot_id = params[:spot_id]
    @attendee.user_id = current_user.id
    if @attendee.save
      redirect_to spot_path(params[:spot_id])
    end
  end

end
