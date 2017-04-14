class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work, counter_cache: true
  validates :work_id, uniqueness: { scope: :user_id }
end
