class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true
  validates :username, format: {with: /\A[\w]*\z/}

  validates :username, uniqueness: true

  validates :date_of_joining, presence: true



end
