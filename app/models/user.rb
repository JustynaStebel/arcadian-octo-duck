class User < ActiveRecord::Base
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
  has_many :products

  validates_presence_of :username
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(where(conditions).where(["username = :value OR lower(email) = lower(:value)", { value: login }]).first
    else
      where(conditions.to_hash).first
    end
  end
end
