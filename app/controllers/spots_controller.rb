class SpotsController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def show
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.save
    redirect_to @spot
  end

  def set_task
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:location, :others)
  end
end
