class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user, presence: true
  validates :work, presence: true
  validates :id, uniqueness: true
end
