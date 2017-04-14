class User < ApplicationRecord
  has_many :votes
  validates :name, uniqueness: true
  validates :name, presence: true


end
