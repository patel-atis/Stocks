require 'bcrypt'

class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :posts
  has_many :assets, class_name: "Ledger", foreign_key: "user_id", dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 249}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  #check if this user is following the person whose page this is
  def following?(user)
    followers.include?(user)
  end

  #follow another User
  def follow(user)
    followers << user
  end

  #unfollow current User
  def unfollow(user)
    followers.delete(user)
  end

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
