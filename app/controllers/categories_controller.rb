class CategoriesController < ApplicationController
  def index
    @cats = Cat.all
  end
end
