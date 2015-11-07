class Product < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  validates_presence_of :name, :description, :price, :active
  mount_uploader :image, ImageUploader
  has_many :order_items

  default_scope { where(active: true) }
end
