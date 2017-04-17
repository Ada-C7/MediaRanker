class Work < ApplicationRecord
  has_many :users, through: :votes
  validates :title, presence: true
  validates :category, presence: true
end
