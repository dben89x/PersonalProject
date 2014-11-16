class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all
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
    if @spot.save
      redirect_to spots_path
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

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:location, :description, :time, :others)
  end
end