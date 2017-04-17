class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  validates :user_id, :work_id, presence: true
  validates_uniqueness_of :user_id, :scope => [ :work_id ]

end
