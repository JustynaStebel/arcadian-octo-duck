class Order < ActiveRecord::Base
  has_many :order_items
  before_save :update_subtotal

  enum status: [ :cancelled, :in_progress, :completed ]

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
