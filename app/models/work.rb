class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in:%w(album movie book),
    message: "%{value} is not a valid category" }

  def self.sort_by_votes
    self.all.sort_by do |work|
      -work.votes.count
    end
  end

  def self.top_work
     self.sort_by_votes.first
  end
end
