class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, authentication_keys: [:username]
  has_many :products

  validates_presence_of :username


  def email_required?
    false
  end

  def email_changed?
    false
  end
end
