class Categories::BarsController < CategoriesController
  def index
    @cat = Cat.where(name: 'Bars')
  end
end
