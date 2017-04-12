class Vote < ApplicationRecord
  has_a :user
  has_a :work
end
