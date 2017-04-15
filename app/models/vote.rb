class Vote < ApplicationRecord
  belongs_to :work,  counter_cache: true
  belongs_to :user

  validates :user_id, uniqueness: { scope: :work_id,
    message: "user: has already voted for this work" }
end
