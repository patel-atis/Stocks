class User < ApplicationRecord
  has_many :posts
  has_many :stocks, through: :ledger
end
