class Vote < ApplicationRecord
  belongs_to :user_id
  belongs_to :work_id
end
