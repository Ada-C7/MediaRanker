class Work < ApplicationRecord
  has_many :users
  has_many :votes
  validates :title, presence: true
end
