class ProductsController < ApplicationController

  def index
    @products = Product.filter(params.slice(:name, :color, :category_name))
    @order_item = current_order.order_items.new
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @product = Product.custom_search(params[:query])
    render 'index'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, :price, :category_name, :category_id, :color)
  end

  def filtering_params(params)
    params.slice(:name, :color, :category_name)
  end


end
