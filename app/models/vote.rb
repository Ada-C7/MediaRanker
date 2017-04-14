class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :work_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
