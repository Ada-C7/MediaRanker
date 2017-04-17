class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w(album book movie), message: "%{value} should be either an album, book, or movie." }
  validates :creator, presence: true

  def vote_count
    count = self.votes.count
  end

  def self.top_work
    works = Work.all
    spotlight = works.max_by do |work|
      work.vote_count
    end
    return spotlight
  end
end
