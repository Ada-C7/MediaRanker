class User < ApplicationRecord
  has_many :items, through: :votes 
end
