class Stock < ApplicationRecord
  has_many :ledgers
  has_many :owners, through: :ledgers
  has_many :posts
end
