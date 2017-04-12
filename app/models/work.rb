class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :votes
end
