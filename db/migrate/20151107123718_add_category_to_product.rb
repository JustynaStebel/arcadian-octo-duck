class AddCategoryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :category_name, :string
    add_column :products, :category_id, :integer
  end
end
