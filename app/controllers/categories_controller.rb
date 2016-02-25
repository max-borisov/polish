class CategoriesController < ApplicationController
  def index
    @categories = Category.select(:id, :title).order(id: :asc).all
  end

  def show
    @category = Category.find(params[:id])
    @records = @category.records.active
  end
end
