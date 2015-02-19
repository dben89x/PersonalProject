class PlaceimagesController<ApplicationController
  def index
    @images = Placeimage.where()
  end

  def show
    @image = Placeimage.find(params[:id])
  end

  def new
    @place = Place.find(params[:place_id])
    @placeimage = Placeimage.new
  end

  def edit

  end

  def create
    @place = Place.find(params[:place_id])
    @placeimage = @place.placeimages.new(placeimage_params)
    if @placeimage.save
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

  def placeimage_params
    params.require(:placeimage).permit(:image)
  end

end
