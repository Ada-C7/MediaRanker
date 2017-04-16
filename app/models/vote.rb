class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :vote, uniqueness: { scope: [:work] }

  # validates_uniques_of :vote, scope => [:work ]
end
