class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :category, presence: true

  def already_voted?(user)
    if Vote.where(user_id: user.id, work_id: id).length != 0
      return true
    else
      return false
    end
  end

  def self.top_votes
    @works = Work.all
    sorted_array = @works.sort { |a, b| a.votes.count <=> b.votes.count}
    # raise
    return sorted_array.last
  end
end
