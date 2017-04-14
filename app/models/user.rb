class User < ApplicationRecord
  has_many :votes
  has_many :works
  validates :username, presence: true, uniqueness: true

end
