class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: true

  validates :creator, presence: true
  validates :creator, format: {with: /[a-zA-Z]+/}

  validates :publication_year, presence: true
  validates :publication_year, numericality: {:greater_than_or_equal_to => 0}
  validates :publication_year, length: { is: 4}
  def total_votes
    self.votes.length
  end

  # def add_one_vote
  #   self.votes += 1
  # end


end
