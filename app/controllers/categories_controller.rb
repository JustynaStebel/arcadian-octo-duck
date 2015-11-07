class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

private
  def category_params
    params.require(:product).permit(:name)
  end
end
