class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in:%w(album movie book),
    message: "%{value} is not a valid category" }
end
