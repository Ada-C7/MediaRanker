class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work, :counter_cache => true, optional: true

end
