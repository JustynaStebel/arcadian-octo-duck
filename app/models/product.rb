class Product < ActiveRecord::Base
  include Filterable
  belongs_to :user
  belongs_to :category
  validates_presence_of :name, :description, :price, :active, :category_name, :category_id
  mount_uploader :image, ImageUploader
  has_many :order_items

  include PgSearch
  pg_search_scope :custom_search,
  against: [:name, :category_name, :color],
  using: { tsearch: { prefix: true } }

  #default_scope { where(active: true) }
end
