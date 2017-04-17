class Work < ApplicationRecord
  CATEGORIES = ["album", "movie", "book"]

  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true, uniqueness: {scope: [:category]}
  validates :category, inclusion: {
    in: CATEGORIES
  }

  # Assume no work on the site was published before 1500
  validates :publication_year, numericality: {
    only_integer: true,
    allow_nil: true,
    greater_than_or_equal_to: 1500,
    less_than_or_equal_to: Date.today.year
  }

  # returns the work with the most votes
  def self.spotlight
    return nil if Work.all.empty?
    Work.all.max_by {|work| work.votes.count}
  end

  def self.top_ten(category)
    return nil if !CATEGORIES.include?(category)
    Work.where(category: category).sort_by {|work| -work.votes.count}.first(10)
  end
end
