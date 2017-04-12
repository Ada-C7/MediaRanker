class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true
  validates :username, format: {with: /[a-zA-Z, 1-9, _]+/}

  validates :date_of_joining, presence: true

  def total_votes
    self.votes.length
  end

end
