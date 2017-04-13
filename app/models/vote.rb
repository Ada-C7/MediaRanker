class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  def self.unique?(session_user_id, params_id)
    same_vote = Vote.where(user_id: session_user_id, work_id: params_id)
    if same_vote == []
      true
    else
      false
    end
  end

end
