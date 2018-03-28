require 'bcrypt'

class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :posts
  has_many :stocks, through: :ledger
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  #return digest of given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #return random token for cookies
  def User.new_token
    SecureRandom.urlsafe_base64
  end


  def remember
    self.remember_token = User.new_token
    update_attribute(:rem_hash, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if rem_hash.nil?
    BCrypt::Password.new(rem_hash).is_password?(remember_token)
  end

  def forget
    update_attribute(:rem_hash, nil)
  end
end
