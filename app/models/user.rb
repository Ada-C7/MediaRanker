class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates_presence_of :name
end
