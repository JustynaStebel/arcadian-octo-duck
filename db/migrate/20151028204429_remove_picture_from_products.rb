class RemovePictureFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :picture
  end
end
