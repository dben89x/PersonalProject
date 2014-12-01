class Categories::ActiveController < CategoriesController
  def index
    @cat = Cat.where(name: 'Active')
  end
end
