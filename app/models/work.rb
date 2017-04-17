class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true
  validates :category, inclusion: {
    in: ["album", "movie", "book"]
  }

  # Assume no work on the site was published before 1500
  validates :publication_year, numericality: {
    only_integer: true,
    allow_nil: true,
    greater_than_or_equal_to: 1500,
    less_than_or_equal_to: Date.today.year
  }
end
