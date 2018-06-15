class Stock < ApplicationRecord
  has_many :owners, through: :ledger
  has_many :posts
end
