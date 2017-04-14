class Item < ApplicationRecord
  has_many :users, through: :votes
  has_many :votes
end
