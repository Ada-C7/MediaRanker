class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user
  # this will make sure the combo of user_id and work_id are unique
  validates :user_id, :uniqueness => {:scope => :work_id}
end
