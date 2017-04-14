class Work < ApplicationRecord

    has_many :votes
    has_many :users, through: :votes

  # def votes
  #   return Vote.find_by(work_id: @id)
  # end
  #
  # def users
  #   users = []
  #   @votes.each do |vote|
  #     users << vote.user
  #   end
  #   return users
  # end

  def index
  end

  # def has_vote_from_user(user_id)
  #   @votes.each |vote|
  #     if vote.user_id == user_id
  #       return true
  #     end
  #   end
  #   return false
  # end
end
