class Work < ApplicationRecord
  has_many :votes, :dependent => :destroy

  validates :category, presence: true, inclusion: { in: %w(movie book album),
    message: "%{value} is not a valid category" }, allow_nil: false
    validates :title, presence: true

  # returns the first work object with the most votes: class method
  def self.spotlight
    return all.order(votes_count: :desc).first
  end
end
