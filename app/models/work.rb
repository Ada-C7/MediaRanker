class Work < ApplicationRecord
  has_many :votes
validates :work_id, presence: true
validates :work_id, uniqueness: true
validates :user_id, presence: true

end
