class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user
  # validations will go here
end
