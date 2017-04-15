class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true, uniqueness: true

  def voted_on?(work_id)
    votes.map { |vote| vote.work_id }.include? work_id
  end
end
