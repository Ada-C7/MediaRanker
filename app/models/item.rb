class Item < ApplicationRecord
  has_many :users, through: :votes 
end
