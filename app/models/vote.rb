class Vote < ApplicationRecord
belongs_to :work
belongs_to :user
# validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
# validates :work_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
