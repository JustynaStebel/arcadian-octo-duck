class Product < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :description, :image
   mount_uploader :image, ImageUploader
end
