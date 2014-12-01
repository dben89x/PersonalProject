class Categories::RestaurantsController < CategoriesController
  def index
    @cat = Cat.where(name: 'Restaurants')
  end
end
