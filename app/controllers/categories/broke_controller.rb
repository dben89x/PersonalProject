class Categories::BrokeController < CategoriesController
  def index
    @cat = Cat.where(name: 'Broke')
  end
end
