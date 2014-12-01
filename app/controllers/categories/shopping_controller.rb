class Categories::ShoppingController < CategoriesController
  def index
    @cat = Cat.where(name: 'Shopping')
  end
end
