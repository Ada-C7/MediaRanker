class User < ApplicationRecord

  has_many :votes
  has_many :works

  validates :username, presence: true
  validates :username, uniqueness: true

  def duplicate_vote?(this_work_id)
    work = Work.find_by_id(this_work_id)
    duplicate = false
    work.votes.each do |vote|
      if vote.work_id == this_work_id
        return duplicate = true

      end
    end
    return duplicate

  end


end
