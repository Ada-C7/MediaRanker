class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true, inclusion: { in: %w(movie book album),
    message: "%{value} is not a valid category" }, allow_nil: false
  validates :title, presence: true
end
