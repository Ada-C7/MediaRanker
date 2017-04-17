class User < ApplicationRecord
  has_many :trips
  has_many :users, through: :votes
end
