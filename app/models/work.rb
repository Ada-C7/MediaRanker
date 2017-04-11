class Work < ApplicationRecord
  has_many :votes

  # validates :category, presence: true
  # validates :category, format: {with: /[a-zA-Z]+/}
  # validates :category, inclusion: {in: %w(movie book album)}

  validates :title, presence: true, uniqueness: true

  validates :creator, presence: true
  validates :creator, format: {with: /[a-zA-Z]+/}

  validates :publication_year, presence: true
  validates :publication_year, numericality: {:greater_than_or_equal_to => 0}

  def total_votes
    return self.votes.count
  end
end
