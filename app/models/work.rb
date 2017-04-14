class Work < ApplicationRecord
  validates :title, presence: true

  # has_many :votes, through: :vote
end
