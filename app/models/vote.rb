class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :work, counter_cache: true

  validates_uniqueness_of :user_id, scope: :work_id, message: 'must be unique per contact'

end
