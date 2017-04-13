class Vote < ApplicationRecord
  # has_many :users
  belongs_to :users
  belongs_to :works

end
