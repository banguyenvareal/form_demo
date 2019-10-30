class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bank_accounts
  has_many :schedule_tests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      binding
      password = Devise.friendly_token[0,20]
      user = User.create!(name: access_token.info["name"],
      email: access_token.info['email'],
      password: password, password_confirmation: password
      )
    end
    user
  end

   def find_bank_accounts
    cache_key = "#{self.cache_key}/find_bank_accounts"
    # binding.pry
    Rails.cache.fetch(cache_key, expires_in: 10.minutes) do
      # binding.pry
      self.bank_accounts
    end
  end
end
