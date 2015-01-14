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
  end

  def create
    @spot = Spot.new(spot_params)
    Attendee.create!{
      user_id = current_user.id
      spot_id = @spot.id
      role = "Attendant"
    }
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
