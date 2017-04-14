class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :category, inclusion: { in: ["book", "movie", "album"] }

  def self.category_sorted(category)
    return where(category: category).order(votes_count: :desc)
  end

  def self.top_ten(category)
    return category_sorted(category).limit(10)
  end

  def self.spotlight
    return all.order(votes_count: :desc).first
  end
end
