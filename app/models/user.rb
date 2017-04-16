class User < ApplicationRecord
  has_many :votes
  validates :name, presence: true, length: { minimum: 1, message: "username: can't be blank"  }
end
