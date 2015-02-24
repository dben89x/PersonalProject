class AttendeesController < ApplicationController

  def create
    @attendee = Attendee.new(
      spot_id: params[:spot_id],
      user_id: current_user.id,
      role: 'Attendee',
      attending: true,
      arrived: false
      )
    if @attendee.save
      redirect_to spot_path(params[:spot_id])
    end
  end

  def im_here
    @spot = Spot.find(params[:spot_id])
    @attendee = Attendee.find(params[:attendee_id])
    if @attendee.arrived == false
      @attendee.arrived = true
    else
      @attendee.arrived = false
    end
    if @attendee.save
      redirect_to spot_path(@spot)
    end
  end

end
