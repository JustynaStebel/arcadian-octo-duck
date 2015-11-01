class AddPriceAndStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal
    add_column :products, :active, :boolean
  end
end
