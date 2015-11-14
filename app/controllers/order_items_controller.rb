class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(params[:order_item_params])
    @order.save
    session[:order_id] = @order.id
  end

  def new
    @order_item = @order.order_items.new(params[:order_item_params])
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :order_id, :unit_price, :total_price)
  end
end
