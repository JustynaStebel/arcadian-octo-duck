class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates_presence_of :name, :description, :price, :active, :category_name, :category_id
  mount_uploader :image, ImageUploader
  has_many :order_items

  default_scope { where(active: true) }
end
