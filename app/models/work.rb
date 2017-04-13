class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates_presence_of :title, uniqueness: true
  
end
