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
    @spot.save
    redirect_to @spot
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:location, :description, :time, :others)
  end
end
