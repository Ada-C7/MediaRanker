class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :username, presence: true


  def self.all_votes
    final_votes = {}
    all_votes = self.votes
    all_votes.select!{}
    return final_votes
  end

end
