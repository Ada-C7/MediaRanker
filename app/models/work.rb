class Work < ApplicationRecord
  has_many :votes
# validates :work_id, presence: true
#validates :user_id, presence: true

end
