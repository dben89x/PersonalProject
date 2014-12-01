class Categories::BoredController < CategoriesController
  def index
    @cat = Cat.where(name: 'Bored')
  end
end
