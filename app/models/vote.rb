class Vote < ApplicationRecord
  belongs_to :work

  #something to validate that each person can only vote for one work
end
