class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :rememberable, :trackable, :validatable, authentication_keys: [:username],
         :omniauth_providers => [:facebook]
  has_many :products

  validates_presence_of :username


  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
