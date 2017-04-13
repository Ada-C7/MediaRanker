class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :category, presence: true

  def already_voted?(user) #pass in one user object
    # #if user upvoting already voted, he/she cannot vote again
    # Vote.where(user_id: user.id, work_id: id)
    # # Vote.all.each do |vote| #vote.where
    # #   if vote.work_id == params[:work_id] && vote.user_id == user.id
    # #     user_vote_count += 1
    # #   end
    # # end

    if Vote.where(user_id: user.id, work_id: id).length != 0
      return true
    else
      return false
    end
  end

end
