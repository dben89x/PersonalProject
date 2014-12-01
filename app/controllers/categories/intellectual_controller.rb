class Categories::IntellectualController < CategoriesController
  def index
    @cat = Cat.where(name: 'Intellectual')
  end
end
