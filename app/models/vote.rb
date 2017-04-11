class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :vote
  # validations will go here
end
