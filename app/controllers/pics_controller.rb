class PicsController<ApplicationController
  def index
    @pics = Pic.where(place_id: params[:place_id])
  end

  def show
    @pic = Pic.find(params[:id])
  end

  def new
    @place = Place.find(params[:place_id])
    @pic = Pic.new
  end

  def edit
  end

  def create
    @place = Place.find(params[:place_id])
    @pic = @place.pics.new(pic_params)
    if @pic.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def pic_params
    params.require(:pic).permit(:image)
  end

end
