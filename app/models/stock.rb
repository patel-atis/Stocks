class Stock < ApplicationRecord
  has_many :users, through: :ledger
end
