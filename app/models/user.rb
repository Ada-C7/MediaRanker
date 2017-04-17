class User < ApplicationRecord
  
  has_many :works, through: :votes, source: :work
  validates :username, uniqueness: true, presence: true
end
