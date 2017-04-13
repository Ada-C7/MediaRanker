class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :votes

  def remove_votes
    votes.each { |vote| vote.delete }
  end
end
