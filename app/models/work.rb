class Work < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in:%w(album movie book),
    message: "%{value} is not a valid category" }
  has_many :votes
end
