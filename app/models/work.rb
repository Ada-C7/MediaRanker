class Work < ApplicationRecord

  has_many :votes
  belongs_to :user
  
end
