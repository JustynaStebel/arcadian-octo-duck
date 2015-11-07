class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @product = Product.new
  end

  def show
    @category = Category.find(params[:id])
  end

private
  def category_params
    params.require(:category).permit(:name)
  end
end
