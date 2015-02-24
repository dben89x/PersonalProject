class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all.order("date")
  end

  def new
    @spot = Spot.new
  end

  def edit
  end

  def show
    @attendee = @spot.attendees.find_by_user_id(current_user.id)
    # raise @spot.attendees.map{|a| [a.id, a.user.full_name] }.inspect
  end

  def create
    @spot = Spot.new(spot_params)
    Attendee.create!(
      user: current_user,
      spot: @spot,
      role: "Attendant"
    )
    if params[:invited_friends]
      params[:invited_friends].each do |friend_id|
        Attendee.create!(
          user: User.find(friend_id),
          spot: @spot,
          role: 'Attendee'
        )
      end
    end

    if @spot.save
      redirect_to spot_path(@spot), notice: "Spot successfully created"
    else
      render :new
    end
  end

  def update
    if @spot.update(spot_params)
      redirect_to spots_path
    else
      render :edit
    end
  end

  def destroy
    @spot.destroy
    redirect_to spots_path
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:place_id, :description, :date, :start_time, :end_time)
  end
end
