class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.already_created(work_id, user_id)
    Vote.where(work_id: work_id, user_id: user_id).present?
  end

  validates :work_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
