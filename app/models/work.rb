class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :votes

  def remove_votes
    votes.each { |vote| vote.delete }
  end

  def self.top_10(category)
    Work.where(category: category).sort_by { |work| work.vote_total }.reverse[0...10]
  end

  def vote_total
    return 0 if votes.empty?
    votes.map { |vote| vote.value }.inject(:+)
  end
end
