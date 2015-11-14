class ProductsController < ApplicationController

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, :price, :category_name, :category_id)
  end

end
