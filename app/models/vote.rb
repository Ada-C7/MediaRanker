class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :work_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def self.already_voted (work_id, user_id)
    Vote.where(user_id: user_id, work_id: work_id).present?

  end
end
