class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  # validates_uniques_of :vote, scope => [:work ]
end
