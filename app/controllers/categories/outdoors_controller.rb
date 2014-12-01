class Categories::OutdoorsController < CategoriesController
  def index
    @cat = Cat.where(name: 'Outdoors')
  end
end
