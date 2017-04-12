class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :user_votes
end
