class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes
  validates :username, presence: true, uniqueness: true, length: 2..10, allow_blank: false
end
