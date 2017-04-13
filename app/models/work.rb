class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :votes

  def remove_votes
    votes.each { |vote| vote.delete }
  end

  def self.top_10(category)
    Work.where(category: category).sort_by { |work| work.votes.count }.reverse[0...10]
  end
end
