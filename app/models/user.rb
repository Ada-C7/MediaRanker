class User < ApplicationRecord
  has_many :votes
  has_many :items, through: :votes
end
