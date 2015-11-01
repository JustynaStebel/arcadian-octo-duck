class Product < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :price, :active
  mount_uploader :image, ImageUploader
end
