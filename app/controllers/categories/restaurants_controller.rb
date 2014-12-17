class Categories::RestaurantsController < CategoriesController
  def index
    @cat = Cat.where(name: 'Restaurants')
    @map = GoogleAPI.new
  end
end
