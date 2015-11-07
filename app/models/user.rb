class User < ActiveRecord::Base
  attr_accessor :username
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

protected
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value", { :value => login.downcase }]).first
  end
end
