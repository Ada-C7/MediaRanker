class User < ApplicationRecord

  has_many :votes
  has_many :works

  validates :username, presence: true
  validates :username, uniqueness: true

  def duplicate_vote?(work)
    votes = self.votes

    votes.each do |vote|
      if vote.work == work
        return true
      end
    end

  end



end
