class User < ApplicationRecord
  validates :username, uniqueness: true
  # has_many :votes, through: :vote
end
