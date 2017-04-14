class Vote < ApplicationRecord
  # has_many :users
  belongs_to :work
  belongs_to :user


end
