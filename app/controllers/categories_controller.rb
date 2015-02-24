class CategoriesController < ApplicationController
  def index
    @cats = render json: Cat.all
  end
end
