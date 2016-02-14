class CategoriesController < ApplicationController
  def index
    @categories = Category.select(:id, :title).order(id: :asc).all
  end
end
